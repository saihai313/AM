package com.kh.am.management.model.service;

import java.util.List;

import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;

public interface PayStubService {

	/* public abstract PageInfo pagination(int type, int cp); */
	
	//급여명세서 리스트 조회
	public abstract List<PayStub> seleceList(int memberNo);

	//급여상세조회
	public abstract PayStub selectone(int memberNo);

	
	//급여명세서 리스트 조회
	public abstract List<Paystubplus> requestlist(int memberNo);

	//급여정정 상세조회
	public abstract Paystubplus requeston(int memberNo);

}
