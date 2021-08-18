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
	height:580px;
	margin-bottom: 10px;
	padding: 10px 17px;
	display: inline-block;
	background: #fff;
	border: 1px solid #E6E9ED;
}

.myProfile_title {
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
	min-height:400px;
}
.right_col{
	height:1000px;
	
}
#profileImage{
	width:80px;
	height:80px;
	margin:10px;
}
table{
width:100%;
height:450px;
}
thead{
color:black;
height:40px;
padding:10px 0;
font-weight:bold;
border-bottom:3px solid #E6E9ED;

}
tr{
border-collapse:collapse;
	border-bottom:1px solid #E6E9ED;
}
td{

} 

.fileBox{
	height:40px;
	position:relative;
	left:10px;
display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5cb85c;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.fileBox label:hover {
  background-color: #6ed36e;
}

.fileBox label:active {
  background-color: #367c36;
}

.fileBox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
#preview{
	position:relative;
	left:100px;
}

#memberModify{
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
        			<h2>Modify Form</h2>       	
        			<div class="myProfile_menu">
        		  		<jsp:include page="/WEB-INF/views/profile/myProfile_menu.jsp"/>
        			</div>
        		</div>  	
        			
        	<div class="myProfile_content">
				<form:form commandName="member" method="POST" name="form" id="form" enctype="multipart/form-data">
		           <input type="hidden" id="m_no" name="m_no" value=${member.m_no }>
                 			<!-- 핸드폰 번호 -->
					<div class="field item form-group">
						<label class="col-form-label col-md-3 col-sm-3  label-align">핸드폰번호<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6">
							<input class="form-control" maxlength="11" type="tel"
								class='tel' id="m_phone" name="m_phone" autocomplete="off"
								placeholder="(-)하이픈,공백 없이 숫자로 작성해주세요" onkeyup="enter()" onclick="readOnlyCancle(this)" onblur="focusReadOnly(this)" value="${member.m_phone }" readOnly/> 
								<span style="color: red;" class="error_text"></span>
						</div>
					</div>
                 
					<!-- 이메일 -->
					<div class="field item form-group">
						<label class="col-form-label col-md-3 col-sm-3  label-align">이메일<span
							class="required">*</span></label>
						<div class="col-md-6 col-sm-6">
							<input type="text" name="m_email" id="m_email"
								class="form-control" class='email' autocomplete="off"
								placeholder="EX) cktree@gmail.com" onkeyup="enter()" value="${member.m_email }" 
								onclick="readOnlyCancle(this)" onblur="focusReadOnly(this)" readOnly/> <span class="error_text"></span>
						</div>

					</div>

					<!-- 주소 -->
					<div class="field item form-group">
						<label class="col-form-label col-md-3 col-sm-3  label-align">주소<span
							class="required">*</span></label>
						<div class="col-md-6 col-sm-6" style="text-align:left;">
							<input class="form-control" type="text" class='tel' id="zipcode" name="zipcode"
								style="width:200px; display: inline;" autocomplete="off" onkeyup="enter()" value="${member.zipcode }" 
								onclick="readOnlyCancle(this)" onblur="focusReadOnly(this)" readOnly/> 
			
							<input type="button" onclick="findZipcode()" value="우편번호 찾기" onblur="focusReadOnly(zcode)" class="btn btn-primary"> 
			
							<input class="form-control" type="text" class='tel' id="address" name="address"
								autocomplete="off" onkeyup="enter()" value="${member.address }" 
								onclick="readOnlyCancle(this)" onblur="focusReadOnly(this)" readOnly/> 
								<span style="color: red;" class="error_text"></span>
						</div>
					</div>
							
					<div class="field item form-group">
						<label class="col-form-label col-md-3 col-sm-3  label-align">프로필 사진</label>
							<div class="fileBox">
	                  			<label for="file">프로필 사진 변경</label> 
	                  				<input type="file" id="file" name="file">
                  			 </div>           
                  			 <div id="preview"></div>            
                  </div>
                  
                  <div class="ln_solid">
                     <div class="form-group">
                         <div style="padding:10px" class="col-md-6 offset-md-3">
                             <button type="button" class="btn btn-primary" onclick="form_submit()">수정하기</button>
                         </div>
                     </div>
                 </div>
					
				</form:form>
		
			
			</div>
 	 </div>
    </div>
    </div>
    </div>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" charset="utf-8"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/alertify.min.js" charset="utf-8"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/leave.js" charset="utf-8"></script> 
	 <script src="${pageContext.request.contextPath}/resources/js/memberModify.js" charset="utf-8"></script> 
	<script type="text/javascript">
	$(document).ready(function(){
		$("#file").on("change",filePreview);
	})
	
	function filePreview(e){
		const file = e.target.files;
		const reader = new FileReader();
		reader.onload = function(e){
			const img = document.createElement("img");
			img.setAttribute("src",e.target.result);
			img.width=100;
			img.height=100;
			document.querySelector("#preview").appendChild(img);
		}
		reader.readAsDataURL(e.target.files[0]);
	}
	
	
	const zcode=document.getElementById("zipcode");	
	
		//포커스 이동시 다시 readOnly
		function focusReadOnly(param){
		param.readOnly=true;
		}
		//input 클릭시 readOnly해제
		function readOnlyCancle(param){
		param.readOnly=false;
		}
	
		//엔터키로 Send
		function enter() {
			if (window.event.keyCode == 13) {
				form_submit();
			}
		}

		function form_submit() {
			const m_no = ${member.m_no };
			const form = $('#form')[0]
			const data = new FormData(form);
			$.ajax({
				url : '/cktree/member/memberModify',
				enctype : 'multipart/form-data',
				data : data,
				type : 'POST',
				dataType : 'JSON',
				processData : false,
				contentType : false,
				success : function(data) {
					if (data == true) {
						alert("수정이 완료되었습니다.");
						location.href = "/cktree/member/myProfile/" + m_no;
					} else {
						alert("양식에 맞게 작성해주세요.");
					}
				},
				error : function() {
					alert("수정 실패");
				}
			});
		}

		function findZipcode() {
			zcode.readOnly=false;
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					let extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					zcode.value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('address').value = fullRoadAddr;
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