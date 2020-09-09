package com.kh.am.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.member.model.vo.Member;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 알바생 조회 DAO
	 * @param memberNo
	 * @return eList
	 */
	public List<Member> selectEmployeeList(int memberNo) {
		return sqlSession.selectList("payMapper.selectEmployeeList", memberNo);
	}
}
