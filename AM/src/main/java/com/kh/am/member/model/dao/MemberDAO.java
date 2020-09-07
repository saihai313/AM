package com.kh.am.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.member.model.vo.Employer;
import com.kh.am.member.model.vo.Member;

@Repository 
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인
	 * @param member
	 * @return loginMember
	 */
	public Member login(Member member) {
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}

	/** 로그인_사장님 정보
	 * @param memberNo
	 * @return loginEmployer
	 */
	public Employer status(int employerNo) {
		return sqlSession.selectOne("memberMapper.status", employerNo);
	}
	
	/** 회원가입_아이디 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	public int emailDupCheck(String memberEmail) {
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}

	/** 회원가입_공통 정보
	 * @param signUpMember
	 * @return result
	 */
	public int signUpMember(Member signUpMember) {
		return sqlSession.insert("memberMapper.signUpMember", signUpMember);
	}

	/** 회원가입_회원번호 조회
	 * @param memberEmail
	 * @return memberNo
	 */
	public Member memberNo(String memberEmail) {
		return sqlSession.selectOne("memberMapper.memberNo", memberEmail);
	}
	
	/** 회원가입_사장님 정보
	 * @param employer
	 * @return result
	 */
	public int signUpEmployer(Employer employer) {
		return sqlSession.insert("memberMapper.signUpEmployer", employer);
	}


}
