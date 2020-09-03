package com.kh.am.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.management.model.dao.PayStubDAO;
import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;

@Service
public class PayStubServiceImpl implements PayStubService {

	@Autowired
	private PayStubDAO paystubDAO;
	
	@Autowired
	private PageInfo pInfo;
	
	//급여명세서 리스트 조회
	@Override
	public PageInfo pagination(int type, int cp) {
		
		int listCount=paystubDAO.paytublistCount(type);
		
		pInfo.setPageInfo(cp,listCount,type);
		return pInfo;
	}

	@Override
	public List<PayStub> seleceList(PageInfo pInfo) {
		
		return paystubDAO.selectList(pInfo);
	}
}
