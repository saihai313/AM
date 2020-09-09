package com.kh.am.management.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.management.model.service.PayStubService;
import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;

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
	
	// 급여 명세서 페이지 전환
		@RequestMapping("payStubList/{type}")
		public String payStubListView(@PathVariable int type,
				@RequestParam(value = "cp",required = false, defaultValue = "1")int cp
				,Model model) {
			
			System.out.println(type);
			PageInfo pInfo =paystubService.pagination(type,cp);
			
			List<PayStub> paystubList=paystubService.seleceList(pInfo);
			
			for(PayStub p:paystubList) {
				System.out.println(p);
			}
			
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("paystubList",paystubList);
			
			return "management/payStubList";
		}
		
		
		//급여명세서 상세조회
		@RequestMapping("{type}/{boardNo}")
		public String payStubSelectOne(@PathVariable int boardNo,Model model
				,RedirectAttributes rdAttr, HttpServletRequest request) {
			
			System.out.println(boardNo);
			
			String url=null;
			Paystubplus plus =paystubService.selectone(boardNo);
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
}
