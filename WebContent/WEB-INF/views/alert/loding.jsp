<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
DB에 저장중입니다...
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		const b_no = ${b_no};
		if(b_no != 0){
		setTimeout(function(){
			location.href='/cktree/board/funBoardDetail/'+b_no;},4000)
		} else {
		setTimeout(function(){
			location.href='/cktree/board/funBoardList';},4000)
		}
	});
</script>
</html>