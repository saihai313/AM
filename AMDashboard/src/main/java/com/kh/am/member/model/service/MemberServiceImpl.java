package com.kh.am.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.am.member.model.dao.MemberDAO;
import com.kh.am.member.model.vo.Member;



@Service
public class MemberServiceImpl implements MemberService{
    
    @Autowired 
    private MemberDAO memberDAO;
    
    @Autowired
    private BCryptPasswordEncoder bcPwd;
    
    
    
    // 로그인 Service 구현-- 아무거나 되는중 
    @Override
    public Member login(Member member) {
        
        Member loginMember = memberDAO.login(member);
        if(member.getMemberPwd().equals(loginMember.getMemberPwd())) {
            // 비교가 끝난 조회된 비밀번호 삭제 
            loginMember.setMemberPwd(null);
        }else {
            loginMember = null;
        }
        /*
        if(loginMember != null) {
            if(!bcPwd.matches(member.getMemberPwd(),
                        loginMember.getMemberPwd())) {
                
                loginMember = null;
            }else {
                // 비교가 끝난 조회된 비밀번호 삭제 
                loginMember.setMemberPwd(null);
            }
       }
       */
        
        return loginMember;
    }

}
