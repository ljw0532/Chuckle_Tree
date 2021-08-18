/**
 * 
 */
const phone = document.querySelector("#m_phone");

const error = document.querySelectorAll(".error_text")	

const phonePattern = /^\d+$/;
const phonePattern2 = /^01([0|1]?)([0-9]{4})([0-9]{4})$/;

	//이름 유효성 검증
 $("#m_name").on("propertychange change keyup paste input",function(){
	 const name= document.querySelector("#m_name");
	 const namePattern = /^[가-힣]{2,}|[a-zA-z]{2,}$/;
		if(name.value===""){
			error[0].innerHTML="필수 정보입니다.";
		return false;
		}else if(!namePattern.test(name.value)){
			error[0].innerHTML="한글 또는 영문만 입력해주세요.(공백 사용 불가)";
			return false;
		} else {
			error[0].innerHTML="";
			return true;
		}
	});
 
 /*핸드폰번호 유효성 검증*/
 $("#m_phone").on("propertychange change keyup paste input",function(){
	 const m_phone = phone.value;
		if(phone.value===""){
			error[1].innerHTML="필수 입력정보입니다.";
			error[1].style.color = "#ff0000";
			return false;
		} else if(!phonePattern.test(phone.value)){
			error[1].innerHTML="숫자만 입력해주세요.";
			error[1].style.color = "#ff0000";
			return false;
		} else if(!phonePattern2.test(phone.value)){
			error[1].innerHTML="핸드폰 형식에 맞게 작성해주세요";
			error[1].style.color = "#ff0000";
			return false;
		} else {
			$.ajax({
				url:'/cktree/checkPhone',
				type:'POST',
				data:{'m_phone':m_phone},
				success:function(data){
					if(data.m_phone != null){
						error[1].innerHTML = "사용중인 번호입니다.";
   						error[1].style.color = "#ff0000";
   						return false;
					} else {
						error[1].innerHTML = "사용가능한 번호입니다.";
   						error[1].style.color = "#08A600";
   						return true;
					}
				},error:function(){
					alert("ajax실패")
				}
			})
		}
	});
	

	