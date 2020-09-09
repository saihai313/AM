package com.kh.am.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.dao.PayDAO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDAO payDAO;
	
	
	// 알바생 조회 Service 구현
	@Override
	public List<Member> selectEmployeeList(int memberNo) {
		return payDAO.selectEmployeeList(memberNo);
	}
	
}
