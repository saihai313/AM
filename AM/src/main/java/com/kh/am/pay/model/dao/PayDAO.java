package com.kh.am.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 알바생 조회 DAO
	 * @param memberNo
	 * @return eList
	 */
	public List<Member> selectEmployeeList(int storeNo) {
		return sqlSession.selectList("payMapper.selectEmployeeList", storeNo);
	}

	/** 알바생 일한 정보 조회 DAO
	 * @param memberNo
	 * @return wc
	 */
	public WorkCalendar selectEmployeeWork(int memberNo) {
		return sqlSession.selectOne("payMapper.selectEmployeeWork", memberNo);
	}

	/** 알바생 일주일 근무시간 조회 DAO
	 * @param memberNo
	 * @return result
	 */
	public int selectOneDay(int memberNo) {
		return sqlSession.selectOne("payMapper.selectOneDay", memberNo);
	}
}
