package com.kh.am.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.dao.PayDAO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDAO payDAO;
	
	
	// 알바생 조회 Service 구현
	@Override
	public List<Member> selectEmployeeList(int storeNo) {
		return payDAO.selectEmployeeList(storeNo);
	}

	
	// 알바생 이번달 총 근무시간, 총 근무일수 조회 Service 구현
	@Override
	public WorkCalendar selectEmployeeWork(int memberNo) {
		return payDAO.selectEmployeeWork(memberNo);
	}

	// 알바생 일주일 근무시간 조회 Service 구현
	@Override
	public int selectOneDay(int memberNo) {
		return payDAO.selectOneDay(memberNo);
	}
	
}
