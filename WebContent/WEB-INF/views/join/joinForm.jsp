<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Chuckle Tree! | </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      <!-- 헤더  -->
       <div class="top_nav">
        	<jsp:include page="/WEB-INF/views/include/header.jsp"/>    
        </div> 
      <!-- 사이드바 -->
        <div class="col-md-3 left_col menu_fixed">
          <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
        </div>
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>회원가입</h3>
                        </div>

                 
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="x_panel">
                                
                                <div class="x_content">
                                    <form:form commandName="member"  method="POST" id="form" name="form">                   
                                      <span class="section">개인정보</span>
                                      
                                      <!-- 이름 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">이름<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input type="text" id="m_name" name="m_name" class="form-control" value="${authen.M_NAME }" readOnly />                                                
                                             </div>                					 
                                        </div>
                                       
                                       <!-- 핸드폰번호 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">핸드폰번호<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input type="text" name="m_phone" id="m_phone" class="form-control" value="${authen.M_PHONE }" readOnly/>                         
                                             </div>                               
                                        </div> 
                                        <!-- 인증 고유번호 히든값 -->	
                                        	<input type="hidden" name="authen_no" id="authen_no" value="${authen.AUTHEN_NO }"/>
                                        	
                                      
                                      <!-- 아이디 -->
                                           <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">아이디<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input type="text" name="m_id" id ="m_id" class="form-control" autocomplete="off" onkeyup="enter()"/>
                                               <span class="error_text"><form:errors style="color:red;" path="m_id"/></span>                                 
                                              </div>
                                              
                                         
                                        </div>
                						                  
                                      <!-- 비밀번호 -->
                                        <div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">비밀번호<span class="required">*</span></label>
											<div class="col-md-6 col-sm-6">
												<input class="form-control" type="password" id="m_password" name="m_password" onkeyup="enter()" />																				
												<span style="color:red;" class="error_text"> </span> 
											</div>
											
												
										</div>
                                        
                                        <!-- 비밀번호 확인 -->
                                    	  <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">비밀번호 확인<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="password"  id="m_password2" name="m_password2" onkeyup="enter()"/> 
                                            	<span style="color:red;" class="error_text"> </span>
                                            </div>
                                         </div> 
                          
                         				<!-- 생년월일 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">생년월일<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input maxlength="6" style=" width:45%; display:inline;" class="form-control" class='date' type="text" id="birthday" name="birthday" autocomplete="off" onkeyup="enter()"> -
												<input maxlength="7" style=" width:45%; display:inline;" class="form-control" class='date' type="password" id="birthday2" name="birthday2" autocomplete="off" onkeyup="enter()" >
                                                <span style="color:red;" class="error_text"></span>
                                             </div>
                                               
                                        </div>
                                       
                                        <!-- 주소 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">주소<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6"> 
                                                <input class="form-control" type="text" class='tel' id="zipcode" name="zipcode" style="width:30%; display:inline;" autocomplete="off" onkeyup="enter()"/>
                                                 <input type="button" onclick="findZipcode()" value="우편번호 찾기" class="btn btn-primary" >
                                                <input class="form-control" type="text" class='tel' id="address" name="address" autocomplete="off" onkeyup="enter()"/>                                    
                                                <span style="color:red;" class="error_text"></span>
                                                </div>
                                            </div>
                                       
                                        
                                        <!-- 이메일  -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">이메일<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input type="text" name="m_email" id="m_email" class="form-control" class='email' autocomplete="off" placeholder="EX) cktree@gmail.com" onkeyup="enter()"/>  	                 
                                                <span class="error_text"></span>               
                                             </div>                               
 											                   
                                        </div>
                                                         
                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div style="padding:10px" class="col-md-6 offset-md-3">
                                                    <button type='button'onclick="script()"class="btn btn-primary">가입하기</button>
                                                    <button type='reset' class="btn btn-success">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                  </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
            <footer>
            
            </footer>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/joinValidator.js "></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/validator/multifield.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/validator/validator.js"></script>
	    
    <!-- Javascript functions	-->
	<script type="text/javascript">
	function enter(){
		if(window.event.keyCode==13){
	    	script();	
	    }
	}
	
 	function script(){
		$.ajax({
		url:'/cktree/joinForm',
		data: $("form").serialize(),
		type:'POST',
		dataType:'JSON',
		success: function (data){
			if(data){
				alert("환영합니다 회원가입이 완료되었습니다.");
				location.href="/cktree/loginForm";
			} else{
				alert("양식에 맞게 작성해주세요.")
			}
	
		}, error: function(){
		
		}
	});	
}  
	
	
	function findZipcode(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		        	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                let extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address').value = fullRoadAddr;
	                error[4].innerHTML="";
		        }
		    }).open();
	}
		 
			
	</script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/nprogress/nprogress.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>

</body>

</html>
