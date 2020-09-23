package com.kh.am.personnel.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;

import com.kh.am.personnel.model.vo.EmployeeInfo;

public interface PersonnelService {


	/** 사장 가게번호 조회
	 * @param memberNo
	 * @return
	 */
	int selectStoreNo(int memberNo);

	/** 직원목록 조회
	 * @param storeNo
	 * @return
	 */
	List<EmployeeInfo> selectList(int storeNo);

	/** 직원 상세정보 조회
	 * @param memberNo
	 * @return
	 */
	EmployeeInfo selectInfo(int memberNo);

	/** 직원 삭제
	 * @param memberNo
	 * @return
	 */
	int deletePersonnel(int memberNo);

	/** 시급 수정
	 * @param memberNo, sal
	 * @return
	 */
	int updateHourlyWage(int memberNo, int sal);

	/** 알바생 추가
	 * @param employeeEmail
	 * @param storeNo
	 * @return
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	int inserAuthKey(String employeeEmail, int storeNo, String authKey) throws MessagingException, UnsupportedEncodingException;

	/** 알바생 인증키 업데이트
	 * @param employeeEmail
	 * @param authKey
	 * @return
	 */
	int updateAuthKey(String employeeEmail, String authKey);
}
