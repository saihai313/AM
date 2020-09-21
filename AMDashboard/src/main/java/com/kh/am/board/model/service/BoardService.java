package com.kh.am.board.model.service;

import java.util.List;

import com.kh.am.board.model.vo.CurrentSal;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.NewsBoard;
import com.kh.am.board.model.vo.Store;

public interface BoardService {

    /**  사장 회원 조회 
     * @return
     */
    List<Store> storeList();

    /** 알바 회원 조회
     * @return
     */
    List<Employee> employeeList();

    /** 사장 회원 인증 
     * @return
     */
    List<Store> confirmList();

    /** 사장정보 상세 조회
     * @param storeNo
     * @return
     */
    List<Store> storeConfirm(int storeNo);

    
    
	/** 인증확인
	 * @param storeNo
	 * @return
	 */
	int auth(int storeNo);

	/** 최저시급 조회
	 * @return
	 */
	List<CurrentSal> selectSal();
	
	
    
    /** 시급 등록
     * @param currentSal
     * @return
     */
    int insertSal(CurrentSal currentSal);

    
    
	/** 뉴스 정보 조회
	 * @return
	 */
	List<NewsBoard> selectnews();

    /** 뉴스 등록
     * @param newsBoard
     * @return
     */
    int insertNews(NewsBoard newsBoard);


    
  
}



