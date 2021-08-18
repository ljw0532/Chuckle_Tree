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
.right_col{
	height:1000px;
	
}
#profileImage{
	width:80px;
	height:80px;
	margin:10px;
}

.addButton{
	text-align:center;
	width:100%;
	height:50px;
	color:#5a738e;
	font-weight:bold;
	border:2px solid #cfd8dc;
	background-color:white;
	box-shadow:none;
}
.addButton:hover {
background:#f5f5f5;
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
        <div class="right_col" role="main">
          <div class="">
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                  	<h2>Profile</h2>
                    <ul style="color:black;" class="nav navbar-right panel_toolbox">                 
                      <li>
                           <a id="report" href="javascript:reportForm();"><i class="fas fa-bug"></i>신고하기</a>                   
                      </li>  
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3  profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">

                        	 <c:choose>
        		  				<c:when test="${user.m_image == '-'}">
        		  					<img id="profileImage" src="/cktree/images/profile.png" alt="기본이미지">
           					</c:when>
           					<c:otherwise>
           							<img id="profileImage" src="/cktree/images/${user.m_image }">
           					</c:otherwise>
           		 			</c:choose>
                        </div>
                      </div>
                      <h3>${user.m_name}<small style="font-size:10px;" title="회원고유번호">(${user.m_no })</small></h3>

                      <ul class="list-unstyled user_data">
                     	 <li title="아이디">
                          <strong style="font-size:14px;">ID</strong>&nbsp;${user.m_id}
                        </li>
                        
                        <li title="가입일">
                        <i class="fas fa-calendar-week"></i> <fmt:formatDate value="${user.join_date}" pattern="yy년 MM월 dd일"/>
                        </li>
                        
                        <c:if test="${user.penalty >= 2}">
                        <li title="생년월일">
                      	<i class="fas fa-birthday-cake"></i> ${user.birthday }
                        </li>
                        </c:if>
                        
                         <c:if test="${user.penalty >= 3}">
                        <li title="이메일" class="m-top-xs">
                         <i class="fas fa-envelope-open-text"></i> ${user.m_email}
                        </li>      
                       	</c:if>
                       	
                       	<c:if test="${user.penalty >= 4}">
                        <li title="주소">
                        	<i class="fas fa-map-marker-alt"></i> ${user.address }
                       	 </li>                       
                       </c:if>
                       
                       <c:if test="${user.penalty >= 5}">
                        <li title="핸드폰번호">
                        <i class="fas fa-phone-alt"></i> ${user.m_phone }
                        </li>                     
                       </c:if>
                       
                        
                      </ul>
                    </div>
                    
                    <div class="col-md-9 col-sm-9 ">
			            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class=""><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">${user.m_name }님이 쓴 글</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">${user.m_name }님이 쓴 댓글</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane active " id="tab_content1" aria-labelledby="home-tab">
                       		 <!-- 글 -->
                          </div>                         
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
							<!-- 댓글 -->
                          </div>     
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    <!-- 페이지 내용 끝 -->
	 	  </div>
     </div>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" charset="utf-8"></script>
	<script type="text/javascript">	
	const tab_content1 = document.getElementById('tab_content1')
	const tab_content2 = document.getElementById('tab_content2')
	let endStep = 10;
	let end = 10;
	
	
	$(document).ready(function(){
		userPosts_Page(end);
		userComments_Page(end)
	});
	
	//회원이 쓴 글 더보기 클릭시
	function userPostsAdd(){
		end += endStep;
		userPosts_Page(end);
	}
	
	//회원이 쓴 댓글 더보기 클릭시
	function userCommentsAdd(){
		end += endStep;
		userComments_Page(end);
	}
	
	//회원이 쓴 글 리스트
	function userPosts_Page(index){
		let end = index;
		const m_no = ${user.m_no};
		$.ajax({
			url:'/cktree/user/Posts',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr style="text-align:center;"><td>제목</td><td>날짜</td></tr><thead>';	
				const list = data.userPosts_list;
				if(list.length > 0){			
						 for(let i=0; i<list.length; i++){
							 html += '<tr><td><a href="/cktree/board/funBoardDetail/'+list[i].b_no+'">'+list[i].b_title+'</a></td>'
							 	  + '<td style="text-align:center;">'+moment(list[i].b_date).format('YY년 MM월 DD일')+'</td></tr>';		 	  
						 }					 
						 //리스트가 전부 불러와지면 버튼 안보이게
						 if(list.length < end){
							 html +='</table>';
						 } else {
						html += '</table><input class="addButton" type="button" onClick="myPostsAdd()" value="더보기">';
						 }
				} else { 
					html ='<tr><td>등록된 게시물이 없습니다.</td></tr></table>';
				}
				tab_content1.innerHTML = html;
			},
			error:function(){}
		});
	}
	
	//회원이 쓴 댓글 리스트
	function userComments_Page(index){
		let end = index;
		const m_no = ${user.m_no};
		$.ajax({
			url:'/cktree/user/Comments',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr style="text-align:center;"><td>제목</td><td>날짜</td></tr><thead>';	
				const list = data.userComments_list;
				if(list.length > 0){			
						 for(let i=0; i<list.length; i++){
							 html += '<tr><td><a href="/cktree/board/funBoardDetail/'+list[i].b_no+'">'+list[i].c_content+'</a></td>'
							 	  + '<td style="text-align:center;">'+moment(list[i].c_date).format('YY년 MM월 DD일')+'</td></tr>';		 	  
						 }					 
						 //리스트가 전부 불러와지면 버튼 안보이게
						 if(list.length < end){
							 html +='</table>';
						 } else {
						html += '</table><input class="addButton" type="button" onClick="myPostsAdd()" value="더보기">';
						 }
				} else { 
					html ='<tr><td>등록된 댓글이 없습니다.</td></tr></table>';
				}
				tab_content2.innerHTML = html;
			},
			error:function(){}
		});
	}
	
	
 //신고폼으로 이동
	function reportForm(){
		const session_m_no = <%= session.getAttribute("session_m_no") %>;
		if(session_m_no == null) {
			if(confirm("로그인이 필요한 작업입니다. 로그인 페이지로 이동하시겠습니까?")==true){
				location.href="/cktree/loginForm";	
			} else{
				return false;
			}
		}
		window.open("/cktree/reportForm/"+${user.m_no},"신고하기","width=450, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=no");
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
     <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>