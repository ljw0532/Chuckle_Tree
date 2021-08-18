<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Chuckle Tree! |</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">
<!-- iCheck -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
<!-- Select2 -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
<!-- Switchery -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
<!-- starrr -->
<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/starrr/dist/starrr.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/loginForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	//아이디 비밀번호 공백 체크
	function idpwCheck() {
		var form = document.loginForm;
		if (form.m_id.value == "") {
			alert("아이디를 입력해주세요.");
			form.m_id.focus();
			return false;
		}
		if (form.m_password.value == "") {
			alert("비밀번호를 입력해주세요.");
			form.m_password.focus();
			return false;
		}
		form.submit();		
	}
	//엔터키로 Send
	function enter() {
		if (window.event.keyCode == 13) {
			idpwCheck();
		}
	}
	
	//ID저장
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    let key = getCookie("key");
	    $("#m_id").val(key); 
	     
	    if($("input[name='m_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSave").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
	        	 key = $("input[name='m_id']").val();
	            setCookie("key", key, 7); // 7일 동안 쿠키 보관
	           
	        }else { // ID 저장하기 체크 해제 시,
	        	 deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='m_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	        	 key = $("input[name='m_id']").val();
	            setCookie("key", key, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
}
	
</script>
</head>
<body class="login">
	<div>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form commandName="member" method="post" name="loginForm">
						<h1>Login Form</h1>
						<div>
							<input type="text" class="form-control" placeholder="ID" name='m_id' id="m_id" onkeyup="enter()" />
						</div>
						<div>
							<input type="password" class="form-control" placeholder="PASSWORD" name="m_password" id="m_password" onkeyup="enter()" />
						</div>
						<div>
							<button type="button" onClick="idpwCheck()" id="loginSubmit" class="btn btn-success">로그인</button>

						</div>
						<div class="form-group row">
						<div class="check1">
							<label><input type="checkbox" id="autoLogin" name="autoLogin" class="flat"> 자동 로그인 </label>
						</div>
						<div class="check2">	
							<label><input type="checkbox" id="idSave" name="idSave" class="flat"> 아이디 저장 </label>
						</div>
						</div>
						
						
					<div class="separator">
						<div class="find">
							<a href="<c:out value="findId"/>">아이디 찾기</a>|<a href="<c:out value="findPw"/>" style="padding:0px 0px 0px 12px">비밀번호 찾기</a>
						</div>
							<div class="join">
							 첫 방문이신가요? <a href="<c:url value="join"/>"> 회원가입 </a>
							</div>
							<div class="clearfix"></div>
							<br />
							<div style="padding:20px">
								<a href="<c:url value="/" />">
									<h1>Chuckle Tree!</h1>
								</a>
								<p>©2021 All Rights Reserved.</p>			
							</div>
						</div>
					</form:form>
				</section>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/nprogress/nprogress.js"></script>
	<!-- bootstrap-progressbar -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
</body>
</html>
