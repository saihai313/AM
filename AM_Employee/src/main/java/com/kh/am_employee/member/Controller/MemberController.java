package com.kh.am_employee.member.Controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am_employee.member.model.service.MemberService;
import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.MemberAuth;
import com.kh.am_employee.member.model.vo.Store;

@SessionAttributes({"loginMember", "loginStore", "memberAuth"})
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
	
	// 회원가입_인증코드 입력 이동
	@RequestMapping(value="signUp")
	public String signUpView() {
		return "member/signUpView";
	}
	
	// 회원가입_약관 동의 이동
	@RequestMapping(value="signUp2")
	public String signUpView2() {
		return "member/signUpView2";
	}
	
	// 회원가입_회원정보 입력 이동
	@RequestMapping(value="signUp3")
	public String signUpView3() {
		return "member/signUpView3";
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
	
	
	// ----------------------- 로그인 -------------------------------------------------------
	@RequestMapping("loginAction")
	public String loginAction(Member member, Model model, RedirectAttributes rdAttr,
							String saveE, HttpServletResponse response) {

		Member loginMember = memberService.login(member);
		
		if(loginMember == null) {
			rdAttr.addFlashAttribute("status", "error");
            rdAttr.addFlashAttribute("msg", "로그인 실패");
            rdAttr.addFlashAttribute("text", "아이디 또는 비밀번호를 확인해주세요.");
			
		}else {
			model.addAttribute("loginMember", loginMember);
			
			Store loginStore = memberService.loginStore(loginMember.getMemberNo());
				if(loginStore != null) {
					model.addAttribute("loginStore", loginStore);
				}
				// System.out.println(loginMember);
				// System.out.println(loginStore);
		
			Cookie cookie = new Cookie("saveE", member.getMemberEmail());
				if(saveE != null) { 
					cookie.setMaxAge(60 * 60 * 24 * 7); 
				}else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
			}
		
		return "redirect:/";
		
		
	}
	
	// ----------------------- 로그아웃 ------------------------------------------------------
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/";
	}
	
	// ----------------------- 회원가입 ------------------------------------------------------
	
	// 1. 인증 확인
	@ResponseBody
	@RequestMapping("certificate")
	public String certificate(String memberEmail, Model model) {
		
		MemberAuth auth = memberService.certificate(memberEmail);
		
		if(auth != null) {
			
			if(auth.getAuthCheck().equals("Y")) {
				model.addAttribute("memberAuth", auth);
			}
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(auth);
	}
	
	// 2. 회원 가입
	@RequestMapping("signUpAction")
	public String signUpAction(Member signUpMember, Model model, 
							   SessionStatus sessionStatus, RedirectAttributes rdAttr) {
		System.out.println(signUpMember);
		
		MemberAuth auth = (MemberAuth)model.getAttribute("memberAuth");
		
		try {
			// 1) 공통 정보
			int result = memberService.signUpMember(signUpMember, auth);
			
			String status = null;
			String msg = null;
			
			// 2) 알바생 정보
			if(result > 0) {
				result = memberService.signUpEmployee(auth);
				
				if(result > 0) {
					status = "success";
					msg = "가입 성공";
					
					sessionStatus.setComplete();
					
				}else {
					status = "error";
					msg = "가입(알바) 실패";
				}
						
			}else {
				status = "error";
				msg = "가입(공통) 실패";
			}
			
			rdAttr.addFlashAttribute("status", status);
			rdAttr.addFlashAttribute("msg", msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	
	// ----------------------- 회원정보 수정 ------------------------------------------------------
	
	@RequestMapping("updateMemberAction")
	public String updateMemberAction(String memberPhone, 
					Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		int result = memberService.updateMemberAction(memberNo, memberPhone);
		
		String status = null;
		String msg = null;
		
		if(result > 0) {
			status = "success";
			msg = "수정 성공";
			
			loginMember.setMemberPhone(memberPhone);
			model.addAttribute("loginMember", loginMember);
			
		}else {
			status = "error";
			msg = "수정 실패";
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		request.getHeader("referer");
		return "redirect:" + request.getHeader("referer");
	}
	
	
	// ----------------------- 비밀번호 수정 ------------------------------------------------------
	
	@RequestMapping("updatePwdAction")
	public String updatePwdAction(String nowPwd, String newPwd,
					Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		
		loginMember.setMemberPwd(nowPwd);
		
		int result = memberService.updatePwdAction(loginMember, newPwd);
		
		String status = null;
		String msg = null;
		String text = null;
		
		if(result > 0) {
			status = "success";
			msg = "비밀번호 변경 성공";
		}else {
			status = "error";
			msg = "비밀번호 변경 실패";
			text = "현재 비밀번호를 확인해 주세요.";
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		rdAttr.addFlashAttribute("text", text);
		
		return "redirect:updatePwd";
	}
	
	// ----------------------- 회원 탈퇴 ------------------------------------------------------
	@RequestMapping("secessionAction")
	public String secessionAction(String memberPwd,
					Model model, RedirectAttributes rdAttr, HttpServletRequest request, SessionStatus sessionStatus) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		loginMember.setMemberPwd(memberPwd);
		
		int result = memberService.secessionAction(loginMember, memberPwd);
		
		String status = null;
		String msg = null;
		String text = null;
		String path = null;
		
		if(result > 0) {
			status = "success";
			msg = "회원 탈퇴 성공";
			path = "/";
			
			sessionStatus.setComplete();
		}else {
			status = "error";
			msg = "회원 탈퇴 실패";
			text = "현재 비밀번호를 확인해 주세요.";
			path= "secession";
		}
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		rdAttr.addFlashAttribute("text", text);
		
		return "redirect:" + path;
	}
	
	
}
