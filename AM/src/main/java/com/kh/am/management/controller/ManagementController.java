package com.kh.am.management.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.management.model.service.PayStubService;
import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;
import com.kh.am.member.model.vo.Member;

@SessionAttributes("loginMember")
@Controller
@RequestMapping("/management/*")
public class ManagementController {
	
	@Autowired
	private PayStubService paystubService;
	
//	@RequestMapping("paysetting")
//		public String paysettingView() {
//		return "management/paysetting";
//	}
//	
//	@RequestMapping("pays")
//	public String paysView() {
//		return "management/pays";
//	}
	
	/*
	 * @RequestMapping("bills") public String billsview() { return
	 * "management/bills"; }
	 */
	
//	@RequestMapping("moneysetting")
//	public String moneysettingView() {
//		return "management/moneysetting";
//	}
	
	// 급여 명세서 리스트
		@RequestMapping("payStubList")
		public String payStubListView(Model model) {
			int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();			
			System.out.println(memberNo);
			List<PayStub> paystubList=paystubService.seleceList(memberNo);
			
			for(PayStub p:paystubList) {
				System.out.println(p);
			}
			
			
			model.addAttribute("paystubList",paystubList);
			
			return "management/payStubList";
		}
		
		
		//급여명세서 상세조회
		@RequestMapping("bills/{memberNo}")
		public String payStubSelectOne(@PathVariable int memberNo,Model model
				,RedirectAttributes rdAttr, HttpServletRequest request,PayStub paystub) {
			
			
			
			String url=null;
			PayStub plus =paystubService.selectone(memberNo);
			System.out.println(plus);
			if(plus!=null) {
				model.addAttribute("plus", plus);
				url="management/bills";
			
			}else {
				rdAttr.addFlashAttribute("status", "error");
				rdAttr.addFlashAttribute("msg", "해당정보가 존재하지 않습니다.");
				url="redirect:"+request.getHeader("referer");

				
			}
			
			
			return url;
		}
		
		
		@RequestMapping("requestPayStub" )
		public String requestPayStub(Model model,PayStub pay) {
			int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			List<Paystubplus> list= paystubService.requestlist(memberNo);
			//Paystubplus rList=paystubService.requeston(memberNo); 
			
//			System.out.println(list);
//			System.out.println(rList);
			model.addAttribute("list",list);
			//model.addAttribute("rList",rList);
			
			
			return "management/requestPayStub";
	
			
		}
		@ResponseBody
		@RequestMapping("request" )
		public String requestPayStub(Model model,PayStub pay,int memberNo) {
			
			
		System.out.println(memberNo);
			Paystubplus rList=paystubService.requeston(memberNo); 
		
			model.addAttribute("rList",rList);
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

			 return gson.toJson(rList);

		}
		
		 
		
		
}
