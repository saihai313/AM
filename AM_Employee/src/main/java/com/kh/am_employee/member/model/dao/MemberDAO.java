package com.kh.am_employee.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am_employee.member.model.vo.CurrentSalary;
import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.MemberAuth;
import com.kh.am_employee.member.model.vo.Store;

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
	
	/** 로그인_가게 정보
	 * @param memberNo
	 * @return loginStore
	 */
	public Store loginStore(int memberNo) {
		return sqlSession.selectOne("memberMapper.loginStore", memberNo);
	}

	/** 회원가입_인증 확인
	 * @param memberEmail
	 * @return ctf
	 */
	public MemberAuth certificate(String memberEmail) {
		return sqlSession.selectOne("memberMapper.certificate", memberEmail);
	}
	
	/** 회원가입_이메일 중복 검사
	 * @param memberEmail
	 * @return member
	 */
	public Member emailDupCheck(String memberEmail) {
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
	 * @param ctfEmail
	 * @return memberNo
	 */
	public Member memberNo(String authEmail) {
		return sqlSession.selectOne("memberMapper.memberNo", authEmail);
	}

	/** 회원가입_알바생 정보
	 * @param map
	 * @return
	 */
	public int signUpEmployee(Map<String, Object> map) {
		return sqlSession.insert("memberMapper.signUpEmployee", map);
	}
	
	/** 최저 시급 조회
	 * @return currentMinSalary
	 */
	public CurrentSalary currentMinSalary() {
		return sqlSession.selectOne("memberMapper.currentMinSalary");
	}


	/** 마이페이지_회원정보 수정
	 * @param map
	 * @return result
	 */
	public int updateMemberAction(Map<String, Object> map) {
		return sqlSession.update("memberMapper.updateMemberAction" , map);
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
