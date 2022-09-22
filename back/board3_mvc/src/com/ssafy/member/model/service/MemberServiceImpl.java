package com.ssafy.member.model.service;

import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.dao.MemberDao;
import com.ssafy.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {

	private static MemberService memberService = new  MemberServiceImpl();
	private MemberDao memberDao;
	
	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getMemberDao();
	};
	
	public static MemberService getMemberService() {
		return memberService;
	}
	
	
	@Override
	public int idCheck(String userId) throws Exception {
		return memberDao.idCheck(userId);
	}

	@Override
	public void joinMember(MemberDto memberDto) throws Exception {
		// validation check (서버에서 유효성 체크)
		memberDao.joinMember(memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws Exception {
		return memberDao.loginMember(userId, userPwd);
	}

}
