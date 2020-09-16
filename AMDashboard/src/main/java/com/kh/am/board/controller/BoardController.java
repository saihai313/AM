package com.kh.am.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
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
    @PostMapping("storeConfirm/{storeNo}" )
    public String storeConfirm(Model model, int storeNo) {
        System.out.println("storeNo :" + storeNo);

        List<Store> storeConfirm = boardService.storeConfirm(storeNo);
        model.addAttribute("storeConfirm", storeConfirm);

        
        System.out.println(storeConfirm+"컨틀ㄹ러");
        
        Gson gson = new Gson();

        return gson.toJson(storeConfirm);
    }
    
}
