package com.company.cktree.member;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.cktree.exception.AlreadyExistingEmailException;
import com.company.cktree.exception.AlreadyExistingIdException;
import com.company.cktree.notifications.NotifyDAO;
import com.company.cktree.notifications.NotifyDTO;
import com.company.cktree.util.Email;
import com.company.cktree.util.EmailSender;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private NotifyDAO notifyDAO;

	@Inject
	private EmailSender emailSender;

	@Inject
	private Email email;

	@Override
	public void insertMember(MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
	
		// 기본주소와 상세주소 합치기
		String birth = "";
		birth += member.getBirthday();
		birth += "-";
		birth += member.getBirthday2();
		member.setBirthday(birth);
		int id = memberDAO.checkId(member.getM_id());
		int email = memberDAO.checkEmail(member.getM_email());
		if (id == 1) {
			throw new AlreadyExistingIdException(member.getM_id() + "is duplicate id.");
		}
		if (email == 1) {
			throw new AlreadyExistingEmailException(member.getM_email() + "is duplicate email.");
		}
		 
		memberDAO.insertMember(member);
	
	}

	@Override
	public MemberDTO loginCheck(MemberDTO member, HttpSession session) {
		MemberDTO m_dto = memberDAO.loginCheck(member);
		if (m_dto != null) {
			
			session.setAttribute("session_m_id", m_dto.getM_id());
			session.setAttribute("session_m_name", m_dto.getM_name());
			session.setAttribute("session_m_no", m_dto.getM_no());
			session.setAttribute("session_m_password", m_dto.getM_password());
			session.setAttribute("session_m_image", m_dto.getM_image());
			
			
		}
		return m_dto;
	}

	@Override
	public void keepLogin(String m_id, String session_id, Date session_limit) {
		memberDAO.keepLogin(m_id, session_id, session_limit);

	}

	@Override
	public Map<String, Object> checkUserWithSessionKey(String SESSIONKEY) {
		return memberDAO.checkUserWithSessionKey(SESSIONKEY);
	}

	@Override
	public MemberDTO findId(MemberDTO member) {
		return memberDAO.findId(member);
	}

	@Override
	public MemberDTO findPw(MemberDTO member) throws Exception {
		MemberDTO dto = memberDAO.findPw(member);
		String member_id = member.getM_id();
		String member_email = member.getM_email();
		if (dto != null) {
			String member_password = dto.getM_password();
			String member_name = dto.getM_name();
			email.setSubject("Chuckle Tree! " + member_name + "회원님이 요청하신 정보입니다.");
			email.setReceiver(member_email);
			email.setContent("회원님의 비밀번호는 " + member_password + " 입니다.");
			emailSender.SendEmail(email);
		
		}
		return dto;
	}

	@Override
	public int checkId(String id) {
		return memberDAO.checkId(id);
	}

	@Override
	public int checkEmail(String email) {	
		return memberDAO.checkEmail(email);
	}

	@Override
	public MemberDTO memberInfo(int m_no) {
		MemberDTO member = memberDAO.memberInfo(m_no);
		String birth = member.getBirthday().substring(0, 6); 
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");//문자열을 Date타입으로 변환하기 위한 변수
		SimpleDateFormat newDateFormat = new SimpleDateFormat("yy년 MM월 dd일"); //원하는 포맷으로 변환하기 위한 변수
		try {
			String formatDate = newDateFormat.format(dateFormat.parse(birth));
			member.setBirthday(formatDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public void memberModify(MemberDTO member,MultipartHttpServletRequest request) {		
		int email = memberDAO.checkEmail(member.getM_email());
		if(memberDAO.usingEmail(member)!=null){ //현재 내가 사용중인 이메일인 경우
			memberDAO.memberModify(member);
		} else {
		if (email == 1) {
				throw new AlreadyExistingEmailException(member.getM_email() + "is duplicate email.");
		}	
		memberDAO.memberModify(member);
		}
	}

	@Override
	public void leaveId(int m_no) {
		memberDAO.leaveId(m_no);
		
	}
	
	@Override
	public int pwChange(int m_no,String org_pw, String m_password, HttpSession session) {		
		if(memberDAO.checkMyPw(m_no, org_pw) == null) { //기존 비밀번호가 틀림
			return 2;
		}
		else if(!m_password.equals(memberDAO.checkMyPw(m_no, org_pw))) { //새 비밀번호와 기존 비밀번호가 일치 하지 않음
			memberDAO.pwChange(m_no, m_password);
			session.invalidate();
			return 0;
		} else { //새 비밀번호와 기존 비밀번호가 같음
			return 1;
		}
	}

	@Override
	public MemberDTO selectUserInfo(int m_no) {
		MemberDTO member = memberDAO.selectUserInfo(m_no);
		String birth = member.getBirthday().substring(0, 6); 
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");//문자열을 Date타입으로 변환하기 위한 변수
		SimpleDateFormat newDateFormat = new SimpleDateFormat("yy년 MM월 dd일"); //원하는 포맷으로 변환하기 위한 변수
		
		String formatDate;
		try {
			formatDate = newDateFormat.format(dateFormat.parse(birth));
			member.setBirthday(formatDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return member;
	}
}
