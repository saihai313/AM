package com.kh.am_employee.member.model.service;

import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.MemberAuth;
import com.kh.am_employee.member.model.vo.Store;

public interface MemberService {

	/** 로그인
	 * @param member
	 * @return loginMember
	 */
	Member login(Member member);
	
	/** 로그인_가게정보
	 * @param memberNo
	 * @return loginStore
	 */
	Store loginStore(int memberNo);

	/** 회원가입_인증 확인
	 * @param memberEmail
	 * @return auth
	 */
	MemberAuth certificate(String memberEmail);

	/** 회원가입_공통 정보
	 * @param signUpMember
	 * @param auth 
	 * @return result
	 */
	int signUpMember(Member signUpMember, MemberAuth auth);

	/** 회원가입_알바 정보
	 * @param signUpMember
	 * @param auth
	 * @return result
	 */
	int signUpEmployee(MemberAuth auth);

	/** 마이페이지_회원정보 수정
	 * @param memberNo
	 * @param memberPhone
	 * @return result
	 */
	int updateMemberAction(int memberNo, String memberPhone);

	/** 마이페이지_비밀번호 수정
	 * @param loginMember
	 * @param newPwd
	 * @return result
	 */
	int updatePwdAction(Member loginMember, String newPwd);

	/** 마이페이지_회원 탈퇴
	 * @param loginMember
	 * @param memberPwd
	 * @return result
	 */
	int secessionAction(Member loginMember, String memberPwd);

	

}
