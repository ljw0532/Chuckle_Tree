<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<ul>
	  		<li><a id="myProfile" href="/cktree/member/myProfile/${session_m_no}"><i class="fas fa-user"> My Profile</i></a></li>
  			<li><a id="memberModify" href="/cktree/member/memberModifyForm"><i class="fas fa-user-cog"> 프로필 수정</i></a></li>
			<li><a id="pwChange" href="/cktree/member/myProfile/pwChange"><i class="fas fa-lock"> 비밀번호 변경</i></a></li>	
			<li><a href="javascript:leaveId()"><i class="fas fa-user-times"> 회원탈퇴</i></a></li>
		</ul>
</body>
</html>