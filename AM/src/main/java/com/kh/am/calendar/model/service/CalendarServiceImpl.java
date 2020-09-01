package com.kh.am.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.calendar.model.dao.CalendarDAO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDAO calendarDAO;
	

}
