package com.kh.am.member.controller;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.service.MemberService;
import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;

@SessionAttributes({"loginMember", "loginEmployer"})
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
			if(loginMember.getMemberCheck().equals("N")) {
				text = "이메일 인증을 완료해주세요.";
				
			// 3) 사업자 번호 인증
			}else {
				Store loginEmployer = memberService.status(loginMember.getMemberNo());
				
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
							   Store store,
							   Model model, RedirectAttributes rdAttr) {
		
		int result = memberService.signUpMember(signUpMember);
		
		String status = null;
		String msg = null;
		
		if(result > 0) {
			
			String memberEmail = signUpMember.getMemberEmail();
			result = memberService.signUpEmployer(store, memberEmail);
			
			if(result > 0) {
				
				String memberName = signUpMember.getMemberName();
	
				result = sendEmail(memberEmail, memberName);
				
				if(result > 0) {
					status = "success";
					msg = "가입 성공";
					rdAttr.addFlashAttribute("text", "인증메일을 확인하여 회원가입을 완료해주세요.");
					
				}else {
					status = "error";
					msg = "이메일 전송 실패";
					rdAttr.addFlashAttribute("text", "인증이메일 전송에 실패하였습니다.");
				}

			
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

	
	 
	// 인증 이메일 전송
	private int sendEmail(String memberEmail, String memberName) {
        
		int result = 0;
		
		MimeMessage mail = mailSender.createMimeMessage();
		String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
		                    + "<a href='http://localhost:8080/am/member/signUpEmail?memberEmail=" 
		                    + memberEmail + "' target='_blenk'>이메일 인증 확인</a>";
		try {
	         mail.setSubject("AM 회원가입 이메일 인증 ", "utf-8");
	         mail.setText(mailContent, "utf-8", "html");
	         mail.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
	         mailSender.send(mail);
	         
	         result = 1;
	         
		} catch (MessagingException e) {
			result = 0;
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}
	
	
	// 인증 이메일 확인
	@GetMapping("signUpEmail")
	public String signUpEmail(@RequestParam String memberEmail, HttpServletRequest req) {
		System.out.println(memberEmail);
		
		String status = null;
		String msg = null;
		
		if(memberEmail != null) {
			int result = memberService.signUpEmail(memberEmail);
			
			if(result > 0) {
				status = "success";
				msg = "이메일 인증 성공";
				 req.setAttribute("text", "이제 로그인하면 모든 AM의 기능을 누릴 수 있습니다!");
			}else {
				status = "error";
				msg = "이메일 인증 실패";
			}
		}
		req.setAttribute("status", status);
		req.setAttribute("msg", msg);
        
		return "member/login"; 
	}
	
	
	// ----------------------- 회원정보 수정 ------------------------------------------------------
	
		@RequestMapping("updateMemberAction")
		public String updateMemberAction(String memberPhone, String storePhone, 
						Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
			
			Member loginMember = (Member) model.getAttribute("loginMember");
			Store loginEmployer = (Store)model.getAttribute("loginEmployer");
			int memberNo = loginMember.getMemberNo();
			
			
			int result = memberService.updateMemberAction(memberNo, memberPhone);
			
			String status = null;
			String msg = null;
			
			if(result > 0) {
				
				loginMember.setMemberPhone(memberPhone);
				model.addAttribute("loginMember", loginMember);
				
				result = memberService.updateStoreAction(memberNo, storePhone);
				
				if(result > 0) {
					loginEmployer.setStorePhone(storePhone);
					model.addAttribute("loginEmployer", loginEmployer);
					
					status = "success";
					msg = "수정 성공";
					
				}else {
					status = "error";
					msg = "가게 수정 실패";
				}
				
				
				
			}else {
				status = "error";
				msg = "회원 수정 실패";
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
