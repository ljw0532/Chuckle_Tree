package com.company.cktree.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.company.cktree.member.MemberDTO;

public class JoinRequestValidator implements Validator {
	private static final String IDEXP = "^[a-z0-9]{5,20}$";
	private static final String PWEXP = "^(?=.*[a-zA-Z])(?=.*[!@#$%^&*\\(\\)\\.\\,_+=-])(?=.*[0-9]).{8,16}$";
	private static final String BIRTHEXP1 = "^(\\d{6,})+$";
	private static final String BIRTHEXP2 = "^(\\d{7,})+$";
	private static final String ZIPCODEEXP = "^(\\d{1,7})+$";
	private static final String ADDREXP = "^[a-zA-Z0-9°¡-ÆR]$";
	
	private static final String EMAILEXP = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";

	private Pattern idPattern;
	private Pattern pwPattern;
	private Pattern birthPattern1;
	private Pattern birthPattern2;
	private Pattern zipcodePattern;
	private Pattern addrPattern;
	
	private Pattern emailPattern;
	
	public JoinRequestValidator() {
		idPattern = Pattern.compile(IDEXP);
		pwPattern = Pattern.compile(PWEXP);		
		birthPattern1 = Pattern.compile(BIRTHEXP1);
		birthPattern2 = Pattern.compile(BIRTHEXP2);
		zipcodePattern = Pattern.compile(ZIPCODEEXP);
		addrPattern = Pattern.compile(ADDREXP);
		emailPattern = Pattern.compile(EMAILEXP);
	
		
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO member = (MemberDTO) target;
		
		//¾ÆÀÌµð
		if(member.getM_id() == null || member.getM_id().trim().isEmpty()) {
			errors.rejectValue("m_id","required");
		} 
		else {
			Matcher matcher = idPattern.matcher(member.getM_id());
			if (!matcher.matches()) {
				errors.rejectValue("m_id", "bad");
			}
		}
			 
		//ºñ¹Ð¹øÈ£
		if (member.getM_password() == null || member.getM_password().trim().isEmpty()) {
			errors.rejectValue("m_password", "required");
		} else {
			Matcher matcher = pwPattern.matcher(member.getM_password());
		if (!matcher.matches()) {
			errors.rejectValue("m_password", "bad");
			}
		}
		
		//ºñ¹Ð¹øÈ£ Ã¼Å©
		if (member.getM_password2() == null || member.getM_password2().trim().isEmpty()) {
			errors.rejectValue("m_password2", "required");
		} else if(!member.getM_password().isEmpty()) {
			if(!member.isPwEquals()) {
				errors.rejectValue("m_password2", "nomatch");
			}
		}
		
		//ÁÖ¹Îµî·Ï¹øÈ£1
		if (member.getBirthday() == null || member.getBirthday().trim().isEmpty()) {
			errors.rejectValue("birthday", "required");
		} else {
			Matcher matcher = birthPattern1.matcher(member.getBirthday());
			if (!matcher.matches()) {
				errors.rejectValue("birthday", "bad");
			}
		}
		
		//ÁÖ¹Îµî·Ï¹øÈ£2
		if (member.getBirthday2() == null || member.getBirthday2().trim().isEmpty()) {
			errors.rejectValue("birthday2", "required");
		} else {
			Matcher matcher = birthPattern2.matcher(member.getBirthday2());
			if (!matcher.matches()) {
				errors.rejectValue("birthday2", "bad");
			}
		}
		
		// ¿ìÆí¹øÈ£&ÁÖ¼Ò
		if (member.getZipcode() == null || member.getZipcode().trim().isEmpty() && member.getAddress() == null || member.getAddress().trim().isEmpty() ) {
			errors.rejectValue("zipcode", "required");
			errors.rejectValue("address", "required");
		} else {
			Matcher matcher = zipcodePattern.matcher(member.getZipcode());
			if (!matcher.matches()) {
				errors.rejectValue("zipcode", "bad");
			}
		}
		
		//ÀÌ¸ÞÀÏ
		if (member.getM_email() == null || member.getM_email().trim().isEmpty()) {
			errors.rejectValue("m_email", "required");
		} else {
			Matcher matcher = emailPattern.matcher(member.getM_email());
		if (!matcher.matches()) {
			errors.rejectValue("m_email", "bad");
			}
		}
		
	}
}
