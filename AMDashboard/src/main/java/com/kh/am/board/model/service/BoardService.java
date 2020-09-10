package com.kh.am.board.model.service;

import java.util.List;

import com.kh.am.board.model.vo.Store;

public interface BoardService {

    /**  게시글 조회 
     * @return
     */
    List<Store> storeList(Store store);
}



