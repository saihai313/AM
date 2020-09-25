package com.kh.am.pay.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;
import com.kh.am.pay.model.vo.Pay;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 알바생 조회 DAO!!
	 * @param memberNo
	 * @return eList
	 */
	public List<Member> selectEmployeeList(int storeNo) {
		return sqlSession.selectList("payMapper.selectEmployeeList", storeNo);
	}

	/** 알바생 일한 정보 조회 DAO!
	 * @param map
	 * @return wc
	 */
	public WorkCalendar selectEmployeeWork(Map<String, Object> map) {
		return sqlSession.selectOne("payMapper.selectEmployeeWork", map);
	}

	/** 알바생 총급여, 주휴수당 조회 DAO
	 * @param pay
	 * @return payTotal
	 */
	public Pay selectOnePay(Pay pay) {
		return sqlSession.selectOne("payMapper.selectOnePay", pay);
	}

	/** 급여 등록 DAO
	 * @param pay
	 * @return result
	 */
	public int insertPay(Pay pay) {
		return sqlSession.insert("payMapper.insertPay", pay);
	}
	
	
	/** 급여명세서 수정 DAO
	 * @param pay
	 * @return result
	 */
	public int updatePay(Pay pay) {
		return sqlSession.update("payMapper.updatePay", pay);
	}

}
