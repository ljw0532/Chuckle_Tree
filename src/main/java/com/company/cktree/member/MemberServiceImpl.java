package com.company.cktree.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO member) {
		memberDAO.insertMember(member);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO member, HttpSession session) {
		MemberDTO m_dto = memberDAO.loginCheck(member);
		if(m_dto != null) {
			session.setAttribute("session_m_id", m_dto.getM_id());
			session.setAttribute("session_m_name", m_dto.getM_name());
			session.setAttribute("session_m_no", m_dto.getM_no());
			session.setAttribute("session_m_password", m_dto.getM_password());
		}
		return m_dto;
	}

}
