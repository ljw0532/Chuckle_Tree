/**
 * 
 */
	

	const email = document.querySelector("#m_email");
	const zipcode = document.querySelector("#zipcode");
	const phone = document.querySelector("#m_phone");
	const error = document.querySelectorAll(".error_text")
	const addr2 = document.querySelector("#addr2");
		
	const zipcodePattern = /^(\d{1,7})+$/;
	const addrPattern = /^[a-zA-Z0-9가-힣]$/;
	const phonePattern = /^\d+$/;
	const phonePattern2 = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
	const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
	/*핸드폰번호 유효성 검증*/
   $("#m_phone").on("propertychange change keyup paste input",function(){
		if(phone.value===""){
			error[0].innerHTML="필수 입력정보입니다.";
			return false;
		} else if(!phonePattern.test(phone.value)){
			error[0].innerHTML="숫자만 입력해주세요.";
			return false;
		} else if(!phonePattern2.test(phone.value)){
			error[0].innerHTML="핸드폰 형식에 맞게 작성해주세요";
			return false;
		}
		
		else {
			error[0].innerHTML="";
			return true;
		}
	});
   
	/*이메일 유효성 검증*/
 $("#m_email").on("propertychange change keyup paste input",function(){
	 const m_email = email.value;
		if(email.value===""){
			error[1].innerHTML="필수 정보입니다.";
			error[1].style.color = "#ff0000";
			return false;
		}else if(!emailPattern.test(email.value)){
			error[1].innerHTML="이메일 형식이 올바르지 않습니다.";
			error[1].style.color = "#ff0000";
			return false;
		} else {
			$.ajax({
				url:'/cktree/checkEmail',
				data: {'m_email': m_email},
				type:'POST',
				dataType:'json',
				success:function(data){			
					if(data == 1){
						error[1].innerHTML = "사용중인 이메일입니다.";
						error[1].style.color = "#ff0000";
						return false;
					} 
					if(data == 0){
						error[1].innerHTML = "사용가능한 이메일입니다.";
						error[1].style.color = "#08A600";
						return true;
					}
				}, error: function(){
					console.log("실패");
				}
			});
		}
	});
	

	/*우편번호 주소 유효성 검증*/
    $("#zipcode").on("propertychange change keyup paste input",function(){
		if(zipcode.value===""){
			error[2].innerHTML="필수 입력정보입니다.";
			return false;
		} else if(!zipcodePattern.test(zipcode.value)){
			error[2].innerHTML="숫자만 입력가능합니다.";
			return false;
		} else {
			error[2].innerHTML="";
			return true;
		}
	});
	
	$("#addr2").focus(function(){
		error[2].innerHTML="";
	});