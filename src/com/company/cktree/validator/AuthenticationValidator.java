package com.company.cktree.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.company.cktree.member.MemberDTO;

public class AuthenticationValidator implements Validator {
	private static final String PHONEEXP1 = "^\\d+$";
	private static final String PHONEEXP2 = "^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$";
	private static final String NAMEEXP = "^[°¡-ÆR]{2,}|[a-zA-Z]{2,}$";
	
	private Pattern namePattern;
	private Pattern phonePattern1;
	private Pattern phonePattern2;

	public AuthenticationValidator() {
		
		phonePattern1 = Pattern.compile(PHONEEXP1);
		phonePattern2 = Pattern.compile(PHONEEXP2);
		namePattern = Pattern.compile(NAMEEXP);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO member = (MemberDTO) target;
			
		
	
		//ÀÌ¸§
		if (member.getM_name() == null || member.getM_name().trim().isEmpty()) {
			errors.rejectValue("m_name", "required");
		} else {
			Matcher matcher = namePattern.matcher(member.getM_name());
		if (!matcher.matches()) {
			errors.rejectValue("m_name", "bad");
			}
		}
	
		//ÇÚµåÆù¹øÈ£
		if (member.getM_phone() == null || member.getM_phone().trim().isEmpty() ) {
			errors.rejectValue("m_phone", "required");
		} else {
			Matcher matcher1 = phonePattern1.matcher(member.getM_phone());
			Matcher matcher2 = phonePattern2.matcher(member.getM_phone());
			if (!matcher1.matches()) {
				errors.rejectValue("m_phone", "bad");
			} else if (!matcher2.matches()) {
				errors.rejectValue("m_phone", "bad");
			}
		}
		
		
	}
}
