package com.company.cktree.authentications;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.cktree.exception.AlreadyExistingPhoneException;
import com.company.cktree.member.MemberDAO;
import com.company.cktree.member.MemberDTO;
import com.company.cktree.validator.AuthenticationValidator;

@Controller
public class AuthenController {
	
	@Inject
	private AuthenService authenService;
	@Inject
	private MemberDAO memberDAO;
	
	@RequestMapping("join")
	public String join() {	
		return "join/joinAuthentication";
	}
	
	//이메일 보내면서 DB에 인증코드 삽입
	@ResponseBody
	@RequestMapping("sendMail")
	public boolean sendEmail(@ModelAttribute("member") MemberDTO member, BindingResult errors) throws Exception {			
		new AuthenticationValidator().validate(member, errors);
		if (errors.hasErrors()) {
			return false;
		}
		
		try {
			authenService.sendSMS(member);
		
		} catch (AlreadyExistingPhoneException e) {
			errors.rejectValue("m_phone", "duplicate", "이미 사용된 번호입니다.");
			return false;
		} 
		return true;
	}
	
	//등록된 인증번호가 있는지 조회
	@ResponseBody
	@RequestMapping("requestAuthentication")
	public Map<String,Object> requestAuthentication(String authen_code){
		Map<String,Object> result = new HashMap<>();
		result.put("authen",authenService.checkAuthenCode(authen_code));
		return result;	
	}
	
	
	//핸드폰번호 중복검사
	@ResponseBody
	@RequestMapping("checkPhone")
	public Map<String,Object> checkPhone(String m_phone){
		Map<String,Object> result = new HashMap<>();
		result.put("m_phone", memberDAO.checkPhone(m_phone));
		return result;
	}
}
