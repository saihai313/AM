package com.kh.am.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.am.board.model.vo.CurrentSal;
import com.kh.am.board.model.vo.Employee;
import com.kh.am.board.model.vo.NewsBoard;
import com.kh.am.board.model.vo.Store;

@Repository
public class BoardDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    public Store storeConfirm;


    /** 사장 회원 조회 DAO
     * @return
     */
    public List<Store> storeList () {
        return sqlSession.selectList("boardMapper.storeList");
    }


    /** 알바 회원 조회 DAO
     * @return
     */
    public List<Employee> employeeList() {
        return sqlSession.selectList("boardMapper.employeeList");
    }


    /** 사장 회원 인증 DAO
     * @return
     */
    public List<Store> confirmList() {
        return sqlSession.selectList("boardMapper.confirmList");
    }


    /** 사장 정보 상세 조회
     * @param storeNo
     * @return
     */
    public List<Store> storeConfirm(int storeNo) {
        return sqlSession.selectList("boardMapper.storeConfirm", storeNo);
    }


	/** 사업자번호인증 상태 변경
	 * @param storeNo
	 * @return
	 */
	public int auth(int storeNo) {
		return  sqlSession.update("boardMapper.auth", storeNo);
	}


	/** 이메일 인증 상태 변경 
	 * @param storeNo
	 * @return
	 */
	public int auth2(int storeNo) {
		return  sqlSession.update("boardMapper.auth2", storeNo);
	}


	/** 최저 시급 조회
	 * @return 
	 */
	public List<CurrentSal> selectSal() {
		return sqlSession.selectList("boardMapper.selectSal");
	}

    /** 시급 등록
     * @param currentSal
     * @return
     */
    public int insertSal(CurrentSal currentSal) {
        return sqlSession.insert("boardMapper.insertSal",currentSal);
    }

	


    /** 시급 삭제
     * @param currentYear
     * @return
     */
    public int deleteSal(int currentYear) {
        return sqlSession.delete("boardMapper.deleteSal",currentYear);
    }


	/** 시급 한개 조회
	 * @param currentSal
	 * @return
	 */
	public int selectCheck(CurrentSal currentSal) {
		String check = sqlSession.selectOne("boardMapper.selectCheck",currentSal);
		
		int check2 =0;
		if(check == null) {
			check2 = 2;
		}else {
			check2 = 1;
		}
		return check2;
	}


	/** 시급 수정
	 * @param currentSal
	 * @return
	 */
	public int updateSal(CurrentSal currentSal) {
		return sqlSession.update("boardMapper.updateSal",currentSal);
	}


	/** 뉴스 정보 조회
	 * @return
	 */
	public List<NewsBoard> selectnews() {
		return sqlSession.selectList("boardMapper.selectNews");
	}


    /** 뉴스 등록
     * @param newsBoard
     * @return
     */
    public int insertnews(NewsBoard newsBoard) {
        return sqlSession.insert("boardMapper.insertNews", newsBoard);
    }



}
