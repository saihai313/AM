package com.kh.am.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
	
	// 회사 소개 페이지 이동
	@RequestMapping("about")
	public String about() {
		return "company/about";
	}
	
	// 회사 연락 이동
	@RequestMapping("contact")
	public String contact() {
		return "company/contact";
	}

}
