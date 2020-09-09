package com.kh.am.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 사장님 가게 번호 조회
	 * @param memberNo
	 * @return 
	 */
	public int selectStoreNo(int memberNo) {
		return sqlSession.selectOne("calendarMapper.selectStoreNo", memberNo);
	}

	/** 스케쥴 조회(사장)
	 * @param storeNo
	 * @return list
	 */
	public List<WorkCalendar> selectCalendarM(int storeNo) {
		return sqlSession.selectList("calendarMapper.selectCalendarM", storeNo);
	}

	/** 스케쥴 조회(알바)
	 * @param storeNo
	 * @return list
	 */
	public List<WorkCalendar> selectCalendarS(int memberNo) {
		return sqlSession.selectList("calendarMapper.selectCalendarS", memberNo);
	}

	
	/** 알바생 이름 조회
	 * @param storeNo
	 * @return
	 */
	public List<Member> selectEName(int storeNo) {
		return sqlSession.selectList("calendarMapper.selectEName", storeNo);
	}

	/** 스케쥴 삽입 1개
	 * @param insertCal
	 * @return
	 */
	public int insertCalendar(WorkCalendar insertCal) {
		return sqlSession.insert("calendarMapper.insertCalendar", insertCal);
	}
	
}
