package com.kh.am.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.service.MemberService;
import com.kh.am.member.model.vo.Employer;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember", "loginEmployer"})
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
	
	// 회원가입 페이지_약관 이동
	@RequestMapping(value="signUp")
	public String signUpView() {
		return "member/signUpView";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value="signUp2")
	public String signUpView2() {
		return "member/signUpView2";
	}
	
	// 회원정보 수정 페이지 이동
	@RequestMapping("updateMember")
	public String updateMember() {
		return "member/updateMember";
	}
	
	// 비밀번호 수정 페이지 이동
	@RequestMapping("updatePwd")
	public String updatePwd() {
		return "member/updatePwd";
	}
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping("secession")
	public String secession() {
		return "member/secession";
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
		
		String status = "error";
		String msg = "로그인 실패";
		String text = null;
		
		// 1) 로그인 정보 
		if(loginMember == null) {
			text = "아이디 또는 비밀번호를 확인해주세요.";
			
		}else {
				
			// 2) 이메일 인증
			if(loginMember.getMemberCheck().equals("X")) {
				text = "이메일 인증을 완료해주세요.";
				
			// 3) 사업자 번호 인증
			}else {
				Employer loginEmployer = memberService.status(loginMember.getMemberNo());
				
				if(loginEmployer != null) {
					msg = null;
					
					// 로그인 멤버 정보 저장
					model.addAttribute("loginMember", loginMember);
					// 가게 정보 저장
					model.addAttribute("loginEmployer", loginEmployer);
					
					// 이메일 저장
					Cookie cookie = new Cookie("saveE", member.getMemberEmail());
					
					if(saveE != null) { // 쿠키 생성
						cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키를 1주일 유지
					}else {
						cookie.setMaxAge(0); // 쿠키 삭제
					}
					response.addCookie(cookie);
					
				}else {
					text = "관리자가 아직 사업자 번호를 인증하기 전입니다.";
				}
				
			}
		}
		System.out.println(loginMember);
		
		rdAttr.addFlashAttribute("status", status);
        rdAttr.addFlashAttribute("msg", msg);
        rdAttr.addFlashAttribute("text", text);
        
		return "redirect:/";
		
		
	}
	
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/";
	}
	
	
	// ----------------------- 회원가입 ------------------------------------------------------
	
	// 1) 이메일 중복 검사
	@ResponseBody
	@RequestMapping("emailDupCheck")
	public String emailDupCheck(String memberEmail) {
		
		int result = memberService.emailDupCheck(memberEmail);
		
		return result + "";
	}
	
	// 2) 회원가입
	@RequestMapping("signUpAction")
	public String signUpAction(Member signUpMember, 
							   Employer employer,
							   Model model, RedirectAttributes rdAttr) {
		
		int result = memberService.signUpMember(signUpMember);
		
		String status = null;
		String msg = null;
		
		if(result > 0) {
			
			String memberEmail = signUpMember.getMemberEmail();
			result = memberService.signUpEmployer(employer, memberEmail);
			
			if(result > 0) {
				status = "success";
				msg = "가입 성공";
				rdAttr.addFlashAttribute("text", "인증메일을 확인하여 회원가입을 완료해주세요.");
			}else {
				status = "error";
				msg = "가입(사장님) 실패";
			}
			
		}else {
			status = "error";
			msg = "가입(공통) 실패";
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/";
	}
	
}
