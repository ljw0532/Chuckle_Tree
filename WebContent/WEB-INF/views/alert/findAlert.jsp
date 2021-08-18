<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림창</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	const message = "<c:out value='${message}'/>";
	if(message == "success"){
	alert('등록하신 이메일로 정보가 발송되었습니다. 이메일을 확인해 주세요');
	location.href='<c:out value="loginForm"/>';
	}
	if( message == "id_fail"){
		alert('이름 또는 이메일이 일치하지 않습니다.');
		location.href='<c:out value="findId"/>';
	}
	if( message == "pw_fail"){
		alert('아이디 또는 이메일이 일치하지 않습니다.');
		location.href='<c:out value="findPw"/>';
	}
});
</script>
</head>
<body>
</body>
</html>