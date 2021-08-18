package com.company.cktree.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.company.cktree.member.MemberDTO;

public class MemberModifyValidator implements Validator {
	private static final String ZIPCODEEXP = "^(\\d{1,7})+$";
	private static final String ADDREXP = "^[a-zA-Z0-9°¡-ÆR]$";
	private static final String PHONEEXP1 = "^\\d+$";
	private static final String PHONEEXP2 = "^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$";
	private static final String EMAILEXP = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";

	private Pattern zipcodePattern;
	private Pattern addrPattern;
	private Pattern phonePattern1;
	private Pattern phonePattern2;
	private Pattern emailPattern;

	public MemberModifyValidator() {
		zipcodePattern = Pattern.compile(ZIPCODEEXP);
		addrPattern = Pattern.compile(ADDREXP);
		phonePattern1 = Pattern.compile(PHONEEXP1);
		phonePattern2 = Pattern.compile(PHONEEXP2);
		emailPattern = Pattern.compile(EMAILEXP);
		
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO member = (MemberDTO) target;
		
		
		//ÀÌ¸ÞÀÏ
		if (member.getM_email() == null || member.getM_email().trim().isEmpty()) {
			errors.rejectValue("m_email", "required");
		} else {
			Matcher matcher = emailPattern.matcher(member.getM_email());
		if (!matcher.matches()) {
			errors.rejectValue("m_email", "bad");
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
