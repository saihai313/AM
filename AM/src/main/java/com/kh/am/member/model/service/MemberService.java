package com.kh.am.member.model.service;

import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;

public interface MemberService {

	/** 로그인_회원 정보
	 * @param member
	 * @return loginMember
	 */
	Member login(Member member);

	/** 로그인_사장님 정보
	 * @param memberNo
	 * @return loginEmployer
	 */
	Store status(int memberNo);
	
	/** 회원가입_아이디 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	int emailDupCheck(String memberEmail);

	/** 회원가입_공통 정보
	 * @param signUpMember
	 * @return result
	 */
	int signUpMember(Member signUpMember);

	/** 회원가입_사장님 정보
	 * @param employer
	 * @param memberEmail 
	 * @return result
	 */
	int signUpEmployer(Store store, String memberEmail);

	/** 회원가입_이메일 인증 확인
	 * @param memberEmail
	 */
	void signUpEmail(String memberEmail);

	int updateMemberAction(int memberNo, String memberPhone);

	int updateStoreAction(int memberNo, String storePhone);

	int updatePwdAction(Member loginMember, String newPwd);

	int secessionAction(Member loginMember, String memberPwd);


}
