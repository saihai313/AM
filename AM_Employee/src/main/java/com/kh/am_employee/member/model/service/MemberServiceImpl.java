package com.kh.am_employee.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am_employee.member.model.dao.MemberDAO;
import com.kh.am_employee.member.model.vo.CurrentSalary;
import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.MemberAuth;
import com.kh.am_employee.member.model.vo.Store;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;

	
	// 로그인
	@Override
	public Member login(Member member) {
		//System.out.println(bcPwd.encode(member.getMemberPwd()));
		
		Member loginMember = memberDAO.login(member);
		
		if(loginMember != null) {
			
			if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				loginMember = null;
				
			}else {
				loginMember.setMemberPwd(null);
			}
		}
		return loginMember;
	}
	
	// 로그인_가게 정보
	@Override
	public Store loginStore(int memberNo) {
		return memberDAO.loginStore(memberNo);
	}


	// 회원가입_인증 확인
	@Override
	public MemberAuth certificate(String memberEmail) {
		
		// 1) 인증 여부
		MemberAuth auth = memberDAO.certificate(memberEmail);
		
		// 2) 이메일 중복 검사
		Member member = memberDAO.emailDupCheck(memberEmail);
		
		if(member != null) {
			auth.setAuthCheck("D");
		}
		
		return auth;
	}

	
	// 회원가입_공통 정보
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int signUpMember(Member signUpMember, MemberAuth auth) {
				
		String encoPwd = bcPwd.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encoPwd);

		int result = memberDAO.signUpMember(signUpMember);
		
		return result;
	}

	// 회원가입_알바정보
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int signUpEmployee(MemberAuth auth) {
		
		int memberNo = (int)((memberDAO.memberNo(auth.getAuthEmail())).getMemberNo());
		int result = 0;
		
		if(memberNo != 0) {
			
			
			CurrentSalary cs = memberDAO.currentMinSalary();
			System.out.println(cs.getCurrentMinSalary());
			
			if(cs.getCurrentMinSalary() != 0) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("memberNo", memberNo);
				map.put("storeNo", auth.getStoreNo());
				map.put("currentMinSalary", cs.getCurrentMinSalary());
				
				result = memberDAO.signUpEmployee(map);
			}
			
		}
		
		return result;
	}

	// 마이페이지_회원정보 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateMemberAction(int memberNo, String memberPhone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("memberPhone", memberPhone);
		
		return memberDAO.updateMemberAction(map);
	}

	// 마이페이지_비밀번호 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updatePwdAction(Member loginMember, String newPwd) {
		
		String savePwd = memberDAO.selectPwd(loginMember.getMemberNo());
		
		int result = 0;
		
		if(savePwd != null) {
			if(bcPwd.matches(loginMember.getMemberPwd(), savePwd)) {
				
				String encPwd = bcPwd.encode(newPwd);
				loginMember.setMemberPwd(encPwd);
				
				result = memberDAO.updatePwdAction(loginMember);
			}
		}
		return result;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int secessionAction(Member loginMember, String memberPwd) {

		String savePwd = memberDAO.selectPwd(loginMember.getMemberNo());
		int result = 0;
		
		if(savePwd != null) {
			if(bcPwd.matches(loginMember.getMemberPwd(), savePwd)) {
				
				result = memberDAO.secessionAction(loginMember);
			}
		}
		
		return result;
	}
	
	

	
}
