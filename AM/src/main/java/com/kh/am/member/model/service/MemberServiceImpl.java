package com.kh.am.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.member.model.dao.MemberDAO;
import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;

	
	// 로그인_회원 정보
	@Override
	public Member login(Member member) {

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
	
	// 로그인_사장님 정보
	@Override
	public Store status(int memberNo) {
		return memberDAO.status(memberNo);
	}
	
	// 회원가입_아이디 중복 검사
	@Override
	public int emailDupCheck(String memberEmail) {
		return memberDAO.emailDupCheck(memberEmail);
	}

	// 회원가입_공통 정보
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int signUpMember(Member signUpMember) {
		
		String encoPwd = bcPwd.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encoPwd);
		
		int result = memberDAO.signUpMember(signUpMember);
		
		return result;
	}
	
	// 회원가입_사장님 정보
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int signUpEmployer(Store store, String memberEmail) {
		
		int memberNo = (int)((memberDAO.memberNo(memberEmail)).getMemberNo());
		
		int result = 0;
		if(memberNo != 0) {
			
			store.setMemberNo(memberNo);
			result = memberDAO.signUpEmployer(store);
		}
		return result;
	}

	// 회원가입_이메일 인증 확인
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void signUpEmail(String memberEmail) {
		memberDAO.signUpEmail(memberEmail);
	}
	
	
	
}
