package com.kh.am_employee.pay.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.member.model.vo.Store;
import com.kh.am_employee.pay.model.service.PayService;
import com.kh.am_employee.pay.model.vo.PageInfo;
import com.kh.am_employee.pay.model.vo.Pay;
import com.kh.am_employee.pay.model.vo.PayCorrRejection;
import com.kh.am_employee.pay.model.vo.PayCorrection;
import com.kh.am_employee.pay.model.vo.PayWork;

@SessionAttributes({"loginMember", "loginStore", "payWorkList"})
@Controller
@RequestMapping("/pay/*")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	//------------------------------- 급여 명세서 --------------------------------
	
	// 급여 명세서 목록
	@RequestMapping("payList")
	public String payList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
						  Model model){
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		// 1) 페이징 처리
		PageInfo pInfo = payService.pagination(cp, memberNo);
		
		// 2) 현재 로그인한 회원의 급여 명세서 목록
		List<Pay> payList = payService.payList(pInfo, memberNo);
		
		
		for(Pay p : payList) {
			if(p.getPayStatus().equals("N")) {
				if(payService.rePayStub(p.getPayNo()) > 0) {
					p.setCheck("(폐기)");;
				}
			}
		}
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("payList", payList);
		
		return "pay/payList";
	}
	
	// 급여 명세서 재발급 확인
	@ResponseBody
	@RequestMapping("rePayStub")
	public int rePayStub(int payNo) {
		return payService.rePayStub(payNo);
	}
	
	// 급여 명세서 상세 조회
	@RequestMapping("payView/{payNo}")
	public String payView(@PathVariable int payNo, 
						  Model model, RedirectAttributes rdAttr, HttpServletRequest request){

		Pay payView = payService.payView(payNo);
		String url = null;
		
		if(payView != null) {

			model.addAttribute("payView", payView);
			url = "pay/payView";
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			Date payCreateDate = payView.getPayCreateDate();
			List<PayWork> payWorkList = payService.payWorkView(memberNo, payCreateDate);
			
			if(payWorkList != null) {
				model.addAttribute("payWorkList", payWorkList);
			}
			
		}else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "해당 명세서가 존재하지 않습니다.");
			url = "redirect:/pay/payList";
		}
		
		return url;
	}
	
	// 급여 명세서 확인완료
	@ResponseBody
	@RequestMapping("payView/payConfirm/{payNo}")
	public String payConfirm(@PathVariable int payNo, Model model) {
		
		int result = payService.payConfirm(payNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(result);
	}
	
	// 급여 명세서 정정 신청
	@ResponseBody
	@RequestMapping("payView/payCorrection/{payNo}")
	public String payCorrection(@PathVariable int payNo, 
								String correctionContent,
								Model model) {
		
		// 회원 번호
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		// 가게 번호
		Store loginStore = (Store)model.getAttribute("loginStore");
		int storeNo = loginStore.getStoreNo();
		
		PayCorrection payCorr = new PayCorrection(correctionContent, memberNo, storeNo, payNo);
		
		int result = payService.payCorrection(payCorr);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(result);
	}
	
	
	//------------------------------- 급여 정정 신청 --------------------------------

	// 급여 정정 신청_목록
	@RequestMapping("correctionList")
	public String correctionList(@RequestParam(value="cp", required = false, defaultValue = "1") int cp,
						  Model model){
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		// 1) 페이징 처리
		PageInfo pInfo2 = payService.pagination2(cp, memberNo);
		
		// 2) 현재 로그인한 회원의 급여 명세서 목록
		List<PayCorrection> correctionList = payService.correctionList(pInfo2, memberNo);
		
		if(correctionList != null) {
			int tempNo = pInfo2.getListCount();
			
			for(PayCorrection c:correctionList) {
				
				// 3) 글번호 지정
				c.setTempNo(tempNo--);
				
				// 4) 정정 승인 시, 결과 변경
				if(c.getCorrectionStatus().equals("Y")) {
					payService.payConfirm2(c.getCorrectionNo());
					c.setCorrectionResult("명세서 재발급");
				}
				
			}
		}
		
		model.addAttribute("pInfo2", pInfo2);
		model.addAttribute("correctionList", correctionList);
		
		return "pay/correctionList";
	}
	
	// 급여 정정 신청_세부조회
	@ResponseBody
	@RequestMapping("correctionView")
	public String correctionView(int correctionNo, Model model) {
		
		// 1) 정정 신청 정보(PAY_CORR)
		PayCorrection payCorr = payService.correctionView(correctionNo);

		
		// 2) 정정 신청 반려 정보(PAY_CORR_RE)
		PayCorrRejection payCorrRe = payService.rejectionView(correctionNo);
		
		// 3) 해당 명세서 정보(PAY)
		Pay pay = payService.payView(payCorr.getPayNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payCorr", payCorr);
		map.put("payCorrRe", payCorrRe);
		map.put("pay", pay);
		
		Gson gson = new GsonBuilder().setDateFormat("YYYY-MM-dd").create();
	
		return gson.toJson(map);
	}
	
	// 급여 정정 신청_삭제
	@ResponseBody
	@RequestMapping("correctionDelete")
	public int correctionDelete(int correctionNo, int payNo, Model model) {
		
		int result = payService.correctionDelete(correctionNo, payNo);
		
		return result;
	}
	
	// 급여 정정 신청_수정
	@ResponseBody
	@RequestMapping("correctionUpdate")
	public String correctionUpdate(int correctionNo, String correctionContent, Date correctionCreateDate, Model model) {
		
		PayCorrection payCorr = new PayCorrection(correctionNo, correctionContent);
		int result = payService.correctionUpdate(payCorr);
		
		if(result > 0) {
			payCorr = payService.correctionView(correctionNo);
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(payCorr);
	}
	
	
	// 급여 명세서 확인완료
	@ResponseBody
	@RequestMapping("payReConfirm")
	public int payReConfirm(int payNo, int correctionNo, Model model) {
		
		int result = payService.payConfirm(payNo);
		
		if(result > 0) {
			result = payService.payConfirm2(correctionNo);
		}
		
		return result;
	}
		
		
	// 급여 명세서 정정 재신청
	@ResponseBody
	@RequestMapping("payReCorrection")
	public int payReCorrection(int payNo, String correctionContent, int correctionNo, Model model) {
		
		// 회원 번호
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		// 가게 번호
		Store loginStore = (Store)model.getAttribute("loginStore");
		int storeNo = loginStore.getStoreNo();
		
		PayCorrection payCorr = new PayCorrection(correctionContent, memberNo, storeNo, payNo);
		
		int result = payService.payCorrection(payCorr);
		
		// 이전 정정 신청 상태 변경(재신청)
		if(result > 0) {
			result = payService.payCorrectionRe(correctionNo);
			
		}else {
			result = -1;
		}
		
		return result;
	}
		
}
