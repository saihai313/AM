package com.kh.am.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.am.board.model.dao.BoardDAO;
import com.kh.am.board.model.vo.Employer;
import com.kh.am.board.model.vo.PageInfo;

public class BoardServiceImpl implements BoardService  {
    
    @Autowired
    private BoardDAO boardDAO;

    


    @Override
    public List<Employer> selectList(int storeNo) {
        return boardDAO.selectList(storeNo);
    }
    


}
