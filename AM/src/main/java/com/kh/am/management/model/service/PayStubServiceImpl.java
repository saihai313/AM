package com.kh.am.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.management.model.dao.PayStubDAO;
import com.kh.am.management.model.vo.CorrectionReply;
import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;

@Service
public class PayStubServiceImpl implements PayStubService {

	@Autowired
	private PayStubDAO paystubDAO;
	
	@Autowired
	private PageInfo pInfo;
	

	/*
	 * @Override public PageInfo pagination(int type, int cp) {
	 * 
	 * int listCount=paystubDAO.paytublistCount(type);
	 * 
	 * pInfo.setPageInfo(cp,listCount,type); return pInfo; }
	 */
	//급여명세서 리스트 조회
	@Override
	public List<PayStub> seleceList(int memberNo) {
		
		return paystubDAO.selectList(memberNo);
	}

	//급여명세서 상세조회 
	@Override
	public PayStub selectone(int memberNo) {
		System.out.println("1111111");
		return paystubDAO.selectone(memberNo);
	}
	
	//급여정정리스트 조회 
	@Override
	public List<Paystubplus> requestlist(int memberNo) {
		
		return paystubDAO.requestlist(memberNo);
	}

	//급여정정리스트 상세조회
	@Override
	public Paystubplus requeston(int corrNo) {
		
		return paystubDAO.requestone(corrNo);
	}
	
	//상태 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int correction(int corrNo) {
		// TODO Auto-generated method stub
		return paystubDAO.correction(corrNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int transmit(CorrectionReply cr) {
		// TODO Auto-generated method stub 
		return paystubDAO.transmit(cr);
	}

	@Override
	public List<Paystubplus> requestMonthlist(PayStub pmonth) {
		// TODO Auto-generated method stub
		return paystubDAO.requestMonthlist(pmonth);
	}


}
