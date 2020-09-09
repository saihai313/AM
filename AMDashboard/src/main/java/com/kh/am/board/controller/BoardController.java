package com.kh.am.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.am.board.model.service.BoardService;
import com.kh.am.board.model.vo.Employer;
import com.kh.am.board.model.vo.PageInfo;

@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/board/*")
 public class BoardController {
    
    @Autowired
    public BoardService boardService;
    
    
    // 게시글 목록 조회 -- 나중에 페이지 추가
    @RequestMapping("boardList")
    public String employerList( Model model, @PathVariable int storeNo) {
        

        
        List<Employer> boardList = boardService.selectList(storeNo);
        
        return "board/boardList";
    }
    
    
    
    
}
