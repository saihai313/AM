package com.kh.am_employee.pay.model.service;

import java.sql.Date;
import java.util.List;

import com.kh.am_employee.pay.model.vo.PageInfo;
import com.kh.am_employee.pay.model.vo.Pay;
import com.kh.am_employee.pay.model.vo.PayCorrRejection;
import com.kh.am_employee.pay.model.vo.PayCorrection;
import com.kh.am_employee.pay.model.vo.PayWork;

public interface PayService {

	/** 급여명세서 목록_페이징 처리
	 * @param cp
	 * @param memberNo
	 * @param boardType 
	 * @return pInfo
	 */
	PageInfo pagination(int cp, int memberNo);
	
	/** 급여 명세서 목록 
	 * @param pInfo 
	 * @param memberNo 
	 * @return payList
	 */
	List<Pay> payList(PageInfo pInfo, int memberNo);
	
	/** 급여 명세서 재발급 확인
	 * @param payNo
	 * @return result
	 */
	int rePayStub(int payNo);

	/** 급여 명세서 상세조회
	 * @param payNo
	 * @return payView
	 */
	Pay payView(int payNo);
	
	/** 급여 명세서 상세조회_스케줄
	 * @param memberNo
	 * @param payDate
	 * @return payWorkList
	 */
	List<PayWork> payWorkView(int memberNo, Date payCreateDate);

	/** 급여 명세서 확인 완료
	 * @param payNo
	 * @return result
	 */
	int payConfirm(int payNo);

	/** 급여 명세서 정정 신청
	 * @param payCorr
	 * @return result
	 */
	int payCorrection(PayCorrection payCorr);

	/** 급여 정정 신청_목록
	 * @param pInfo
	 * @param memberNo
	 * @return correctionList
	 */
	List<PayCorrection> correctionList(PageInfo pInfo2, int memberNo);

	/** 급여 정정 신청 _목록_페이지 처리
	 * @param cp
	 * @param memberNo
	 * @return pInfo2
	 */
	PageInfo pagination2(int cp, int memberNo);

	/** 급여 정정 신청_세부조회
	 * @param correctionNo
	 * @return payCorr
	 */
	PayCorrection correctionView(int correctionNo);
	
	/** 급여 정정 신청_세부조회(반려)
	 * @param correctionNo
	 * @return
	 */
	PayCorrRejection rejectionView(int correctionNo);

	/** 급여 정정 신청_삭제
	 * @param correctionNo
	 * @param payNo 
	 * @return result
	 */
	int correctionDelete(int correctionNo, int payNo);

	/** 급여 정정 신청_수정
	 * @param correctionNo
	 * @param correctionContent 
	 * @return result
	 */
	int correctionUpdate(PayCorrection payCorr);

	/** 급여 정정 신청_확인 완료
	 * @param correctionNo
	 * @return
	 */
	int payConfirm2(int correctionNo);
	
	/** 급여 정정 재신청_상태 변경
	 * @param payCorr
	 * @return
	 */
	int payCorrectionRe(int correctionNo);

	
	/** 메인_확인 안한 급여 명세서
	 * @param memberNo
	 * @return payList
	 */
	List<Pay> payListMain(int memberNo);

	/** 메인_확인 안한 급여 정정 결과
	 * @param memberNo
	 * @return correctionList
	 */
	List<PayCorrection> correctionListMain(int memberNo);


}
