package com.kh.am.board.model.service;

import java.util.List;

import com.kh.am.board.model.vo.Employer;

public interface BoardService {


    /** 게시글 목록 조회
     * @return boardList
     */
    List<Employer> selectList(int storeNo);
}




