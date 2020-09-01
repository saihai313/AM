package com.kh.am.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.am.member.model.dao.MemberDAO;
import com.kh.am.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcPwd;

	
	// 로그인
	@Override
	public Member login(Member member) {
		
		Member loginMember = memberDAO.login(member);
		
//		if(loginMember != null) {
//			
//			// 암호화 비밀번호랑 비교하는것. 회원가입 후 코드작성하기
//		}else {
//			loginMember.setMemberPwd(null);
//		}
		
		return loginMember;
	}
	
	
}
