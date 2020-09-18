package com.kh.am.personnel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.vo.Member;
import com.kh.am.personnel.model.service.MailSendService;
import com.kh.am.personnel.model.service.PersonnelService;
import com.kh.am.personnel.model.vo.EmployeeInfo;
import com.kh.am.personnel.model.vo.ListInfo;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/personnel/*")
public class PersonnelController {
	
	@Autowired
	private MailSendService mailSendService;
	
	@Autowired 
	private PersonnelService personnelService;
	
	// 인사관리 페이지 이동
	
	@RequestMapping("personnelList")
	public String personnelList( Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int memberNo = loginMember.getMemberNo();
		
		int storeNo = personnelService.selectStoreNo(memberNo);
		
		// 알바생 목록 조회
		List<EmployeeInfo> personnelList = personnelService.selectList(storeNo);
		
		 //for(EmployeeInfo e : personnelList) { System.out.println(e); }
		 
		
		model.addAttribute("personnelList", personnelList);
		
		
		return "personnel/personnelList";
	}
	
	
	@RequestMapping("personnelView")
	public String personnelView(Model model, int memberNo) {	
		
		EmployeeInfo eInfo = personnelService.selectInfo(memberNo);
		
		model.addAttribute("eInfo", eInfo);
		
		return "personnel/personnelView";
	}
	
	@RequestMapping("delete")
	public String deletePersonnel(int memberNo,
									RedirectAttributes rdAttr,
									HttpServletRequest request
			) {
		
		
		System.out.println(memberNo);
		
		int result = personnelService.deletePersonnel(memberNo);
		
		String status = null;
		String msg = null;
		String url = null;
		
		if(result > 0) {
			status = "success";
			msg = "직원 삭제 성공!";
			url = "/personnel/personnelList";
		}else {
			status = "error";
			msg = "직원 삭제 실패!";
			url = request.getHeader("referer");
			
		}
	
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
			
			
		return "redirect:" + url;
	}
	
	@RequestMapping("updateHourlyWage")
	public String updateHourlyWage(int memberNo, int sal,
									RedirectAttributes rdAttr,
									HttpServletRequest request) {
		
		int result = personnelService.updateHourlyWage(memberNo, sal);
		
		String status = null;
		String msg = null;
		String url = null;
		
		if(result > 0) {
			status = "success";
			msg = "시급 수정 성공!";
			url = "/personnel/personnelList";
		}else {
			status = "error";
			msg = "시급 수정 실패!";
			url = request.getHeader("referer");
			
		}
	
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
			
			
		return "redirect:" + url;
	}
}
