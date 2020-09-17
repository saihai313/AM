package com.kh.am.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.Store;

@Repository
public class BoardDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    public Store storeConfirm;


    /** 사장 회원 조회 DAO
     * @return
     */
    public List<Store> storeList () {
        return sqlSession.selectList("boardMapper.storeList");
    }


    /** 알바 회원 조회 DAO
     * @return
     */
    public List<Employee> employeeList() {
        return sqlSession.selectList("boardMapper.employeeList");
    }


    /** 사장 회원 인증 DAO
     * @return
     */
    public List<Store> confirmList() {
        return sqlSession.selectList("boardMapper.confirmList");
    }


    public List<Store> storeConfirm(int storeNo) {
        return sqlSession.selectOne("boardMapper.storeConfirm", storeNo);
    }



}
