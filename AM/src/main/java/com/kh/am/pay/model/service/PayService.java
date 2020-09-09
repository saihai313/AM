package com.kh.am.pay.model.service;

import java.util.List;

import com.kh.am.member.model.vo.Member;

public interface PayService {

	/** 알바생 조회 Service
	 * @param memberNo
	 * @return eList
	 */
	public abstract List<Member> selectEmployeeList(int memberNo);

}
