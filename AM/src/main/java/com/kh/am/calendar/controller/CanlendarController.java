package com.kh.am.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.am.calendar.model.service.CalendarService;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/calendar/*")
public class CanlendarController {

	@Autowired
	private CalendarService calendarService;
	
	// 사장님 캘린더 조회
	@ResponseBody
	@RequestMapping("calendarView")
	public String calendarView(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println(loginMember.getMemberNo() + "/" + loginMember.getMemberGrade());
		
		
		// DB랑 VO 만들고 나서 작성하기 
		// 로그인한 사장님 회원번호에서 가게 번호를 조회 
		
		
		
		//알바생 중에 컬럼값으로 가게번호를 가지고 있는 알바생 조회
		
		
		
		//그 알바생들의 근무 스케쥴 테이블 항목별로 전부(*) 가져오기 (특히 날짜, (시작, 끝)시간, 알바생이름)
		
		
		//그 정보를 List<vo> 에 넣어서 가져옴
		
		
		return null;
		
	}
}
