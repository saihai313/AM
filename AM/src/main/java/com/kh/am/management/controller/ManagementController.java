package com.kh.am.management.controller;

import java.sql.Date;
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
import com.kh.am.management.model.service.PayStubService;
import com.kh.am.management.model.vo.CorrectionReply;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;
import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;

import javafx.scene.control.Alert;

@SessionAttributes({"loginMember", "loginEmployer"})
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
		@RequestMapping("bills/{payNo}")
		public String payStubSelectOne(@PathVariable int payNo,Model model
				,RedirectAttributes rdAttr, HttpServletRequest request,PayStub paystub) {
			
			System.out.println("!!!!!payStub : " + paystub);
			
			String url=null;
			PayStub plus =paystubService.selectone(payNo);
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
		
		//급여정정리스트 조회
		@RequestMapping("requestPayStub" )
		public String requestPayStubList(Model model,PayStub pay) {
			int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			List<Paystubplus> list= paystubService.requestlist(memberNo);
			//Paystubplus rList=paystubService.requeston(memberNo); 
			
//			System.out.println(list);
//			System.out.println(rList);
			model.addAttribute("list",list);
			//model.addAttribute("rList",rList);
			
			
			return "management/requestPayStub";
	
			
		}
		
		//급여정정 상세조회
		@ResponseBody
		@RequestMapping("request" )
		public String requestPayStub(Model model,Paystubplus pay,int corrNo) {
			System.out.println(corrNo);
			Paystubplus rList=paystubService.requeston(corrNo); 
		
			System.out.println(rList);
			model.addAttribute("rList",rList);
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

			 return gson.toJson(rList);
		
		

		}
		
		
		//반려상태 변경
	
		@RequestMapping("changePayStub/{corrNo}")
		public String Correction(Model model, @PathVariable int corrNo,HttpServletRequest request) {
			System.out.println("!" + corrNo);
		
			//UPDATE
			//int result=paystubService.correction(corrNo);
			
			//System.out.println("result : " + result);
			
			
			return "redirect:../requestPayStub";
		}
		
		//반려이유전송  
		@ResponseBody
		@RequestMapping("transmit")
		public String transmit(Model model,CorrectionReply cr) {
			System.out.println("여기" + cr);
			int storeNo = ((Store)model.getAttribute("loginEmployer")).getStoreNo();
			
			cr.setStoreNo(storeNo);
			int result=paystubService.transmit(cr);
			
			if(result>0) {
				result=paystubService.correction(cr.getCorrNo());
			}
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			 return gson.toJson(result);
		}
		
		//같은월 찾기
		//반려이유전송  
		@ResponseBody
		@RequestMapping("select")
		public String select(int month, Model model) {
			int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();			
			PayStub pmonth = new PayStub();
			pmonth.setMemberNo(memberNo);
			pmonth.setPayDay(month);
			List<Paystubplus> list = paystubService.requestMonthlist(pmonth);
			System.out.println(list);
			model.addAttribute("list",list);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(list);
		}
		
		// 같은월 찾기
		// 급여명세서
		@ResponseBody
		@RequestMapping("selectPaystub")
		public String selectPaystub(int month, Model model) {
			int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();			
			PayStub pmonth = new PayStub();
			pmonth.setMemberNo(memberNo);
			pmonth.setPayDay(month);
			List<PayStub> list = paystubService.selectPaystub(pmonth);
			System.out.println("list!!!!! : " + list);
			model.addAttribute("list",list);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			return gson.toJson(list);
		}
		
		
		
		 
		
		
}
