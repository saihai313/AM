package com.kh.am.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.am.board.model.dao.BoardDAO;
import com.kh.am.board.model.vo.Store;

@Service
public class BoardServiceImpl implements BoardService  {

    @Autowired
    private BoardDAO boardDAO;

    
    // 사장 조회 Service 구현
    @Override
    public List<Store> storeList(Store store) {
        return boardDAO.storeList(store);

    }


}
