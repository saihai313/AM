package com.kh.am.management.model.service;

import java.util.List;

import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;

public interface PayStubService {

	public abstract PageInfo pagination(int type, int cp);

	public abstract List<PayStub> seleceList(PageInfo pInfo);

	//급여상세조회
	public abstract Paystubplus selectone(int boardNo);

}
