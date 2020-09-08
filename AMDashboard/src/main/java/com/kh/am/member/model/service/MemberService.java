package com.kh.am.member.model.service;

import com.kh.am.member.model.vo.Member;

public interface MemberService {

    /** 로그인 Service
     * @param member
     * @return loginMember
     */
    Member login(Member member);

}
