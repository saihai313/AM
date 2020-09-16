package com.kh.am.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.dao.PayDAO;
import com.kh.am.pay.model.vo.Pay;

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

	
	// 알바생 총급여, 주휴수당 조회 Service 구현
	@Override
	public Pay selectOnePay(Pay pay) {
		return payDAO.selectOnePay(pay);
	}

	
	// 급여 등록 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertPay(Pay pay) {
		return payDAO.insertPay(pay);
	}
	
	
	// 급여명세서 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updatePayAction(Pay pay) {
		return payDAO.updatePay(pay);
	}

	
	
}
