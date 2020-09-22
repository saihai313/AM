package com.kh.am.personnel.model.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.am.personnel.model.dao.PersonnelDAO;
import com.kh.am.personnel.model.vo.EmployeeInfo;
import com.kh.am.personnel.model.vo.ListInfo;
import com.kh.am.personnel.model.vo.MailUtils;
import com.kh.am.personnel.model.vo.MemberAuth;


@Service
public class PersonnelServiceImpl implements PersonnelService{

	@Autowired
	private PersonnelDAO personnelDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	// 사장님 가게 번호 조회
	@Override
	public int selectStoreNo(int memberNo) {
		
		int storeNo = personnelDAO.selectStoreNo(memberNo);
		
		return storeNo;
	
	}


	// 직원 목록조회
	@Override
	public List<EmployeeInfo> selectList(int storeNo) {

		List<EmployeeInfo> personnelList = personnelDAO.selectList(storeNo);
		
		
		return personnelList;
	}

	// 직원 상세정보 조회
	@Override
	public EmployeeInfo selectInfo(int memberNo) {

		EmployeeInfo eInfo = personnelDAO.selectInfo(memberNo);
		
		
		return eInfo;
	}

	
	// 직원 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deletePersonnel(int memberNo) {

		return personnelDAO.deletePersonnel(memberNo);
	}

	// 시급 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateHourlyWage(int memberNo, int sal) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("sal", sal);
		
		return personnelDAO.updateHourlyWage(map);
	}


	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inserAuthKey(String employeeEmail, int storeNo, String authKey) throws MessagingException, UnsupportedEncodingException {
		
		/*
		 * String authkey = new TempKey().getKey(6, false);
		 * 
		 * MemberAuth.setAuthKey(authkey);
		 */

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("AM 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/am/personnel/updateAuthKey?employeeEmail=")
				.append(employeeEmail)
				.append("&authKey=")
				.append(authKey)
				.append("'target='_blank'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("testforam3@gmail.com", "운영자");
		sendMail.setTo(employeeEmail);
		sendMail.send();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeEmail", employeeEmail);
		map.put("storeNo", storeNo);
		map.put("authKey", authKey);
		
		return personnelDAO.inserAuthKey(map);
	}

	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAuthKey(String employeeEmail, String authKey) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeEmail", employeeEmail);
		map.put("authKey", authKey);
		
		return personnelDAO.updateAuthKey(map);
	}

	


}
