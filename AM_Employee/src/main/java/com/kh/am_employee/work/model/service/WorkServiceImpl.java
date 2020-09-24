package com.kh.am_employee.work.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am_employee.work.model.dao.WorkDAO;
import com.kh.am_employee.work.model.vo.WorkCalendar;

@Service
public class WorkServiceImpl implements WorkService{
	
	@Autowired
	private WorkDAO workDAO;

	// 알바생 스케줄 조회
	@Override
	public List<WorkCalendar> workCalendar(int memberNo) {
		return workDAO.workCalendar(memberNo);
	}

	// 전체 스케줄 조회
	@Override
	public List<WorkCalendar> workCalendar2(int storeNo) {
		return workDAO.workCalendar2(storeNo);
	}
	
	

}
