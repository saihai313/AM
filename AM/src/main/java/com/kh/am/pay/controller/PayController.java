package com.kh.am.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	// 급여설정 페이지 전환
	@RequestMapping("insertPay")
	public String payListView() {
		return "pay/insertPay";
	}
	
	// 급여 명세서 페이지 전환
	@RequestMapping("payStubList")
	public String payStubListView() {
		return "pay/payStubList";
	}
	
	// 급여 정정 페이지 전환
	@RequestMapping("requestPayStub")
	public String updatePayStubView() {
		return "pay/requestPayStub";
	}
	
	
}
