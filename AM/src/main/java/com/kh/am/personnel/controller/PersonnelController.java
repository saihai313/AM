package com.kh.am.personnel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.am.personnel.model.service.MailSendService;

@Controller
@RequestMapping("/personnel/*")
public class PersonnelController {
	
	@Autowired
	private MailSendService mailSendService;
	
	// 인사관리 페이지 이동
	
	@RequestMapping("personnelList")
	public String personnelList() {
		return "personnel/personnelList";
	}
}
