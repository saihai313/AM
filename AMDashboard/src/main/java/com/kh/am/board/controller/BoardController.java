package com.kh.am.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.am.board.model.service.BoardService;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.Store;


@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
 public class BoardController {
        
    @Autowired
    private BoardService boardService;
    
    

    
    /** 사장,알바 회원 조회
     * @param model 
     * @return
     */
    @RequestMapping("boardList")
    public String storeList(Model model){
        
        List<Store> storeList = boardService.storeList();
        List<Employee> employeeList = boardService.employeeList();

        
        model.addAttribute("storeList",storeList);
        model.addAttribute("employeeList", employeeList);
        
        
        return "board/boardList";

    }
    
    
  /** 사장 간략 조회
 * @param model
 * @return
 */
@RequestMapping("userConfirm") 
  public String confirmList(Model model) {
      
      List<Store> confirmList = boardService.confirmList();
      
      model.addAttribute("confirmList", confirmList);
      System.out.println(confirmList+"간단");
      
      return "board/userConfirm";
  }
  

 
    @ResponseBody
	@RequestMapping(value="storeConfirm", method = RequestMethod.POST)
    public String storeConfirm(Model model, int storeNo) {
        System.out.println("storeNo :" + storeNo);

        List<Store> storeConfirm = boardService.storeConfirm(storeNo);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

        return gson.toJson(storeConfirm);
    }
    
    @ResponseBody
   	@RequestMapping(value="auth", method = RequestMethod.POST)
       public String auth(Model model, int storeNo) {
    	System.out.println("넘어와나..?" + storeNo);
    	int result = boardService.auth(storeNo);
    	
    	String str=null;
    	
    	
		if(result > 0) {
			str += "성공";
		}else {
			str += "실패";
			
		}
		return str;
    	
    	
    }
    
    
}
