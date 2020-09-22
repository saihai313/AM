package com.kh.am.personnel.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.vo.Member;
import com.kh.am.member.model.vo.Store;
import com.kh.am.personnel.model.service.PersonnelService;
import com.kh.am.personnel.model.vo.EmployeeInfo;

@SessionAttributes({"loginMember","loginEmployer"})
@Controller
@RequestMapping("/personnel/*")
public class PersonnelController {
	
	
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
	
	//회원 가입
	
	@RequestMapping("insertAuthKey")
	public String insertAuthKey(@RequestParam
								String employeeEmail,
								RedirectAttributes rdAttr,
								HttpServletRequest request,
								Model model) throws UnsupportedEncodingException, MessagingException {

		int storeNo = ((Store)model.getAttribute("loginEmployer")).getStoreNo();
		
		System.out.println(employeeEmail);
		String authKey = init();
		
		int result = 0;
		
		if(authKey != null) {
			
		result = personnelService.inserAuthKey(employeeEmail, storeNo, authKey);
			
		}
		
		
		
		String status = null;
		String msg = null;
		String url = null;
		
		if(result > 0) {
			status = "success";
			msg = "메일 전송 성공!";
			url = "/personnel/personnelList";
		}else {
			status = "error";
			msg = "메일 전송 실패!";
			url = request.getHeader("referer");
			
		}
	
		rdAttr.addFlashAttribute("status", status);
		rdAttr.addFlashAttribute("msg", msg);
			
			
		return "redirect:" + url;
	}
	
    
    @SuppressWarnings("unused")
	private String init() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        
        int num = 0;
        
        do {
            num = ran.nextInt(75) + 48;
            
            if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < 6);
        
        if(false) {
            return sb.toString().toLowerCase();
        }
        
        return sb.toString();
    }
    
    @RequestMapping("updateAuthKey")
    public void updateAuthKey(@RequestParam
    							String employeeEmail, @RequestParam String authKey) {
    	
    	int result = personnelService.updateAuthKey(employeeEmail, authKey);
    }
	

}
