<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="utf-8">
<style>
 .profileImage{
    width: 30px;
    height: 30px; 
    border-radius: 70%;
    overflow: hidden;
  }
.profile{
    width: 100%;
    height: 100%;
    object-fit: cover;
   float:left;
}
.navbar-right li{
padding:3px;
}  
#notify-li{
top:5px;
}

@media screen and (max-width:479px) {
#notify-li{
position:relative;
top:5px;
}

}

</style>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
     <!-- top navigation -->
            <div class="nav_menu">
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>    
                 <c:choose>  
      			<c:when test="${session_m_no != null}">
	            <nav class="nav navbar-nav">
	               
                <ul class=" navbar-right">
                  <li class="nav-item dropdown open" style="padding-top:10px;">
				
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
		        	 ${session_m_name }         		
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                     <c:choose>
                     	<c:when test="${session_m_id == 'admin' }" >
                     		<a class="dropdown-item" href="/cktree/admin/selectReportList"> 회원관리</a>	
                     	</c:when>
                     	<c:otherwise>
                      <a class="dropdown-item"  href="/cktree/member/myProfile/${session_m_no}"> Profile</a>          
             	 	  	</c:otherwise>
             	 	  </c:choose>
             	 	  <a class="dropdown-item"  href="<c:url value="/logout"/>"><i class="fa fa-sign-out pull-right"></i>로그아웃</a>
                    </div>
                  </li>
  					<li>
  					 <c:choose>
                    	<c:when test="${session_m_image != '-'}">
                    		<div class="profileImage">                
                  				<img class="profile" src="/cktree/images/${session_m_image}" alt="프로필 사진">
                  			</div>	
                  		</c:when>
                  		<c:otherwise>
                  			 <div class="profileImage">                  
                  				<img class="profile" src="/cktree/images/profile.png" alt="프로필 사진">
                  			</div>	
                  		</c:otherwise>
                    </c:choose>       
  					</li>
                  <li id="notify-li" role="presentation" class="nav-item dropdown open">
                     
                   <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
            			<!-- 알림 갯수 들어올 공간 -->
                    </a>
                  <ul id="notify-ul" class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">            
                       <!-- 알림 리스트 들어올 공간 -->
                    </ul>  
                  </li>
                </ul>
              </nav>
            </c:when>
            <c:otherwise> 
               <nav class="nav navbar-nav">
               <ul class=" navbar-right">
               		<li>
               	<a href="<c:url value="/loginForm"/>">로그인</a>
               		</li>
               	</ul>
                </nav>
         </c:otherwise>	
		</c:choose>
            </div>
            
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>              
<%-- <script src="${pageContext.request.contextPath}/resources/js/socket.js"></script> --%> 
<script type="text/javascript">
$(document).ready(function(){
	notifyList()
});

function deleteNotify(notify){
	 const n_no = notify;
	$.ajax({
		url:'/cktree/deleteNotify',
		data:{'n_no':n_no},
		type:'POST',
		success:function(){
			notifyList()
		},error:function(){}
	}); 	
}

function notifyList(){
	const header_m_no = '<%= session.getAttribute("session_m_no")%>';
	const end = 6;
$.ajax({
	url:'/cktree/notifyList',
	data:{'m_no':header_m_no,'end':end},
	type:'POST',
	success:function(data){
		let html = "";
		const n_list = data.notify_list;
		const n_count = data.notify_count;
		
		//알림 리스트
		if(n_list.length > 0) {
			$.each(n_list, function(i,item){
				const n_no = item.n_no;
				const n_index = item.n_index;
				const gen_m_no = item.gen_m_no;
				const gen_m_name = item.gen_m_name;
				const n_content = item.n_content;
				const m_no = item.m_no;
				const b_no = item.b_no;
				
		//알림은 6개까지만 표시	
			if(i <= 5){
				
			 if(n_index == 0){
		    	html +='<li  class="nav-item" ><span class="message">'
				   +' <a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
				   +'<a href="/cktree/readNotify?n_no='+n_no+'">'+n_content+'</a>게시물에 좋아요를 눌렀습니다.'
           		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+')" style="cursor:pointer;"></i>'
			       +'</span></li>' }
			if(n_index == 1){
				html +='<li class="nav-item" ><span class="message">'
					   +' <a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
					   +'<a href="/cktree/readNotify?n_no='+n_no+'">'+n_content+'</a>게시물에 댓글을 남겼습니다.'
               		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+')" style="cursor:pointer;"></i>'
				       +'</span></li>' }
			if(n_index == 2){
				html +='<li class="nav-item" ><span class="message">'
					   +' <a href="/cktree/user/Profile/'+gen_m_no+'">'+gen_m_name+'</a>님이 회원님의 '	
					   +'<a href="/cktree/readNotify?n_no='+n_no+'">댓글</a>에 답글을 남겼습니다.'
               		   +' <i class="far fa-trash-alt" onclick="javascript:deleteNotify('+n_no+')" style="cursor:pointer;"></i>'
				       +'</span></li>' } 
			}   
			
			//알림이 6개 이상이면 더보기 표시
			if(i >= 5){	
    			html +='<li class="nav-item"><div class="text-center">'
    				 +'<a class="dropdown-item" href="/cktree/member/myProfile/'+m_no+'"><strong>더보기</strong></a>'
    				 +'</div></li>'	 
			}
			});

			
		} else {		
			html ='<li class="nav-item" ><span class="message">등록된 알림이 없습니다.</span></li>';
		}
		
		//알림 갯수 
		let countHtml='';
		if(n_count > 0){
			countHtml += '<span style=" top:-5px;" class="badge bg-green">'+n_count+'</span>'
					  +'<i class="far fa-bell"></i>'
		} else{
			countHtml +='<i class="far fa-bell"></i>'
		} 		
		//html동적으로 삽입	
		document.getElementById("navbarDropdown1").innerHTML=countHtml;
		document.getElementById("notify-ul").innerHTML=html;
		
	}, error:function(){}
});	
}
</script> 
</body>
</html>