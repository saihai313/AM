package com.kh.am_employee.pay.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am_employee.pay.model.dao.PayDAO;
import com.kh.am_employee.pay.model.vo.PageInfo;
import com.kh.am_employee.pay.model.vo.Pay;
import com.kh.am_employee.pay.model.vo.PayCorrRejection;
import com.kh.am_employee.pay.model.vo.PayCorrection;
import com.kh.am_employee.pay.model.vo.PayWork;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDAO payDAO;
	
	@Autowired
	private PageInfo pInfo;
	
	// 페이징 처리
	@Override
	public PageInfo pagination(int cp, int memberNo) {
		
		int listCount = payDAO.getListCount(memberNo);
		
		pInfo.setPageInfo(cp, listCount);
		return pInfo;
	}
	
	// 급여 명세서 목록
	@Override
	public List<Pay> payList(PageInfo pInfo, int memberNo) {
		return payDAO.payList(pInfo, memberNo);
	}

	// 급여 명세서 상세조회
	@Override
	public Pay payView(int payNo) {
		return payDAO.payView(payNo);
	}
	
	// 급여 명세서 상세조회_스케줄
	@Override
	public List<PayWork> payWorkView(int memberNo, Date payCreateDate) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("payCreateDate", payCreateDate);
		
		return payDAO.payWorkView(map);
	}

	// 급여 명세서 확인 완료
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int payConfirm(int payNo) {
		return payDAO.payConfirm(payNo);
	}

	// 급여 명세서 정정 신청
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int payCorrection(PayCorrection payCorr) {
		
		int result = payDAO.payCorrection(payCorr);
		
		if(result > 0) {
			result = payDAO.payCorrection2(payCorr.getPayNo());
		}
		
		return result;
	}

	// 급여 정정 신청 목록_페이지 처리
	@Override
	public PageInfo pagination2(int cp, int memberNo) {
		
		int listCount = payDAO.getListCount2(memberNo);
		
		pInfo.setPageInfo(cp, listCount);
		return pInfo;
	}

	// 급여 정정 신청_목록
	@Override
	public List<PayCorrection> correctionList(PageInfo pInfo2, int memberNo) {
		return payDAO.correctionList(pInfo, memberNo);
	}

	// 급여 정정 신청_세부조회
	@Override
	public PayCorrection correctionView(int correctionNo) {
		return payDAO.correctionView(correctionNo);
	}
	
	// 급여 정정 신청_세부조회(반려)
	@Override
	public PayCorrRejection rejectionView(int correctionNo) {
		return payDAO.rejectionView(correctionNo);
	}

	// 급여 정정 신청_삭제
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int correctionDelete(int correctionNo, int payNo) {
		
		// 1) 급여 정정 신청 삭제
		int result = payDAO.correctionDelete(correctionNo);
		
		// 2) 해당 급여 명세서 확인완료로 변경
		if(result > 0) {
			result = payDAO.payConfirm(payNo);
		}
		
		return result;
	}
	
	// 급여 정정 신청_수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int correctionUpdate(PayCorrection payCorr) {
		return payDAO.correctionUpdate(payCorr);
	}

	// 급여 정정 신청_확인 완료
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int payConfirm2(int correctionNo) {
		return payDAO.payConfirm2(correctionNo);
	}
	
	// 급여 정정 재신청_상태 변경
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int payCorrectionRe(int correctionNo) {
		return payDAO.payCorrectionRe(correctionNo);
	}
	

	// 메인_확인안한 급여 명세서
	@Override
	public List<Pay> payListMain(int memberNo) {
		return payDAO.payListMain(memberNo);
	}

	// 메인_확인 안한 급여 정정 결과
	@Override
	public List<PayCorrection> correctionListMain(int memberNo) {
		return payDAO.correctionListMain(memberNo);
	}

	

}
