package com.kh.am.management.model.service;

import java.util.List;

import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;

public interface PayStubService {

	public abstract PageInfo pagination(int type, int cp);

	public abstract List<PayStub> seleceList(PageInfo pInfo);

}
