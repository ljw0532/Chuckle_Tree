package com.company.cktree.authentications;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.company.cktree.member.MemberDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;	

@Service("AuthenService")
public class AuthenServiceImpl implements AuthenService {

	@Inject
	private AuthenDAO authenDAO;
	
	@Override
	public void sendSMS(MemberDTO member) {
		
		String api_key = "api_key";
		String api_secret = "api_secret";
		
		
		String m_phone = member.getM_phone();
		String rand =  Integer.toString((int)Math.round(Math.random()*1000000));//랜덤 6자리 숫자 생성
		Map<String,Object> map = new HashMap<>(); //DB에 보내기위한 map
		map.put("authen_code", rand);
		map.put("m_phone", m_phone);
		map.put("m_name", member.getM_name());
		authenDAO.insertAuthenCode(map); //DB에 인증코드,이름,폰번호를 삽입
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String,String> set = new HashMap<>();
		set.put("to", "01041472676");//수신번호
		set.put("from", m_phone);//발신번호
		set.put("text", "[Chuckle Tree!] 본인인증을 위해 인증번호 ["+ rand +"]를 입력해 주세요."); //문자내용
		set.put("type", "sms");
		
		try {
			JSONObject result = (JSONObject)coolsms.send(set);
			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			e.printStackTrace();
		}	
	}

	@Override
	public AuthenDTO checkAuthenCode(String authen_code) {
		AuthenDTO dto = authenDAO.selectAuthenCode(authen_code);
		if(dto != null){ //인증이 되면
			authenDAO.updateComDate(dto.getAuthen_no());//인증완료시 완료시간 업데이트
			authenDAO.deleteAuthen(); //완료시간이 없는 데이터들은 삭제 (한 이메일로 인증이 여러번 요청된 경우)
			return dto;
		} else {
			return dto;
		}
	}

}
