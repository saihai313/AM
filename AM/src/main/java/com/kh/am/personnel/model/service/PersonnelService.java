package com.kh.am.personnel.model.service;

import java.util.List;

import com.kh.am.personnel.model.vo.EmployeeInfo;
import com.kh.am.personnel.model.vo.ListInfo;

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
}
