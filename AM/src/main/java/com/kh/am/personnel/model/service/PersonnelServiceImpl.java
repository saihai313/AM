package com.kh.am.personnel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.personnel.model.dao.PersonnelDAO;
import com.kh.am.personnel.model.vo.EmployeeInfo;
import com.kh.am.personnel.model.vo.ListInfo;


@Service
public class PersonnelServiceImpl implements PersonnelService{

	@Autowired
	private PersonnelDAO personnelDAO;
	
	
	
	// 사장님 가게 번호 조회
	@Override
	public int selectStoreNo(int memberNo) {
		
		int storeNo = personnelDAO.selectStoreNo(memberNo);
		
		return storeNo;
	
	}


	// 직원 목록조회
	@Override
	public List<EmployeeInfo> selectList(int storeNo) {

		List<EmployeeInfo> elmployeeList = personnelDAO.selectList(storeNo);
		
		
		return elmployeeList;
	}

	


}
