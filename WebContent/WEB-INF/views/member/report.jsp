<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color:#f7f7f7;
}
</style>
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
</head>
<body class="login">
	<div>
		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form:form commandName="report" name="form">		
						<h1>Report Form</h1>						
							신고대상자:<strong>${m_name }</strong>
							<div style="margin:10px;">
							<textarea id="report_content" name="report_content" style="height:230px;"class="form-control" placeholder="신고 내용을 적어주세요!"></textarea>
							<input type="hidden" name="m_name" value="${m_name }" >
							<input type="hidden" name="m_no" value="${m_no }">
							<input type="hidden" name="reporter_name" value="${session_m_name }">
							<input type="hidden" name="reporter_no" value="${session_m_no }">
							</div>
							<div >
							<input type="button" class="btn btn-primary" onclick="report()" value="신고하기">
							<input type="button" class="btn btn-success" onclick="cancle()" value="취소">
							</div>
					</form:form>
			</section>
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	function cancle(){
		window.close();
	}
	
	function report(){
		const report_content = document.getElementById("report_content").value;
		if( report_content == ""){
			alert("신고 내용을 입력해주세요")
		} else {
		$.ajax({
			url:'/cktree/insertReport',
			data:$("form").serialize(),
			type:'POST',
			success:function(data){
				if(data=="success"){
					alert("신고가 접수되었습니다.");
					window.close();
				} else if(data=="fail"){
					
				}
			},
			error:function(){}
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
</html>