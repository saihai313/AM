package com.kh.am.personnel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		
		
		/*
		 * for(EmployeeInfo e : personnelList) { System.out.println(e); }
		 */
		
		model.addAttribute("personnelList", personnelList);
		
		
		return "personnel/personnelList";
	}
	
	
	@RequestMapping("{memberNo}")
	public String personnelView(@RequestParam("memberNo") int memberNo) {
		
		System.out.println(memberNo);
		
		return "personnel/personnelView";
	}
}
