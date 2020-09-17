package com.kh.am.personnel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

		List<EmployeeInfo> personnelList = personnelDAO.selectList(storeNo);
		
		
		return personnelList;
	}

	// 직원 상세정보 조회
	@Override
	public EmployeeInfo selectInfo(int memberNo) {

		EmployeeInfo eInfo = personnelDAO.selectInfo(memberNo);
		
		
		return eInfo;
	}

	
	// 직원 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deletePersonnel(int memberNo) {

		return personnelDAO.deletePersonnel(memberNo);
	}

	


}
