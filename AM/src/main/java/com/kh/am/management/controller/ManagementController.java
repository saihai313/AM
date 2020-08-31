package com.kh.am.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/management/*")
public class ManagementController {
	
	@RequestMapping("paysetting")
		public String paysettingView() {
		return "management/paysetting";
	}
	
	@RequestMapping("pays")
	public String paysView() {
		return "management/pays";
	}
	
	@RequestMapping("bills")
	public String billsview() {
		return "management/bills";
	}
	
	@RequestMapping("moneysetting")
	public String moneysettingView() {
		return "management/moneysetting";
	}
}
