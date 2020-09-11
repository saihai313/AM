package com.kh.am.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.am.board.model.vo.Store;

@Repository
public class BoardDAO {
    
    private SqlSessionTemplate sqlSession;


    /** 사장 조회 DAO
     * @return
     */
    public List<Store> storeList (Store store) {
        List<Store> list =  sqlSession.selectList("boardMapper.storeList", store);
        System.out.println(list+"");
        return list;
    }

}
