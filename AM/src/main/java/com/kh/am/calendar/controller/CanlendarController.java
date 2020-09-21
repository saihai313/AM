package com.kh.am.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.am.calendar.model.vo.NewsBoard;
import com.kh.am.calendar.model.vo.PartTime;
import com.kh.am.calendar.model.vo.UpdateWorkCalendar;
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
		
		String memberGrade = loginMember.getMemberGrade();
		
		System.out.println("등급 " + memberGrade);
		// 가게번호 얻어오기
		int storeNo = calendarService.selectStoreNo(memberNo);
		
		System.out.println("조회" + storeNo);
		
		// 알바생 목록 조회
		List<Member> eList = calendarService.selectEList(storeNo);
		
		System.out.println("알바" + eList);
		
		// 파트타임 목록 조회
		List<PartTime> pList = calendarService.selectPList(storeNo);
		
		System.out.println("파트타임 목록 " + pList);
		
	
		
		
		model.addAttribute("eList", eList);
		model.addAttribute("pList", pList);
		
		
		
		//---------뉴스 가져오기
		// VO, 마이바티스, 매퍼 작성
		List<NewsBoard> nList = calendarService.selectNewsList(memberGrade);
		model.addAttribute("nList", nList);
		
		
		
		//생활뉴스 목록
		List<NewsBoard> n2List = calendarService.selectNews2List();
		model.addAttribute("n2List", n2List);
		System.out.println("n2List" + n2List);
		
		
		}
		
		return "calendar/workList";
	}
	
	
	
	
	// 고정스케쥴 관리 페이지 이동
	@RequestMapping("pixSchedule")
	public String pixSchedule(Model model) {
		
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
		List<PartTime> pList = calendarService.selectPList(storeNo);
		
		System.out.println("파트타임 목록 " + pList);
		
		model.addAttribute("eList", eList);
		model.addAttribute("pList", pList);
		}
		
		
		
		
		
		return "calendar/pixSchedule";
	}
	
	
	
	
	
	
	// 파트타임 관리 페이지 이동
	@RequestMapping("partTime")
	public String partTime(Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int memberNo = loginMember.getMemberNo();
		
		
		List<PartTime> pList = calendarService.selectPartTime(memberNo);
		
		model.addAttribute("pList", pList);
		
		System.out.println("파트타임 페이지에서 파트타임 목록 조회" + pList);
		
		return "calendar/partTime";
	}
	
	// 사장님 캘린더 조회
	@ResponseBody
	@RequestMapping(value="master/calendarView", produces = "application/json; charset=utf-8")
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
				// 파트타임 목록 조회
				List<PartTime> pList = calendarService.selectPList(storeNo);
				model.addAttribute("pList", pList);
				
				model.addAttribute("eList", eList);
		
		
		
		return "calendar/workList";
	}
	
	
		// 스케쥴 업데이트
		@RequestMapping(value="updateCalendar", method = RequestMethod.POST)
		public String updateCalendar(Model model, UpdateWorkCalendar updateCal) {
			
		Member loginMember = (Member)model.getAttribute("loginMember");
			
			// 사장님 회원번호
			int memberNo = loginMember.getMemberNo();
			
			// 사장님 회원번호 이용해서 가게번호 알고 update 진행
			int result = calendarService.updateCalendar(updateCal, memberNo);
			
			
			// ------------------------------------------ list 다시
			
			// 가게번호 얻어오기
					int storeNo = calendarService.selectStoreNo(memberNo);
					
					System.out.println("조회" + storeNo);
					
					// 알바생 목록 조회
					List<Member> eList = calendarService.selectEList(storeNo);
					
					System.out.println("알바" + eList);

					// 파트타임 목록 조회
					List<PartTime> pList = calendarService.selectPList(storeNo);
					model.addAttribute("pList", pList);
					model.addAttribute("eList", eList);
			
			
			
			return "calendar/workList";
		}
	
		// 스케쥴 삭제
				@RequestMapping(value="deleteCalendar", method = RequestMethod.POST)
				public String deleteCalendar(Model model, WorkCalendar deleteCal) {
					
					System.out.println("나와 삭제: "+ deleteCal);
					
					// 위에 workList 만든거 가져와야지 정보입력될듯
					
					
				Member loginMember = (Member)model.getAttribute("loginMember");
					
					// 사장님 회원번호
					int memberNo = loginMember.getMemberNo();
					
					// 사장님 회원번호 이용해서 가게번호 알고 update 진행
					int result = calendarService.deleteCalendar(deleteCal, memberNo);
					
					System.out.println("딜리트 리졸트" + result);
					
					
					// ------------------------------------------ list 다시
					
					// 가게번호 얻어오기
							int storeNo = calendarService.selectStoreNo(memberNo);
							
							System.out.println("조회" + storeNo);
							
							// 알바생 목록 조회
							List<Member> eList = calendarService.selectEList(storeNo);
							
							System.out.println("알바" + eList);
							
							// 파트타임 목록 조회
							// 아 여긴 테이블 만들어야 한다해~
							
							// 파트타임 목록 조회
							List<PartTime> pList = calendarService.selectPList(storeNo);
							model.addAttribute("pList", pList);
							model.addAttribute("eList", eList);
					
					
					
					return "calendar/workList";
				}
			
				
	// 파트타임 삭제			
	@ResponseBody
	@RequestMapping(value="partTimeDelete", produces = "applicateion/text; charset=utf-8")
	public String partTimeDelete(PartTime partTime, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		System.out.println("파트타임 삭제" + partTime);
		
		// 사장님 가게 번호
		int storeNo = calendarService.selectStoreNo(memberNo);

		//세팅
		partTime.setStoreNo(storeNo);
		
		
		int result = calendarService.partTimeDelete(partTime);
		
		String str = "파트타임 지우기 ";
		
		if(result > 0) {
			str += "성공";
		}else {
			str += "실패";
			
		}
		return str;
	}
		
	// 파트타임 업데이트
	@ResponseBody
	@RequestMapping(value="partTimeUpdate", produces = "applicateion/text; charset=utf-8")
	public String updatePartTime(Model model, PartTime partTime) {
		
		System.out.println("업데이트" + partTime);
		
		
		
		
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		System.out.println("파트타임 삭제" + partTime);
		
		// 사장님 가게 번호
		int storeNo = calendarService.selectStoreNo(memberNo);

		//세팅
		partTime.setStoreNo(storeNo);
		
		System.out.println("업데이트 데이트 " + partTime );
		int result = calendarService.partTimeUpdate(partTime);
		
		String str = "파트타임 수정에 ";
		
		if(result > 0) {
			str += "성공";
		}else {
			str += "실패";
			
		}
		return str;
	}
	
	
	//파트타임 삽입
	@ResponseBody
	@RequestMapping(value="partTimeInsert", produces = "applicateion/text; charset=utf-8")
	public String partTimeInsert(Model model, PartTime partTime) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		
		// 사장님 가게 번호
		int storeNo = calendarService.selectStoreNo(memberNo);

		//세팅
		partTime.setStoreNo(storeNo);
		
		System.out.println("인서트 데이트 " + partTime );
		int result = calendarService.partTimeInsert(partTime);
		
		String str = "파트타임 삽입에 ";
		
		if(result > 0) {
			str += "성공";
		}else {
			str += "실패";
			
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value="employeeList", produces = "application/json; charset=utf-8")
	public String employeeList(Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		// 사장님 회원번호
		int memberNo = loginMember.getMemberNo();
		
		
		// 사장님 가게 번호
		int storeNo = calendarService.selectStoreNo(memberNo);
		
		
		// 알바생 정보 목록
		List<Member> list = calendarService.selectMList(storeNo);
		System.out.println("알바 정보 목록 " + list);
		model.addAttribute("mList", list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(list);
	}
}