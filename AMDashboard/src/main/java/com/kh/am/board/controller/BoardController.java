package com.kh.am.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.am.board.model.service.BoardService;
import com.kh.am.board.model.vo.Store;
import com.kh.am.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
 public class BoardController {
        
    @Autowired
    private BoardService boardService;
    
    
//    @RequestMapping("boardList") 
//    public String boardList() {
//        return "board/boardList";
//    }주석
    
    @RequestMapping("boardList")
    public String storeList(Model model, Store store){
        
        List<Store> list = boardService.storeList(store);
        
        model.addAttribute("list",list);
        model.addAttribute("store", store);
        System.out.println(list+"controller");
        
        return "board/boardList";

    }
    
    
    
}
