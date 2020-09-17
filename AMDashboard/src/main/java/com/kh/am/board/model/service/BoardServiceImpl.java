package com.kh.am.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.board.model.dao.BoardDAO;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.Store;

@Service
public class BoardServiceImpl implements BoardService  {

    @Autowired
    private BoardDAO boardDAO;

    
    // 사장 회원 조회 Service 구현
    @Override
    public List<Store> storeList() {
        return boardDAO.storeList();

    }

    
    // 알바 회원 조회 Service 구현
    @Override
    public List<Employee> employeeList() {
        return boardDAO.employeeList();
    }


    // 사장 회원 인증 Service 구현
    @Override
    public List<Store> confirmList() {
        return boardDAO.confirmList();
    }

    // 사장 정보 상세 조회
    @Transactional(rollbackFor = Exception.class)
    @Override
    public List<Store> storeConfirm(int storeNo) {
        return boardDAO.storeConfirm( storeNo);
    }

    // 인증 확인
    @Transactional(rollbackFor = Exception.class)
	@Override
	public int auth(int storeNo) {
    	
    	int result1 = boardDAO.auth(storeNo);
    	
    	int result = 0;
    	if(result1 > 0) {
    		
    		result = boardDAO.auth2(storeNo);
    	}
    	
    	
		return result;
	}



}
