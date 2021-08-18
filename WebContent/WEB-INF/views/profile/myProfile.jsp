<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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

@media screen and (max-width:689px){
#myTab {
list-style:none; padding:0; margin:0px; height:90px;
}
#myTab li{
 float:left; padding:0; margin:1px 1px; height:35px;
}
.writer{
width:64px;
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
                  	<h2>My Profile</h2>
                    <ul class="nav navbar-right panel_toolbox">                 
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="/cktree/member/memberModifyForm">회원정보 수정</a>
                            <a class="dropdown-item" href="/cktree/member/myProfile/pwChange">비밀번호 수정</a>
                            <a class="dropdown-item" href="/cktree/member/myProfile/leaveId">회원탈퇴</a>
                          </div>
                      </li>  
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3  profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">

                        	 <c:choose>
        		  				<c:when test="${member.m_image == '-'}">
        		  					<img id="profileImage" src="/cktree/images/profile.png" alt="기본이미지">
           					</c:when>
           					<c:otherwise>
           							<img id="profileImage" src="/cktree/images/${member.m_image }">
           					</c:otherwise>
           		 			</c:choose>
                        </div>
                      </div>
                      <h3>${member.m_name}</h3>

                      <ul class="list-unstyled user_data">
                     	 <li title="아이디">
                          <strong style="font-size:14px;">ID</strong>&nbsp;${member.m_id}
                        </li>
                   	  	
                   	  	<li title="생년월일">
                      	<i class="fas fa-birthday-cake"></i> ${member.birthday }
                        </li>
                       
                        <li title="주소">
                        	<i class="fas fa-map-marker-alt"></i> ${member.address }
                       	 </li>
                        
                       
                        <li title="이메일" class="m-top-xs">
                         <i class="fas fa-envelope-open-text"></i> ${member.m_email}
                        </li>                   
                       
                        <li title="핸드폰번호">
                        <i class="fas fa-phone-alt"></i> ${member.m_phone }
                        </li>                     
                       
                        <li title="가입일">
                        <i class="fas fa-calendar-week"></i> <fmt:formatDate value="${member.join_date}" pattern="yy년 MM월 dd일"/>
                        </li>
                      </ul>
                    </div>
                    
                    <div class="col-md-9 col-sm-9 ">
			            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class=""><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">내가 쓴 글</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">내가 쓴 댓글</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">좋아요 목록</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">알림</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane active " id="tab_content1" aria-labelledby="home-tab">
                       		 <!-- 내가 쓴 글 -->
                          </div>                         
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
							<!-- 내가 쓴 댓글 -->
                          </div>     
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                            <!-- 내가 누른 좋아요 -->
                          </div>
                           <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                             <!-- 알림 -->
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
	<script src="${pageContext.request.contextPath}/resources/js/alertify.min.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/js/leave.js" charset="utf-8"></script> 
	<script type="text/javascript">
	//내가 쓴 글 페이지 리스트
	const tab_content1 = document.getElementById('tab_content1')
	const tab_content2 = document.getElementById('tab_content2')
	const tab_content3 = document.getElementById('tab_content3')
	const tab_content4 = document.getElementById('tab_content4')
	const m_no = ${member.m_no};
	let endStep = 10;
	let end = 10;
	
	//자동으로 리스트 출력
	$(document).ready(function(){
		myPosts_Page(end);
		myComments_Page(end);
		myLikeit_Page(end);
		notify_Page(end);
	});
	
	//내가 쓴 글 더보기 클릭시
	function myPostsAdd(){
		end += endStep;
		myPosts_Page(end);
	}
	
	//내가 쓴 댓글 더보기 클릭시
	function myCommentsAdd(){
		end += endStep;
		myComments_Page(end);
	}
	
	//내가 누른 좋아요 더보기 클릭시
	function myLikeitAdd(){
		end += endStep;
		myLikeit_Page(end);
	}
	
	//알림 더보기 클릭시
	function notifyAdd(){
		end += endStep;
		notify_Page(end);
	}
	
	//내가 쓴 글 리스트
	function myPosts_Page(index){
		let end = index;
		$.ajax({
			url:'/cktree/member/myProfile/myPosts',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr style="text-align:center;"><td>제목</td><td>날짜</td></tr><thead>';	
				const list = data.myPosts_list;
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
	
	//내가 쓴 댓글 리스트
	function myComments_Page(index){
		let end = index;
		$.ajax({
			url:'/cktree/member/myProfile/myComments',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr style="text-align:center;"><td>댓글</td><td>날짜</td></tr><thead>';	
				const list = data.myComments_list;
				if(list.length > 0){			
						 for(let i=0; i<list.length; i++){
							 html += '<tr><td><a href="/cktree/board/funBoardDetail/'+list[i].b_no+'">'+list[i].c_content+'</a></td>'
							 	  + '<td style="text-align:center;">'+moment(list[i].c_date).format('YY년 MM월 DD일')+'</td></tr>';		 	  
						 }					 
						 //리스트가 전부 불러와지면 버튼 안보이게
						 if(list.length < end){
							 html +='</table>';
						 } else {
						html += '</table><input class="addButton" type="button" onClick="myCommentsAdd()" value="더보기">';
						 }
				} else { 
					html ='<tr><td>등록된 댓글이 없습니다.</td></tr></table>';
				}
				tab_content2.innerHTML = html;
			},
			error:function(){}
		});
	}
	
	//내가 누른 좋아요 리스트
	function myLikeit_Page(index){
		let end = index;
		$.ajax({
			url:'/cktree/member/myProfile/myLikeit',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr><td>제목</td><td class="writer">작성자</td></tr><thead>';	
				const list = data.myLikeit_list;
				if(list.length > 0){			
						 for(let i=0; i<list.length; i++){
							 html += '<tr><td><a href="/cktree/board/funBoardDetail/'+list[i].b_no+'">'+list[i].b_title+'</a></td>'
							 	  + '<td class="writer"><a href="/cktree/user/Profile/'+list[i].m_no+'">'+list[i].b_writer+'</a></td></tr>';		 	  
						 }					 
						 //리스트가 전부 불러와지면 버튼 안보이게
						 if(list.length < end){
							 html +='</table>';
						 } else {
						html += '</table><input class="addButton" type="button" onClick="myLikeitAdd()" value="더보기">';
						 }
				} else { 
					html ='<tr><td>좋아요를 누른 글이 없습니다.</td></tr></table>';
				}
				tab_content3.innerHTML = html;
			},
			error:function(){}
		});
	}
	
	//알림리스트
	function notify_Page(index){
		let end = index;
		$.ajax({
			url:'/cktree/notifyList',
			data:{'m_no':m_no,'end':end},
			type:'POST',
			success:function(data){
				let html = '<table class="table"><thead><tr><td>내용</td><td class="writer">날짜</td></tr><thead>';	
				const list = data.notify_list;
				if(list.length > 0){			
						 for(let i=0; i<list.length; i++){
							const gen_m_no = list[i].gen_m_no;
							const gen_m_name = list[i].gen_m_name;
							const n_content = list[i].n_content;
							const n_no = list[i].n_no;
							const n_index = list[i].n_index;
							const regdate = list[i].regdate;
							 
							html += '<tr>';					
							 if(n_index==0){
						     html +='<td><a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
							   +'<a href="/cktree/readNotify?n_no='+n_no+'">'+n_content+'</a>게시물에 좋아요를 눌렀습니다.'
			           		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+','+end+')" style="cursor:pointer;"></i></td>'
			           		   + '<td>'+moment(regdate).format('YY년 MM월 DD일')+'</td>'	 
							 }
							 if(n_index==1){
							  html +='<td><a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
							   +'<a href="/cktree/readNotify?n_no='+n_no+'">'+n_content+'</a>게시물에 댓글을 남겼습니다.'
			           		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+','+end+')" style="cursor:pointer;"></i></td>'
			           		 + '<td>'+moment(regdate).format('YY년 MM월 DD일')+'</td>'	
								 
							 }
							 if(n_index==2){
							  html +='<td><a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
							   +'<a href="/cktree/readNotify?n_no='+n_no+'">댓글</a>에 답글을 남겼습니다.'
			           		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+','+end+')" style="cursor:pointer;"></i></td>'
			           		   + '<td>'+moment(regdate).format('YY년 MM월 DD일')+'</td>'
							 }					 
							 html +='</tr>';
						 }		
				
						 //리스트가 전부 불러와지면 버튼 안보이게
						 if(list.length < end){
							 html +='</table>';
						 } else {
						html += '</table><input class="addButton" type="button" onClick="notifyAdd()" value="더보기">';
						 }
				} else { 
					html ='<tr><td>등록된 알림이 없습니다.</td></tr></table>';
				}
				tab_content4.innerHTML = html;
			},
			error:function(){}
		});
	}
	
	function deleteNotify(notify,index){
		 const n_no = notify;
		$.ajax({
			url:'/cktree/deleteNotify',
			data:{'n_no':n_no},
			type:'POST',
			success:function(){
				notify_Page(index)
			},error:function(){}
		}); 	
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
     <!-- morris.js -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>