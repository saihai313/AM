package com.kh.am.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.member.model.dao.MemberDAO;
import com.kh.am.member.model.vo.Employer;
import com.kh.am.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcPwd;

	
	// 로그인_회원 정보
	@Override
	public Member login(Member member) {
		
		Member loginMember = memberDAO.login(member);
		
		if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			loginMember = null;
		}else {
			loginMember.setMemberPwd(null);
		}
		
		return loginMember;
	}
	
	// 로그인_사장님 정보
	@Override
	public Employer status(int memberNo) {
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
	public int signUpEmployer(Employer employer, String memberEmail) {
		
		int memberNo = (int)((memberDAO.memberNo(memberEmail)).getMemberNo());
		
		int result = 0;
		if(memberNo != 0) {
			
			employer.setEmployerNo(memberNo);
			result = memberDAO.signUpEmployer(employer);
		}
		return result;
	}

	
	
}
