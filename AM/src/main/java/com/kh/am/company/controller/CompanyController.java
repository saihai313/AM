package com.kh.am.company.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/company/*")
public class CompanyController {
	
	@Inject
	JavaMailSender mailSender;
	
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
	
	 // --------------------------------- 고객센터 ----------------------------------------------------
	 
	@RequestMapping("contactAction") public ModelAndView
	 contactAction(HttpServletRequest request, HttpServletResponse response_email, RedirectAttributes rdAttr,
			 String guestName, String guestEmail, String guestQuestion, String guestMessage) throws IOException {
		  
		  String sendMessage = guestName + " 님이 작성하였습니다." + "\n\n문의 유형: " + guestQuestion + "\n\n문의 내용: " + guestMessage;
		  String adminEmail = "AlbeitManagement@gmail.com";
		  
		  try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			 messageHelper.setFrom(guestEmail); 
	         messageHelper.setTo(adminEmail); 
	         
	         messageHelper.setSubject("AM 고객센터 문의글"); 
	         messageHelper.setText(sendMessage); 
			
	         mailSender.send(message);
	         
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		  
		  ModelAndView mv = new ModelAndView();    
	      mv.setViewName("redirect:/");  
		  
		  	rdAttr.addFlashAttribute("status", "success");
		    rdAttr.addFlashAttribute("msg", "문의가 접수되었습니다.");
		    rdAttr.addFlashAttribute("text", "답변은 작성해주신 메일에서 확인할 수 있습니다.");
		  
		  return mv; 
		}

}
