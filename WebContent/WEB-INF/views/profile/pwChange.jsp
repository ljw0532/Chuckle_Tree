<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="Path" value="<%= request.getContextPath()%>"></c:set> 
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
    <!-- iCheck -->
   <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	<!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
	

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<style>
.myProfile_area {
	position: relative;
	width: 100%;
	height:850px;
	margin-bottom: 10px;
	padding: 10px 17px;
	display: inline-block;
	background: #fff;
	border: 1px solid #E6E9ED;
}
.myProfile_menu{
	border-bottom: 2px solid #E6E9ED;
	padding: 1px 5px 6px;
	margin-bottom: 10px;
			
}
.myProfile_menu ul{
	position:relative;
	left:-40px;
	list-style:none;
}
.myProfile_menu li{
	float:left;
	padding-right:10px;
}
.myProfile_content {
	width:100%;
}
.main_container{
	min-height:1000px;
}
.right_col{
	height:1000px;	
}
#pwChange{
color:#1976d2;
}

@media screen and (max-width:488px){
.myProfile_menu{
height:50px;
}
}
</style>

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

        <!-- 페이지 내용 -->
     <div class="right_col">
       
        <div class="clearfix"></div>
        	<div class="myProfile_area">
        		<div class="myProfile_title">
        			<h2>Password Change</h2>       	
        			<div class="myProfile_menu">
        		  		<jsp:include page="/WEB-INF/views/profile/myProfile_menu.jsp"/>  		  		
        			</div>
        		</div>  	
        			
        	<div class="myProfile_content">
				<div class="field item form-group">
					<label class="col-form-label col-md-3 col-sm-3  label-align">기존 비밀번호<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6">
						<input class="form-control" type="password" id="org_pw" name="org_pw" onkeyup="enter()" />																				
						<span style="color:red;" class="error_text"> </span> 
						</div>
				</div>
			      	
        	
        		  <!-- 비밀번호 -->
          		<div class="field item form-group">
					<label class="col-form-label col-md-3 col-sm-3  label-align">새 비밀번호<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6">
						<input class="form-control" type="password" id="m_password" name="m_password" onkeyup="enter()" />																				
						<span style="color:red;" class="error_text"> </span> 
						</div>
				</div>
                                
                   <!-- 비밀번호 확인 -->
               	  <div class="field item form-group">
                      <label class="col-form-label col-md-3 col-sm-3  label-align">새 비밀번호 확인<span class="required">*</span></label>
                       		<div class="col-md-6 col-sm-6">
                            <input class="form-control" type="password"  id="m_password2" name="m_password2" onkeyup="enter()"/> 
                       		<span style="color:red;" class="error_text"> </span>
                      		</div>
                  </div> 
        	
        			<div class="ln_solid">
                       <div class="form-group">
                           <div style="padding:10px" class="col-md-6 offset-md-3">
                               <button type='button'onclick="pwChange()"class="btn btn-primary">변경하기</button>
                           </div>
                       </div>
                    </div>
        	</div>
        </div>
        
        
        
        
        
        
        
			</div>
	 	  </div>
     </div>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/js/alertify.min.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/js/leave.js" charset="utf-8"></script> 
	<script type="text/javascript">
	const pw1 = document.querySelector("#m_password");
	const pw2 = document.querySelector("#m_password2");
	const orgpw = document.querySelector("#org_pw");
	const error = document.querySelectorAll(".error_text")
	const pwPattern =/^(?=.*[a-zA-Z])(?=.*[!@#$%^&*\(\)\.\,_+=-])(?=.*[0-9]).{8,16}$/;
	const m_no = '<%= session.getAttribute("session_m_no")%>';
	
	
	/*기존 비밀번호 유효성 검증*/
	$("#org_pw").on("propertychange change keyup paste input",function(){
		const m_password = orgpw.value;
		if(org_pw.value === ""){
			error[0].innerHTML="필수 정보입니다.";
			return false; 
		} else {		
			$.ajax({
				url:'/cktree/member/myProfile/checkMyPw',			
				data:{'m_no':m_no,'m_password': m_password},
				type:'POST',
				dataType:'json',
				success:function(data){
					if(data){
					 error[0].innerHTML="";
					} else{
						error[0].innerHTML="비밀번호가 맞지 않습니다.";				
					}
				}, error: function(request,status,error){
			}
			})
		}
	});
	
	
	/*새 비밀번호 유효성 검증*/
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
	
	/*새 비밀번호 확인 유효성 검증*/
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
	
	function pwChange(){
		const orgpwVal = document.getElementById("org_pw").value;
		const m_password = document.getElementById("m_password").value;
				
		if(org_pw.value === "" || pw1.value === "" || pw2.value === ""){
			alert("빈 칸이 존재합니다.")
			return false; 
		} else if(!pwPattern.test(pw1.value)){
			alert("양식에 맞지 않습니다.")
			return false;
		} else if(pw2.value !== pw1.value){
			alert("새 비밀번호 확인이 다릅니다.")
			return false;
		}
		$.ajax({
			url:'/cktree/member/myProfile/pwChange',
			data:{'m_no':m_no,'org_pw':orgpwVal,'m_password':m_password},
			type:'POST',
			success:function(data){
				if(data.result == 2){
					alert("기존 비밀번호가 일치하지 않습니다.")
				} else if(data.result == 0){
					alert("비밀번호가 변경되었습니다 다시 로그인해주세요.");
					location.href="/cktree/loginForm";
				} else {
					alert("기존의 사용중인 비밀번호입니다 다른 비밀번호로 변경해주세요.");
				}
			},error:function(){
				
			}
		});
	}
	
 	//엔터키로 Send
	function enter() {
	 if (window.event.keyCode == 13) {
		pwChange();
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
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	  <!-- PNotify -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.buttons.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pnotify/dist/pnotify.nonblock.js"></script>
	
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>