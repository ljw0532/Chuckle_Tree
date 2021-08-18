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
<style>
@media screen and (max-width:588px) {


}
</style>
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
                                      <span style="font-size:18px;" class="section">본인확인을 위해 이름과 핸드폰번호를 입력해주세요.</span>
                                     
                                        
                                        <!-- 이름 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">이름<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input type="text" id="m_name" name="m_name" class="form-control" autocomplete="off" onkeyup="enter()"/>                                                
                                            	<span style="color:red;" class="error_text"></span>                                   
                                            </div>
                        					 
                                        </div>
                                               
                                        <!-- 핸드폰 번호 -->
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">핸드폰번호<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" maxlength="11" type="tel" class='tel' id="m_phone" name="m_phone" autocomplete="off" placeholder="(-)하이픈,공백 없이 숫자로 작성해주세요" onkeyup="enter()"/>
                                                <button style="float:right; margin:8px 0px;" type='button'onclick="script()"class="btn btn-primary">인증번호 요청</button> 
                                                <span style="color:red;" class="error_text"></span>
                                            </div>                                          
                                        </div>
                                        
                                        <!-- 인증코드 -->
                                         <div id="authen-box" style="display:none;" class="field item form-group">
                                         	 <label class="col-form-label col-md-3 col-sm-3  label-align">인증번호<span class="required">*</span></label>
                                       		   <div class="col-md-6 col-sm-6">
                                             		<input type="text" name="authen_code" id="authen_code" class="form-control" autocomplete="off" placeholder="발송된 인증코드를 입력해주세요." onkeyup="enter()"/>
                                             		 <button style="float:right; margin:8px 0px;" type='button'onclick="requestAuthentication()"class="btn btn-primary">인증하기</button>
                                             		 <span style="color:red;" id="span_authen_code"></span>
                                             	</div>
                            					
                                          </div>      
                                                     
                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div  class="col-md-6 offset-md-3">
                                                   
                                                  
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
	<script src="${pageContext.request.contextPath}/resources/js/joinAuthenticationValidator.js "></script>
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
 		const authen_box = document.getElementById("authen-box");
 		$.ajax({
 			url:'/cktree/sendMail',
 			data:$("form").serialize(),
 		 	type:'POST',
 		 	success:function(data){
 		 		if(data){
 		 		alert("발송된 문자에서 인증번호를 확인해주세요.")
 		 		authen_box.style.display="";
 		 		} else {

 		 		}
 		 	},
 		 	errror:function(){}
 		});
 	}
			
 	function requestAuthentication(){
 		const authen_code = document.getElementById("authen_code").value;
 		const m_name = document.getElementById("m_name");
 		const m_phone = document.getElementById("m_phone");
 		const span_authen_code = document.getElementById("span_authen_code");
 		if(m_name.value==="" || m_phone.value===""){
 			return false;
 		} else if(authen_code === "") {
 			span_authen_code.innerHTML="인증번호를 입력해주세요.";
 		} else {
 		
 		$.ajax({
 			url:'/cktree/requestAuthentication',
 			data:{'authen_code':authen_code},
 			type:'POST',
 			success:function(data){
 				if(data.authen != null){
 					location.href="/cktree/joinForm/"+data.authen.authen_no;
 				} else{
 					alert("인증번호가 일치하지 않습니다.");
 				}
 			},
 			error:function(){
 				alert("ajax 실패");
 				}
 			});
 		}
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
