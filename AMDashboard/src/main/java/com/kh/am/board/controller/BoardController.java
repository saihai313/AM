package com.kh.am.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.board.model.service.BoardService;
import com.kh.am.board.model.vo.CurrentSal;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.NewsBoard;
import com.kh.am.board.model.vo.Store;


@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
 public class BoardController {
        
    @Autowired
    private BoardService boardService;
    
    

    
    // 사장,알바 회원 조회
    @RequestMapping("boardList")
    public String storeList(Model model){
        
        List<Store> storeList = boardService.storeList();
        List<Employee> employeeList = boardService.employeeList();

        
        model.addAttribute("storeList",storeList);
        model.addAttribute("employeeList", employeeList);
        
        
        return "board/boardList";

    }
    
    
  // 사장 간략 조회
@RequestMapping("userConfirm") 
  public String confirmList(Model model) {
      
      List<Store> confirmList = boardService.confirmList();
      
      model.addAttribute("confirmList", confirmList);
      System.out.println(confirmList+"간단");
      
      return "board/userConfirm";
  }
  

 
    // 사장 상세 조회
    @ResponseBody
	@RequestMapping(value="storeConfirm", method = RequestMethod.POST)
    public String storeConfirm(Model model, int storeNo) {
        System.out.println("storeNo :" + storeNo);

        List<Store> storeConfirm = boardService.storeConfirm(storeNo);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

        return gson.toJson(storeConfirm);
    }
    
    // 사장 인증 화면 이동 
    @RequestMapping("viewAuth")
    public String viewAuth() {
        return "board/userConfirm";
    }
    
    // 사장 인증 
    @ResponseBody
   	@RequestMapping(value="auth", method = RequestMethod.POST)
       public String auth(Model model, int storeNo) {
    	int result = boardService.auth(storeNo);
    	
    	String str = null;
    System.out.println("str>>>" +str);
    	
    	
		if(result > 0) {
			str += "성공";
		}else {
			str += "실패";
		}
		return str;
    }
    
    
    // 최저시급 조회
    @RequestMapping("CurrentSal")
    public String selectSal(Model model) {
    	
    	List<CurrentSal> selectSal = boardService.selectSal();
    	model.addAttribute("selectSal",selectSal);
    	
    	return "board/CurrentSal";
    }
    
    // 시급 등록 화면 이동 
    @RequestMapping("viewSal")
    public String viewSal() {
        return "board/CurrentSal";
    }
    
    
    
    // 시급 등록
    @RequestMapping("insertSal")
    public String selectSal(CurrentSal currentSal,RedirectAttributes rdAttr, HttpServletRequest request) {
        
        System.out.println("시급등록"+currentSal);
        
        int result = boardService.insertSal(currentSal);
        
        String status;
        String msg;
        String path;
        if (result > 0) {
            status = "success";
            msg = "등록 성공";
            path = "redirect:" + request.getHeader("referer");
        } else {
            status = "error";
            msg = "등록 실패";
            path = "board/insertSal";
        }
        rdAttr.addFlashAttribute("status",status);
        rdAttr.addFlashAttribute("msg",msg);
        
        return path;
    }
    
    
    
    
    
    // 뉴스 정보 조회
    @RequestMapping("newsBoard")
    public String selectnews(Model model) {
    	List<NewsBoard> selectnews = boardService.selectnews();
    	model.addAttribute("selectnews",selectnews);
    	return "board/newsBoard";
    
    }
    
    
    
    // 뉴스 등록 화면 이동 
    @RequestMapping("news")
    public String main() {
        return "board/newsBoard";
    }
    
    
    
   // 뉴스 등록
    @RequestMapping("insertNews")
    public String insertNews(NewsBoard newsBoard, RedirectAttributes rdAttr, HttpServletRequest request) {
    	System.out.println("뉴스등록"+newsBoard);
    	
        int result = boardService.insertNews(newsBoard);
    	
        String status;
        String msg;
        String path;
        if (result > 0) {
            status = "success";
            msg = "등록 성공";
            path = "redirect:" + request.getHeader("referer");
        } else {
            status = "error";
            msg = "등록 실패";
            path = "board/news";
        }
        rdAttr.addFlashAttribute("status",status);
        rdAttr.addFlashAttribute("msg",msg);
        
        return path;
    }
    
    // 시급 삭제
    @ResponseBody
    @RequestMapping(value="deleteSal", method = RequestMethod.GET)
    public int deleteSal(Model model, int currentYear,HttpServletRequest request) {
    	System.out.println("녀도년도"+currentYear);
    	
        int result = boardService.deleteSal(currentYear);

        System.out.println("??"+result);
        
        String path;
        if(result>0) {
        	 path = "redirect:" + request.getHeader("referer");
        }else {
        	 path = "board/news";
        }
        
        return result;
        
    }
    
    
}
