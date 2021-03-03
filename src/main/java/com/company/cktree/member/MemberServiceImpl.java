package com.company.cktree.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO member) {
		memberDAO.insertMember(member);
	}

}
