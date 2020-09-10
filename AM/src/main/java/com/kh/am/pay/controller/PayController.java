package com.kh.am.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.service.PayService;

@SessionAttributes({"loginMember", "loginEmployer"})
@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	// 급여
	
	// 급여설정 페이지 전환
	@RequestMapping("insertPay")
	public String payListView() {
		return "pay/insertPay";
	}
	
	/*
	 * // 급여 명세서 페이지 전환
	 * 
	 * @RequestMapping("payStubList") public String payStubListView() { return
	 * "pay/payStubList"; }
	 */
	
	// 급여 정정 페이지 전환
	@RequestMapping("requestPayStub")
	public String updatePayStubView() {
		return "pay/requestPayStub";
	}
	
	// 알바생 조회하기
	@ResponseBody
	@RequestMapping("selectEmployeeList/{storeNo}")
	public String selectEmployeeList(@PathVariable int storeNo) {
		System.out.println("selecEmployee - 가게 번호: " + storeNo);
		
		List<Member> eList = payService.selectEmployeeList(storeNo);
		System.out.println(eList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(eList);
	}
	
	// 알바생 이번달 총 근무일수, 총 근무시간 조회
	@ResponseBody
	@RequestMapping("selectEmployeeWork")
	public String selectEmployeeWork(int memberNo) {
		
		WorkCalendar wc = payService.selectEmployeeWork(memberNo);
		
		System.out.println("WC : " + wc);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(wc);
	}
	
	/*@ResponseBody
	@RequestMapping("selectOneDay")
	public String selectOneDay(int memberNo) {
		
		int result = payService.selectOneDay(memberNo);
		
		System.out.println(result);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(result);
	}
	*/
		
		
	
	
}
