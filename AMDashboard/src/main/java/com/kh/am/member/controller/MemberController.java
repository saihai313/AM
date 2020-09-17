package com.kh.am.member.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.am.member.model.service.MemberService;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember"})

@Controller
@RequestMapping("/member/*")
public class MemberController {

    
    @Autowired
    private MemberService memberService;
    
    
    
    // 로그인 동작
    @RequestMapping("loginAction")
    public String loginAction(Member member,Model model, RedirectAttributes rdAttr,
                              HttpServletResponse response) {
        
        System.out.println("member로그인"+member.getMemberEmail());
        System.out.println("memberps"+member.getMemberPwd());

        Member loginMember = memberService.login(member);
        
        if(loginMember == null) {
            rdAttr.addFlashAttribute("status", "error");
            rdAttr.addFlashAttribute("msg","로그인 실패");
            rdAttr.addFlashAttribute("text","아이디 또는 비밀번호를 확인해 주세요");
            
            return "redirect:/"; 

        }else {
            model.addAttribute("loginMember",loginMember);
        }
        
        System.out.println(loginMember);
        
        
         return "member/main";
    }
    
    
    // 로그아웃
    @RequestMapping("logout")
    public String logout(SessionStatus status) {
        status.setComplete();
        return "redirect:/";
    }
    
    
    // 마이페이지
    @RequestMapping("adminProfile")
    public String userProfile(SessionStatus status) {
        status.setComplete();
        return "member/adminProfile";
    }
    
        
    
    
    
    
    
    // DB 관련 예외가 발생할 경우 처리하는 메소드
    @ExceptionHandler({SQLException.class, BadSqlGrammarException.class}) 
    public String dbException(Exception e, Model model) {
        e.printStackTrace();
        
        model.addAttribute("errorMsg", "데이터베이스 관련 예외 발생");
        
        return "common/errorPage";
        
    }
    
    @ExceptionHandler(Exception.class) 
    public String etcException(Exception e, Model model, HttpServletRequest request) {
        e.printStackTrace();
        
        System.out.println(request.getRequestURI()); // 예외가 발생한 요청 주소
        System.out.println(e.getStackTrace()[0]); // 예외 내용의 첫 줄 
        System.out.println(e.getMessage()); // 예외 관련 메세지 출력
        
        model.addAttribute("errorMsg", "기타 예외 발생");
        return "common/errorPage";
        
    }
}
