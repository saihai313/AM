package com.kh.am.pay.model.service;

import java.util.Date;
import java.util.List;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.vo.Pay;

public interface PayService {

	/** 알바생 조회 Service!
	 * @param memberNo
	 * @return eList
	 */
	public abstract List<Member> selectEmployeeList(int storeNo);

	/** 알바생 이번달 총 근무시간, 총 근무일수 조회 Service
	 * @param memberNo
	 * @param date 
	 * @return wc
	 */
	public abstract WorkCalendar selectEmployeeWork(int memberNo, String date);

	/** 알바생 총급여, 주휴수당 조회 Service!
	 * @param pay
	 * @return payTotal
	 */
	public abstract Pay selectOnePay(Pay pay);

	/** 급여 등록 Service
	 * @param pay
	 * @return result
	 */
	public abstract int insertPay(Pay pay);
	

	/** 급여명세서 수정 Service
	 * @param pay
	 * @return result
	 */
	public abstract int updatePayAction(Pay pay);
	
	
	
	
}
