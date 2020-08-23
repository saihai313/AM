package com.kh.am.personnel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/personnel/*")
public class PersonnelController {
	
	// 인사관리 페이지 이동
	@RequestMapping("personnelList")
	public String personnelList() {
		return "personnel/personnelList";
	}
}
