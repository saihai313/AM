package com.kh.am_employee.work.model.service;

import java.util.List;

import com.kh.am_employee.work.model.vo.WorkCalendar;

public interface WorkService {
	
	/** 알바생 스케줄 조회
	 * @param memberNo
	 * @return workCalendar
	 */
	List<WorkCalendar> workCalendar(int memberNo);

	/** 전체 스케줄 조회
	 * @param memberNo
	 * @return workCalendar
	 */
	List<WorkCalendar> workCalendar2(int storeNo);

}
