package com.kh.am.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.service.MemberService;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
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

	// 로그인
	@RequestMapping("loginAction")
	public String loginAction(Member member, Model model, RedirectAttributes rdAttr,
							String saveE, HttpServletResponse response) {
		
		
		System.out.println("멤버 : " + member);
		
		Member loginMember = memberService.login(member);
		System.out.println("후  : " + loginMember);
		System.out.println("저장아이디" + saveE);
		System.out.println("이메일" + member.getMemberEmail());
		
		if(loginMember == null) {
			rdAttr.addFlashAttribute("status", "error");
            rdAttr.addFlashAttribute("msg", "로그인 실패");
            rdAttr.addFlashAttribute("text", "아이디 또는 비밀번호를 확인해주세요.");
			
		}else {
			model.addAttribute("loginMember", loginMember);
		
			Cookie cookie = new Cookie("saveE", member.getMemberEmail());
			
				if(saveE != null) { // 쿠키 생성
					cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키를 1주일 유지
				}else {
					cookie.setMaxAge(0); // 쿠키 삭제
				}
				
				response.addCookie(cookie);
			}
		System.out.println(loginMember);
		
		return "redirect:/";
		
		
	}
	
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/";
	}
	
	
}
