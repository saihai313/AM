package com.kh.am.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.calendar.model.service.CalendarService;
import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.calendar.model.vo.Employee;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/calendar/*")
public class CanlendarController {

	@Autowired
	private CalendarService calendarService;
	
	// 알바생, 파트타임 목록 가져오기
	// 근무 관리 페이지 이동
	@RequestMapping("workList")
	public String workList(Model model) {
		
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		if(loginMember != null) {
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		// 가게번호 얻어오기
		int storeNo = calendarService.selectStoreNo(memberNo);
		
		System.out.println("조회" + storeNo);
		
		// 알바생 목록 조회
		List<Member> eList = calendarService.selectEList(storeNo);
		
		System.out.println("알바" + eList);
		
		// 파트타임 목록 조회
		// 아 여긴 테이블 만들어야 한다해~
		
		
		model.addAttribute("eList", eList);
		}
		
		return "calendar/workList";
	}
	// 고정스케쥴 관리 페이지 이동
	@RequestMapping("pixSchedule")
	public String pixSchedule() {
		return "calendar/pixSchedule";
	}
	// 파트타임 관리 페이지 이동
	@RequestMapping("partTime")
	public String partTime() {
		return "calendar/partTime";
	}
	
	// 사장님 캘린더 조회
	@ResponseBody
	@RequestMapping("master/calendarView")
	public String calendarView(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println(loginMember.getMemberNo() + "/" + loginMember.getMemberGrade());
		
		int memberNo = loginMember.getMemberNo();
		
		//스케쥴 정보를 List<vo> 에 넣어서 가져옴
		List<WorkCalendar> list = calendarService.selectList(memberNo);
		
		System.out.println("스케쥴" + list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
		
	}
	
	// 알바생 캘린더 조회
	@ResponseBody
	@RequestMapping("staff/calendarView")
	public String calendarView2(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println(loginMember.getMemberNo() + "/" + loginMember.getMemberGrade());
		
		int memberNo = loginMember.getMemberNo();
		
		//스케쥴 정보를 List<vo> 에 넣어서 가져옴
		List<WorkCalendar> list = calendarService.selectListStaff(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
		
	}
	
	
	// 스케쥴 등록
	@RequestMapping(value="insertCalendar", method = RequestMethod.POST)
	public String insertCalendar(Model model, WorkCalendar insertCal) {
		
		System.out.println("나와 : "+ insertCal);
		
		// 위에 workList 만든거 가져와야지 정보입력될듯
		
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		// 사장님 회원번호 이용해서 가게번호 알고 insert 진행
		int result = calendarService.insertCalendar(insertCal, memberNo);
		
		
		
		
		// ------------------------------------------ list 다시
		
		// 가게번호 얻어오기
				int storeNo = calendarService.selectStoreNo(memberNo);
				
				System.out.println("조회" + storeNo);
				
				// 알바생 목록 조회
				List<Member> eList = calendarService.selectEList(storeNo);
				
				System.out.println("알바" + eList);
				
				// 파트타임 목록 조회
				// 아 여긴 테이블 만들어야 한다해~
				
				
				model.addAttribute("eList", eList);
		
		
		
		return "calendar/workList";
	}
	
	
	// 스케쥴 업데이트
		@RequestMapping(value="updateCalendar", method = RequestMethod.POST)
		public String updateCalendar(Model model, WorkCalendar updateCal) {
			
			System.out.println("나와 업뎃: "+ updateCal);
			
			// 위에 workList 만든거 가져와야지 정보입력될듯
			
			
		Member loginMember = (Member)model.getAttribute("loginMember");
			
			// 사장님 회원번호
			int memberNo = loginMember.getMemberNo();
			
			// 사장님 회원번호 이용해서 가게번호 알고 update 진행
			int result = calendarService.updateCalendar(updateCal);
			
			System.out.println("업데이트 리졸트" + result);
			
			
			// ------------------------------------------ list 다시
			
			// 가게번호 얻어오기
					int storeNo = calendarService.selectStoreNo(memberNo);
					
					System.out.println("조회" + storeNo);
					
					// 알바생 목록 조회
					List<Member> eList = calendarService.selectEList(storeNo);
					
					System.out.println("알바" + eList);
					
					// 파트타임 목록 조회
					// 아 여긴 테이블 만들어야 한다해~
					
					
					model.addAttribute("eList", eList);
			
			
			
			return "calendar/workList";
		}
	
	
}
