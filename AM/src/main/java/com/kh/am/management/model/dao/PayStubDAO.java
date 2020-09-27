package com.kh.am.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.management.model.vo.CorrectionReply;
import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;
import com.kh.am.management.model.vo.Paystubplus;

@Repository
public class PayStubDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<PayStub> selectList(int memberNo) {
	

		return sqlSession.selectList("paystubMapper.selectList",memberNo);
	}

	public PayStub selectone(int memberNo) {
		
		System.out.println("11111111");
		
		return sqlSession.selectOne("paystubMapper.selectone",memberNo);
	}

	public List<Paystubplus> requestlist(int memberNo) {
		
		return sqlSession.selectList("paystubMapper.requestlist",memberNo);
	}

	public Paystubplus requestone(int corrNo) {
		
		return sqlSession.selectOne("paystubMapper.requestone",corrNo);
	}

	public int correction(int corrNo) {
		System.out.println(sqlSession);
		System.out.println(corrNo);
		int result =  sqlSession.update("paystubMapper.correction",corrNo);
		System.out.println(result);
		return result;
	}

	public int transmit(CorrectionReply cr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("paystubMapper.transmit",cr);
	}

	public List<Paystubplus> requestMonthlist(PayStub pmonth) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("paystubMapper.requestMonthlist", pmonth);
	}

	public List<PayStub> selectPaystub(PayStub pmonth) {
		return sqlSession.selectList("paystubMapper.selectPaystub", pmonth);
	}

	public int check(int corrNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("paystubMapper.check",corrNo);
	}

}
