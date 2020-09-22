package com.kh.am.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.board.model.dao.BoardDAO;
import com.kh.am.board.model.vo.CurrentSal;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.NewsBoard;
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

    // 사업자번호, 이메일 인증 상태 변경 
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

    // 최저시급 조회
	@Override
	public List<CurrentSal> selectSal() {
		return boardDAO.selectSal();
	}
	
	   // 시급 등록
    @Override
    public int insertSal(CurrentSal currentSal) {
        return boardDAO.insertSal(currentSal);
    }

	// 뉴스정보 조회
	@Override
	public List<NewsBoard> selectnews() {
		return boardDAO.selectnews();
	}


	// 뉴스 등록
    @Override
    public int insertNews(NewsBoard newsBoard) {
        return boardDAO.insertnews(newsBoard);
    }

    // 시급 삭제
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteSal(int currentYear) {
        return boardDAO.deleteSal(currentYear);
    }

 



}
