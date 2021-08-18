/**
 * 
 */
	const id= document.querySelector("#m_id");
	const pw1 = document.querySelector("#m_password");
	const pw2 = document.querySelector("#m_password2");
	const birth1 = document.querySelector("#birthday");
	const birth2 = document.querySelector("#birthday2");
	const zipcode = document.querySelector("#zipcode");
	const email = document.querySelector("#m_email");
	const error = document.querySelectorAll(".error_text");
	

	const idPattern =/^[a-z0-9]{5,20}$/;
	const pwPattern =/^(?=.*[a-zA-Z])(?=.*[!@#$%^&*\(\)\.\,_+=-])(?=.*[0-9]).{8,16}$/;	
	const birth1Pattern = /^(\d{6,})+$/;
	const birth2Pattern = /^(\d{7,})+$/;
	const zipcodePattern = /^(\d{1,7})+$/;
	const addrPattern = /^[a-zA-Z0-9가-힣]$/;
	
	const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	/*아이디 유효성 검증*/
	
	 $("#m_id").on("propertychange change keyup paste input",function(){
		 const m_id = id.value;
		if(id.value === ""){
			error[0].innerHTML = "필수 정보입니다.";
			error[0].style.color = "#ff0000";
			return false;
		} else if(!idPattern.test(id.value)){
			error[0].innerHTML="5~20자의 영문 소문자,숫자만 사용 가능합니다.";
			error[0].style.color = "#ff0000";
			return false;
		} else {
			$.ajax({
					url:'/cktree/checkId',
					data: {'m_id': m_id},
					type:'POST',
					dataType:'json',
					success:function(data){
						 if(data == 1){
							error[0].innerHTML = "사용중인 아이디입니다.";
							error[0].style.color = "#ff0000";
							return false;
						} else {
							error[0].innerHTML = "사용 가능한 아이디입니다.";
							error[0].style.color = "#08A600";			
							return true;
						}
					}, error: function(){
						console.log("실패");
					}
				});
		}
	});
	
	/*비밀번호 유효성 검증*/
	$("#m_password").on("propertychange change keyup paste input",function(){
		if(pw1.value === ""){
			error[1].innerHTML="필수 정보입니다.";
			return false;
		} else if(!pwPattern.test(pw1.value)){
			error[1].innerHTML="8~16자의 영문 소문자,숫자,특수문자를 조합해서 작성해주세요.";
			return false;
		}else {
			error[1].innerHTML="";
			return true;
		} 
	});
	
	/*비밀번호 확인 유효성 검증*/
 $("#m_password2").on("propertychange change keyup paste input",function(){
		if(pw2.value === ""){
			error[2].innerHTML="필수 정보입니다.";
			return false;
		} else if(pw2.value !== pw1.value){
			error[2].innerHTML="비밀번호가 일치하지 않습니다.";
			return false;
		} else {
			error[2].innerHTML="";
			return true;
		} 
	});
	

	/*생년월일 유효성 검증*/
 $("#birthday").on("propertychange change keyup paste input",function(){
		if(birth1.value===""){
			error[3].innerHTML="필수 입력정보입니다.";
			error[3].style.display="block";
			return false;
		} else if(!birth1Pattern.test(birth1.value)){
			error[3].innerHTML="6자리의 숫자만 입력해주세요."
			error[3].style.display="block";
			return false;
		} else{
			error[3].innerHTML="";
			return true;
		}
	});
	$("#birthday2").on("propertychange change keyup paste input",function(){
		if(birth2.value===""){
			error[3].innerHTML="필수 입력정보입니다.";
			error[3].style.display="block";
			return false;
		} else if(!birth2Pattern.test(birth2.value)){
			error[3].innerHTML="7자리의 숫자만 입력해주세요."
			error[3].style.display="block";
			return false;
		} else {
			error[3].innerHTML="";
			return true;
		}
	});
	
	/*우편번호 주소 유효성 검증*/
    $("#zipcode").on("propertychange change keyup paste input",function(){
		if(zipcode.value===""){
			error[4].innerHTML="필수 입력정보입니다.";
			return false;
		} else if(!zipcodePattern.test(zipcode.value)){
			error[4].innerHTML="숫자만 입력가능합니다.";
			return false;
		} else {
			error[4].innerHTML="";
			return true;
		}
	});
    
    $("#zipcode").change(function(){
    	error[4].innerHTML="";
		return true;
    });
	
	//이메일 유효성 검증
    $("#m_email").on("propertychange change keyup paste input",function(){
   	 const m_email = email.value;
   		if(email.value===""){
   			error[5].innerHTML="필수 정보입니다.";
   			error[5].style.color = "#ff0000";
   			return false;
   		}else if(!emailPattern.test(email.value)){
   			error[5].innerHTML="이메일 형식이 올바르지 않습니다.";
   			error[5].style.color = "#ff0000";
   			return false;
   		} else {
   			$.ajax({
   				url:'/cktree/checkEmail',
   				data: {'m_email': m_email},
   				type:'POST',
   				dataType:'json',
   				success:function(data){			
   					if(data == 1){
   						error[5].innerHTML = "사용중인 이메일입니다.";
   						error[5].style.color = "#ff0000";
   						return false;
   					} 
   					if(data == 0){
   						error[5].innerHTML = "사용가능한 이메일입니다.";
   						error[5].style.color = "#08A600";
   						return true;
   					}
   				}, error: function(){
   					console.log("실패");
   				}
   			});
   		}
   	});
