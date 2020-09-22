package com.kh.am.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;

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
	public Store status(int memberNo) {
		return sqlSession.selectOne("memberMapper.status", memberNo);
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
	public int signUpEmployer(Store store) {
		return sqlSession.insert("memberMapper.signUpEmployer", store);
	}

	/** 회원가입_이메일 인증
	 * @param memberEmail
	 */
	public void signUpEmail(String memberEmail) {
		sqlSession.update("memberMapper.signUpEmail", memberEmail);
	}
	
	/** 마이페이지_회원정보 수정
	 * @param map
	 * @return result
	 */
	public int updateMemberAction(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateMemberAction" , map);
	}
	
	/** 마이페이지_가게정보 수정
	 * @param map
	 * @return result
	 */
	public int updateStoreAction(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateStoreAction" , map);
	}

	/** 마이페이지_비밀번호 일치확인
	 * @param memberNo
	 * @return savePwd
	 */
	public String selectPwd(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPwd", memberNo);
	}

	/** 마이페이지_비밀번호 수정
	 * @param loginMember
	 * @return result
	 */
	public int updatePwdAction(Member loginMember) {
		return sqlSession.update("memberMapper.updatePwdAction", loginMember);
	}

	/** 마이페이지_회원 탈퇴
	 * @param loginMember
	 * @return result
	 */
	public int secessionAction(Member loginMember) {
		return sqlSession.update("memberMapper.secessionAction", loginMember.getMemberNo());
	}

	


}
