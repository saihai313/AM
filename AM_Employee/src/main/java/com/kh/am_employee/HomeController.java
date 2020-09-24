package com.kh.am_employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.am_employee.member.model.vo.Member;
import com.kh.am_employee.pay.model.service.PayService;
import com.kh.am_employee.pay.model.vo.Pay;
import com.kh.am_employee.pay.model.vo.PayCorrection;

@SessionAttributes({"loginMember", "loginStore"})
@Controller 
public class HomeController {
	
	@Autowired
	private PayService payService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		if(model.getAttribute("loginMember") != null) {
			Member loginMember = (Member)model.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			// 1) 확인 안한 급여 명세서
			List<Pay> payList = payService.payListMain(memberNo);
			model.addAttribute("payListMain", payList);
			System.out.println(payList);
			
			// 2) 확인 안한 급여 정정 신청 결과
			List<PayCorrection> correctionList = payService.correctionListMain(memberNo);
			model.addAttribute("correctionListMain", correctionList);
			System.out.println(correctionList);
		}
		
		return "../../main";
	}
}
