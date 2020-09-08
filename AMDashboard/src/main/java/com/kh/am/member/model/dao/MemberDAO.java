package com.kh.am.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.member.model.vo.Member;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    
    /** 로그인 DAO
     * @param member
     * @return loginMember
     */
    public Member login(Member member) {
        return sqlSession.selectOne("memberMapper.loginMember", member);
    }

}
