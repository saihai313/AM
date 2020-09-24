package com.kh.am_employee.work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.Store;
import com.kh.am_employee.work.model.service.WorkService;
import com.kh.am_employee.work.model.vo.WorkCalendar;

@SessionAttributes({"loginMember", "loginStore"})
@Controller
@RequestMapping("/work/*")
public class WorkController {
	
	@Autowired
	private WorkService workService;
	
	// 근무 스케줄 페이지 이동
	@RequestMapping("workList")
	public String workList() {
		return "work/workList";
	}
	
	// 메인 캘린더 조회
	@ResponseBody
	@RequestMapping("mainCalendar")
	public String workCalendar(Model model) {
	
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		List<WorkCalendar> workCalendar = workService.workCalendar(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(workCalendar);
	}
	
	
	// 알바생 스케줄 조회
	@ResponseBody
	@RequestMapping("employeeCalendar")
	public String employeeCalendar(Model model) {
	
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		List<WorkCalendar> workCalendar = workService.workCalendar(memberNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(workCalendar);
	}
	
	// 사장님 스케줄 조회
	@ResponseBody
	@RequestMapping("employerCalendar")
	public String employerCalendar(Model model) {
	
		Store loginStore = (Store)model.getAttribute("loginStore");
		int storeNo = loginStore.getStoreNo();

		List<WorkCalendar> workCalendar = workService.workCalendar2(storeNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(workCalendar);
	}

}
