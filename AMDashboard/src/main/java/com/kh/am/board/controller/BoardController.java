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
    
    // 사장 인증 
    @ResponseBody
   	@RequestMapping(value="auth", method = RequestMethod.POST)
       public String auth(Model model, int storeNo) {
    	System.out.println("넘어와나..?" + storeNo);
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
    	System.out.println("최저시급"+ selectSal);
    	
    	return "board/CurrentSal";
    }
    
    
    
    // 뉴스 정보 조회
    @RequestMapping("newsBoard")
    public String selectnews(Model model) {
    	List<NewsBoard> selectnews = boardService.selectnews();
    	
    	model.addAttribute("selectnews",selectnews);
    		System.out.println("뉴스정보조회"+ selectnews);
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
            System.out.println("성공");
            status = "success";
            msg = "게시글 삽입 성공";
            path = "board/newsBoard";
        } else {
            System.out.println("실패");
            status = "error";
            msg = "게시글 삽입 실패";
            path = "board/newsBoard";
        }
        rdAttr.addFlashAttribute("status",status);
        rdAttr.addFlashAttribute("msg",msg);
        
        return path;
    }
    
    
}
