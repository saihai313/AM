package com.kh.am.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.calendar.model.dao.CalendarDAO;
import com.kh.am.calendar.model.vo.Calendar;
import com.kh.am.member.model.vo.Member;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDAO calendarDAO;

	// 사장님 전체 스케쥴 조회
	@Override
	public List<Calendar> selectList(int memberNo) {
		
		// 로그인한 사장님 회원번호에서 가게 번호를 조회 
		int storeNo = calendarDAO.selectStoreNo(memberNo);
		
		System.out.println("가게번호 : " + storeNo);
		
		
		
		//알바생 중에 컬럼값으로 가게번호를 가지고 있는 알바생 조회  후
		//그 알바생들의 근무 스케쥴 테이블 항목별로 전부(*) 가져오기 (특히 날짜, (시작, 끝)시간, 알바생이름)
		List<Calendar> list = calendarDAO.selectCalendarM(storeNo);
				
		
		return list;
	}

	// 알바생 스케쥴 조회(개인)
	@Override
	public List<Calendar> selectListStaff(int memberNo) {
		
		
		
		//해당 알바생번호 조회  후
		//그 알바생들의 근무 스케쥴 테이블 항목별로 전부(*) 가져오기 (특히 날짜, (시작, 끝)시간, 알바생이름)
		List<Calendar> list = calendarDAO.selectCalendarS(memberNo);
				
		
		return list;
	}
	

}
