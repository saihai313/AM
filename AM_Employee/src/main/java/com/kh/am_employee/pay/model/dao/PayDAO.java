package com.kh.am_employee.pay.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am_employee.pay.model.vo.PageInfo;
import com.kh.am_employee.pay.model.vo.Pay;
import com.kh.am_employee.pay.model.vo.PayCorrRejection;
import com.kh.am_employee.pay.model.vo.PayCorrection;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 급여 명세서_글 목록 개수
	 * @param memberNo
	 * @return listCount
	 */
	public int getListCount(int memberNo) {
		return sqlSession.selectOne("payMapper.getListCount", memberNo);
	}
	
	
	/** 급여 명세서_페이징 처리
	 * @param pInfo
	 * @param memberNo
	 * @return
	 */
	public List<Pay> payList(PageInfo pInfo, int memberNo) {
		
		int offset =(pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("payMapper.payList", memberNo, rowBounds);
	}


	/** 급여 명세서 상세 조회
	 * @param payNo
	 * @return payView
	 */
	public Pay payView(int payNo) {
		return sqlSession.selectOne("payMapper.payView", payNo);
	}


	/** 급여 명세서 확인 완료
	 * @param payNo
	 * @return result
	 */
	public int payConfirm(int payNo) {
		return sqlSession.update("payMapper.payConfirm", payNo);
	}


	/** 급여 명세서 정정 신청
	 * @param payCorr
	 * @return result
	 */
	public int payCorrection(PayCorrection payCorr) {
		return sqlSession.insert("payMapper.payCorrection", payCorr);
	}


	/** 급여 명세서 정정 신청_급여 상태 변경
	 * @param payNo
	 * @return
	 */
	public int payCorrection2(int payNo) {
		return sqlSession.update("payMapper.payCorrection2", payNo);
	}


	/** 급여 명세서 정정 신청 목록_개수
	 * @param memberNo
	 * @return pInfo
	 */
	public int getListCount2(int memberNo) {
		return sqlSession.selectOne("payMapper.getListCount2", memberNo);
	}


	/** 급여 명세서 정정 신청_목록
	 * @param pInfo2
	 * @param memberNo
	 * @return correctionList
	 */
	public List<PayCorrection> correctionList(PageInfo pInfo2, int memberNo) {

		int offset =(pInfo2.getCurrentPage()-1) * pInfo2.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo2.getLimit());

		return sqlSession.selectList("payMapper.correctionList", memberNo, rowBounds);
	}


	/** 급여 정정 신청_세부조회
	 * @param correctionNo
	 * @return payCorr
	 */
	public PayCorrection correctionView(int correctionNo) {
		return sqlSession.selectOne("payMapper.correctionView", correctionNo);
	}

	/** 급여 정정 신청_세부조회
	 * @param correctionNo
	 * @return payCorrRe
	 */
	public PayCorrRejection rejectionView(int correctionNo) {
		return sqlSession.selectOne("payMapper.rejectionView", correctionNo);
	}


	/** 급여 정정 신청_삭제
	 * @param correctionNo
	 * @return result 
	 */
	public int correctionDelete(int correctionNo) {
		return sqlSession.update("payMapper.correctionDelete", correctionNo);
	}


	/** 급여 정정 신청_수정
	 * @param correctionNo
	 * @param correctionContent 
	 * @return result
	 */
	public int correctionUpdate(PayCorrection payCorr) {
		return sqlSession.update("payMapper.correctionUpdate", payCorr);
	}


	/** 급여 정정 신청_확인 완료
	 * @param correctionNo
	 * @return result
	 */
	public int payConfirm2(int correctionNo) {
		return sqlSession.update("payMapper.payConfirm2", correctionNo);
	}
	
	/** 급여 정정 재신청_상태 변경
	 * @param payCorr
	 * @return result
	 */
	public int payCorrectionRe(PayCorrection payCorr) {
		return sqlSession.update("payMapper.payCorrectionRe", payCorr);
	}


	/** 메인_확인 안한 급여 명세서
	 * @param memberNo
	 * @return payList
	 */
	public List<Pay> payListMain(int memberNo) {
		return sqlSession.selectList("payMapper.payListMain", memberNo);
	}


	/** 메인_확인 안한 급여 정정 결과
	 * @param memberNo
	 * @return correctionList
	 */
	public List<PayCorrection> correctionListMain(int memberNo) {
		return sqlSession.selectList("payMapper.correctionListMain", memberNo);
	}


	

}
