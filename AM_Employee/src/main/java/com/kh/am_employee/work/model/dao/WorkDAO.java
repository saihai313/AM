package com.kh.am_employee.work.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am_employee.work.model.vo.WorkCalendar;

@Repository
public class WorkDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 알바생 스케줄 조회
	 * @param memberNo
	 * @return workCalendar
	 */
	public List<WorkCalendar> workCalendar(int memberNo) {
		return sqlSession.selectList("workMapper.workCalendar", memberNo);
	}

	/** 전체 스케줄 조회
	 * @param storeNo
	 * @return workCalendar
	 */
	public List<WorkCalendar> workCalendar2(int storeNo) {
		return sqlSession.selectList("workMapper.workCalendar2", storeNo);
	}
	
	
}
