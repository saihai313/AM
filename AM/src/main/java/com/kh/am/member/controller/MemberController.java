package com.kh.am.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	// 로그인 페이지 이동
	@RequestMapping("login")
	public String loginView() {
		return "member/login";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value="signUp", method = RequestMethod.GET)
	public String signUpView() {
		return "member/signUpView";
	}

}
