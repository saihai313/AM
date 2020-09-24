package com.kh.am.pay.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;
import com.kh.am.pay.model.service.PayService;
import com.kh.am.pay.model.vo.Pay;

@SessionAttributes({"loginMember", "loginEmployer"})
@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	
	// 급여설정 페이지 전환
	@RequestMapping("insertPay")
	public String payListView() {
		return "pay/insertPay";
	}
	
	/*
	 * // 급여 명세서 페이지 전환
	 * 
	 * @RequestMapping("payStubList") public String payStubListView() { return
	 * "pay/payStubList"; }
	 */
	
	/*
	 * // 급여 정정 페이지 전환
	 * 
	 * @RequestMapping("requestPayStub") public String updatePayStubView() { return
	 * "pay/requestPayStub"; }
	 */
	
	// 알바생 조회하기
	@ResponseBody
	@RequestMapping("selectEmployeeList/{storeNo}")
	public String selectEmployeeList(@PathVariable int storeNo) {
		System.out.println("selecEmployee - 가게 번호: " + storeNo);
		
		List<Member> eList = payService.selectEmployeeList(storeNo);
		System.out.println("eList : " + eList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(eList);
	}
	
	// 알바생 이번달 총 근무일수, 총 근무시간 조회
	@ResponseBody
	@RequestMapping("selectEmployeeWork")
	public String selectEmployeeWork(int memberNo) {
		
		WorkCalendar wc = payService.selectEmployeeWork(memberNo);
		
		System.out.println("WC : " + wc);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(wc);
	}
	
	// 알바생 하루 일한 시간 조회
	@ResponseBody
	@RequestMapping("selectOnePay")
	public String selectOnePay(Pay pay) {
		
		System.out.println(pay.getMemberNo());
		System.out.println(pay.getPayCreateDate());
		
		SimpleDateFormat str = new SimpleDateFormat("yyyy-MM");
	    pay.setPayStatus(str.format(pay.getPayCreateDate()));
		
		Pay payTotal = payService.selectOnePay(pay);
		
		System.out.println("payTotal : " + payTotal);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(payTotal);
	}
	
	// 알바생 급여 등록
	@RequestMapping("insertPayAction")
	public String insertPayAction(Pay pay, Model model, HttpServletRequest request, RedirectAttributes rdAttr) {
		
		Store loginEmployer = (Store)model.getAttribute("loginEmployer");
		
		pay.setStoreNo(loginEmployer.getStoreNo());
		
		System.out.println("pay : " + pay);
		
		int result = payService.insertPay(pay);
		
		
		String status = null;
		String msg = null;
		String url = null;
		if(result > 0) {
			status = "success";
			msg = "급여 등록 성공";
		}else {
			status = "error";
			msg = "급여 등록 실패";
			
		}
		
		url = "redirect:insertPay";
		
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
		
		return url;
	}
	
	// 급여 명세서 수정
		@RequestMapping("updatePayAction/{payNo}")
		public String updatePayAction(Pay pay, RedirectAttributes rdAttr, HttpServletRequest request) {
			System.out.println("updatePayAction : " + pay);
			
			
			
			  int result = payService.updatePayAction(pay);
			  
			  String status = null;
			  String msg = null;
			  String url = null; 
			  if(result > 0) {
				  status = "success";
				  msg = "성공";
				  url ="redirect:../../management/bills/"+pay.getPayNo(); 
			  }
			  else { 
				  status ="error"; 
				  url = "redirect:" + request.getHeader("referer"); 
				}
			  
			  rdAttr.addFlashAttribute("status", status); 
			  rdAttr.addFlashAttribute("msg", msg); 
			 
			return url;
		}
		
	
	
}
