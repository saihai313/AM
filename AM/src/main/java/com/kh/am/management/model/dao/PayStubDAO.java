package com.kh.am.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.management.model.vo.PageInfo;
import com.kh.am.management.model.vo.PayStub;

@Repository
public class PayStubDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int paytublistCount(int type) {
		
		return sqlSession.selectOne("paystubMapper.paystublistCount",type);
	}

	public List<PayStub> selectList(PageInfo pInfo) {
		int offset =(pInfo.getCurrentPage()-1) *pInfo.getLimit();
		

		RowBounds rowBounds =new RowBounds(offset, pInfo.getLimit());
		

		return sqlSession.selectList("paystubMapper.selectList",pInfo,rowBounds);
	}

}
