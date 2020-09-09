package com.kh.am.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.am.board.model.vo.Employer;

public class BoardDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    /** 게시글 목록 조회
     * @return
     */
    public List<Employer> selectList(int storeNo) {
        return sqlSession.selectList("boardMapper.selectList",storeNo);
    }

}
