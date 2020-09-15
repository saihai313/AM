package com.kh.am.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.kh.am.calendar.model.vo.PartTime;
import com.kh.am.calendar.model.vo.UpdateWorkCalendar;
import com.kh.am.calendar.model.vo.WorkCalendar;
import com.kh.am.member.model.vo.Member;

public interface CalendarService{

	/** 사장님 전체 스케쥴 조회
	 * @param memberNo
	 * @return list
	 */
	List<WorkCalendar> selectList(int memberNo);

	/** 알바생 스케쥴 조회
	 * @param memberNo
	 * @return list
	 */
	List<WorkCalendar> selectListStaff(int memberNo);

	/** 사장님 가게번호 조회
	 * @param memberNo
	 * @return storeNo
	 */
	int selectStoreNo(int memberNo);

	/** 알바생 목록 조회 (이름)
	 * @param storeNo
	 * @return eList
	 */
	List<Member> selectEList(int storeNo);

	/** 스케쥴 삽입
	 * @param insertCal
	 * @param memberNo
	 * @return result
	 */
	int insertCalendar(WorkCalendar insertCal, int memberNo);

	/** 스케쥴 업데이트
	 * @param updateCal
	 * @param memberNo 
	 * @return result
	 */
	int updateCalendar(UpdateWorkCalendar updateCal, int memberNo);

	/** 스케쥴 삭제
	 * @param deleteCal
	 * @param memberNo
	 * @return result
	 */
	int deleteCalendar(WorkCalendar deleteCal, int memberNo);

	/** 파트타임 목록 조회
	 * @param storeNo
	 * @return pList
	 */
	List<PartTime> selectPList(int storeNo);

	/** 파트 타임 페이지 파트타임 목록 조회
	 * @param memberNo
	 * @return list
	 */
	List<PartTime> selectPartTime(int memberNo);

	/** 파트타임 삭제
	 * @param partTime
	 * @return result
	 */
	int partTimeDelete(PartTime partTime);

	/** 파트타임 업데이트
	 * @param map
	 * @return result
	 */
	int partTimeUpdate(PartTime partTime);

	/** 파트타임 삽입
	 * @param partTime
	 * @return result
	 */
	int partTimeInsert(PartTime partTime);


}