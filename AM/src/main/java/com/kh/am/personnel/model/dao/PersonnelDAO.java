package com.kh.am.personnel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.personnel.model.vo.EmployeeInfo;
import com.kh.am.personnel.model.vo.ListInfo;

@Repository
public class PersonnelDAO {
	
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	/** 사장님 가게번호 조회
	 * @param memberNo
	 * @return
	 */
	public int selectStoreNo(int memberNo) {

		return sqlSession.selectOne("personnelMapper.selectStoreNo", memberNo);
	}


	public List<EmployeeInfo> selectList(int storeNo) {

		return sqlSession.selectList("personnelMapper.selectList", storeNo);
	}


	public EmployeeInfo selectInfo(int memberNo) {

		return sqlSession.selectOne("personnelMapper.selectInfo", memberNo);
	}


	public int deletePersonnel(int memberNo) {

		return sqlSession.update("personnelMapper.deletePersonnel", memberNo);
	}

}
