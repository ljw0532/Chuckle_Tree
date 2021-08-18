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
.ck_title {
	border-bottom: 2px solid #E6E9ED;
	padding: 1px 5px 6px;
	margin-bottom: 10px
}

.x_content {
	border-bottom: 2px solid #E6E9ED;
	padding: 1px 5px 6px;
	margin-bottom: 10px
}

.comment {
	border-top: 2px solid #E6E9ED;
	margin-top: 100px;
	margin-bottom: 150px;
}

.comments_writer {
	border-radius: 5px 5px 5px 5px;
	height: 30px;
	background-color: #5a738e;
	display: flex;
	justify-content: space-between;
}

.comments_content {
	display: flex;
	justify-content: space-between;
	height: auto;
	min-height: 80px;
	padding: 5px 10px;
}
.writer{
color:#23abf4;
}
.item_content{
width:80%;
}
img{

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
     <div style="min-height:1000px;" class="right_col" role="main">
          <div class="">
           <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="ck_title">
                    <h3>${detail.B_TITLE } </h3> <h2 style="font-size:15px; float:left;">
                    <c:choose>
                    	<c:when test="${detail.M_NO != session_m_no }">
                    <a href="/cktree/user/Profile/${detail.M_NO }">${detail.B_WRITER}</a>
                    	</c:when>
                    	<c:otherwise>
                    	 <a href="/cktree/member/myProfile/${detail.M_NO }">${detail.B_WRITER}</a>
                    	</c:otherwise>
                    </c:choose> | <fmt:formatDate value="${detail.B_DATE }" pattern="yyyy-MM-dd"/></h2>
                    <h2 style="font-size:15px; float:right;"> 
                	조회수:${detail.B_CNT } |
                  	 좋아요:<span id="spanCountLikeit">${countLikeit }</span> |
               		  댓글:<span id="countComments"></span>
                  </h2>
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                   	<!-- 게시글 내용 -->
                    <div class="clearfix" style="height:auto; min-height:500px;"> 	
	             
	                  <c:if test="${session_m_no == detail.M_NO || session_m_id == 'admin'}">
	                   <div style="float:right;">
	               		 <i class="far fa-edit fa-lg" onclick="javascript:boardUpdate()" style="cursor:pointer;"></i>
	                     <i class="far fa-trash-alt fa-lg" onclick="javascript:boardDelete()" style="cursor:pointer;"></i> 
	                    </div>
	                   </c:if>	                   
	                 ${detail.b_content}
	                	
	                </div>

			<!-- 좋아요&싫어요 -->
            <div style="display:inline-flex; justify-content: center;" class="col-md-12" >         
             <!-- 좋아요 --> 
              <div style="display:block; padding: 5px 25px;">
              <c:choose>
              <c:when test="${likeit == null}">
                    <div id="like"><i class="far fa-thumbs-up fa-3x" onclick="javascript:likeit()" style="cursor:pointer" ></i></div>
                   </c:when>
                   <c:otherwise>
                  	<div id="like"><i class="fas fa-thumbs-up fa-3x" onclick="javascript:likeit()" style="cursor:pointer" ></i></div>
                   </c:otherwise>
               </c:choose>
               <div id="divCountLikeit">${countLikeit }</div>
               </div>
               <!-- 싫어요 -->
                <div style="display:block; padding: 5px 25px;">
                 <c:choose>
                 	<c:when test="${dislike == null }">
                 		<div id="dislike"><i class="far fa-thumbs-down fa-3x"  onclick="javascript:dislike()" style="cursor:pointer"></i></div>
                 	</c:when>
                	 <c:otherwise>
                 		<div id="dislike"><i class="fas fa-thumbs-down fa-3x"  onclick="javascript:dislike()" style="cursor:pointer"></i></div>
                 	 </c:otherwise>
                 </c:choose> 
                  <div id="divCountDisLike">${countDislike }</div>
                 	</div>                 
                </div>
                  <!-- 댓글 -->
                  	<div class="comment">
                  		<div style="display:flex; justify-content: space-evenly; align-items:center; padding:10px;">	
                  			<textarea  class="form-control" style=" width:85%; height:80px;" id="c_content" name="c_content"></textarea>
                  		<input style="height:50px; width:80px;"class="btn btn-primary" disabled="disabled" id="write_button"type="button" onclick="writeComments(${0},${0},${0},${0})" value="작성" />
                  		</div>
                  			<div id="commentsList">       				
                  			</div>
                  		</div>
                  		<!-- comSubmit Form -->
                  		<form id="commonForm" name="commonForm"></form>
                 <!-- 댓글 끝 -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->


      </div>
      </div>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/resources/js/alertify.min.js" charset="utf-8"></script> 
	<script type="text/javascript">
	
	//전역 변수
	let end = 20; //최초로 불러올 댓글 갯수
	const b_no = ${detail.B_NO}; //게시글 고유번호 전역 변수
	const m_no = '<%=session.getAttribute("session_m_no")%>'; //현재 세션 회원 고유번호 전역 변수
	const button = document.getElementById('write_button'); //댓글 작성 버튼
	const session_m_id = '<%= session.getAttribute("session_m_id")%>';
	
	 //키입력 감지해서 textarea에 값이 없으면 버튼 비활성
	 $("#c_content").on("propertychange change keyup paste input",function(){
	 	const c_content = document.getElementById('c_content').value;
	 	button.disabled = "";
	 	if(c_content == ""){
	 		button.disabled = "disabled";		 		
	 	} 	
	 });
		
//댓글 줄바꿈 처리 + 수신자 이름표시
function convertString(c_no,content,receiver){
	//일반 댓글 줄바꿈 처리	
	if(c_no == 0) {
		let str = content;
		str = str.replace(/(?:\r\n|\r|\n)/g,'<br/>'); //줄바꿈 처리	
		const result = str;
		return result;
	} else { //답글 줄바꿈 처리 + 수신자 이름 표시
		const writer = receiver;
		const str = '<span class="writer">@'+writer+'</span> ';
		let convertString  = str.concat(content); //수신자이름 + 댓글 내용
		convertString = convertString.replace(/(?:\r\n|\r|\n)/g,'<br/>'); // 줄바꿈 처리	
		const result = convertString;
		return result;
	}
}
	 
//댓글 쓰기
function writeComments(c_no,c_group,member_no,receiver){
	let content
	//일반 댓글 엔터 처리
	if(c_no == 0) {
		 content = document.getElementById("c_content").value;
	} else { //답글 엔터 + 수신자 이름 표시
		 content = document.getElementById("reply_content"+c_no).value;
	} 
	const c_content = convertString(c_no,content,receiver);		
	const c_writer = '<%=session.getAttribute("session_m_name")%>';
	const c_parent = c_no;
	const n_content = '<c:out value='${detail.B_TITLE}'/>';
	const writer_mno = ${detail.M_NO};
	let n_index = 1; //알림시 알림 구분번호
	 $.ajax({
		 url:'/cktree/board/writeComments',
		 data:{'c_writer':c_writer,'c_content':c_content,'b_no':b_no,'m_no':m_no,'c_parent':c_parent,'c_group':c_group},
		 type:'POST',
		 success: function(){
			 document.getElementById("c_content").value="";
			 	button.disabled = "disabled";		 			 	
			 commentsList(end);
			 
			 if(c_group != 0){ //답글시 알림
				 n_index=2;
				 insertNotify(n_index,n_content,member_no)
				 notifyList();
			 } else { //일반 댓글시 알림
			 insertNotify(n_index,n_content,writer_mno);
			 notifyList();
			 }
			 
			 }, error: function(){
			 alert("로그인이 필요합니다.");
			 /* location.href="<c:out value='/cktree/loginForm'/>"; */
		 }
	 });
}

//댓글 스크롤 페이징	 
$(function(){
	const count = ${countCmt};
	$(window).scroll(function(){
		const $window = $(this);
		const scrollTop = $window.scrollTop();
		const windowHeight = $window.height();
		const documentHeight = $(document).height();
		if(end < count){
		if( scrollTop + windowHeight + 5 > documentHeight) {
			end += 20;
			commentsList(end);
			}
		}
	});
	commentsList(end);
});

//댓글 리스트
	function commentsList(end){
		$.ajax({
		url:'/cktree/board/commentsList',
		data:{'b_no':b_no,'end':end},
		type:'POST',
		success:function(data){		
			let html="";
			const list = data.commentsList;
			const count = data.countComments;
			
			document.getElementById("countComments").innerHTML = count;
			if(list.length > 0){		
			 $.each(list, function(i,item){
				 const date = item.c_date;
				 const str = timeForToday(date);
				 const server_m_no = JSON.stringify(item.m_no);
				 const c_no = item.c_no;	
				 const c_depth = item.c_depth;
				 const c_parent = item.c_parent;
				 const depth = pxValue(c_depth); 
				 const c_group = item.c_group;
				 const c_writer = "'"+item.c_writer+"'";
				 const c_content = item.c_content;
				
				   
				 function pxValue(c_depth){
					 let result;
					 if(c_depth > 0){
						 result = 50;
					 } else{
						 result = 0;
					 }
					 return result;
				 }
				    
				 //답글 입력창 표시
				 	$(document).on("propertychange change keyup paste input","#reply_content"+c_no,function(){
				 	 	const button = document.getElementById('reply_button'+c_no);
					 	const reply_content = document.getElementById('reply_content'+c_no).value;
					 	button.disabled = "";
					 	if(reply_content == ""){
					 		button.disabled = "disabled";		 		
					 	} 	
					});
				 	 	
					if(server_m_no == m_no || session_m_id =="admin"){  //댓글 작성자와 현재 세션에 있는 사람이 같다면	
						html+='<div class="comments'+c_parent+'" style="padding-left:'+depth+'px">'
						+'<div class="comments_writer">'
						+'<a href="/cktree/member/myProfile/'+server_m_no+'"><p style="color:white; padding:5px 5px;">'+item.c_writer+'</p></a>'//작성자
						+'<p style="padding:5px 5px; color:white;">'+str+'</p></div>' //작성날짜
						+'<div class="comments_content" id="comments_content'+c_no+'" ><div class="item_content" id="item_content'+c_no+'">' +c_content+'</div>'								
						+'<div class="comments_items">'
						+'<i class="fas fa-comment-dots" style="cursor:pointer;" onclick="javascript:writeReply('+c_no+')"></i>' //답글 버튼
						+'&nbsp&nbsp<i class="fas fa-pen" style="cursor:pointer;" onclick="javascript:updateForm('+c_no+','+c_parent+')" ></i>' //수정 버튼
						+'&nbsp&nbsp<i class="fas fa-trash-alt"style="cursor:pointer;" onclick="javascript:commentsDelete('+c_no+','+c_parent+','+c_group+')" ></i></div></div>' //삭제버튼	
						+'<div class="reply" id="reply_form'+c_no+'" style="display:none; justify-content:space-evenly; padding-bottom: 10px">'
						+'<textarea class="form-control" style="width:85%" id="reply_content'+c_no+'" name="reply_content"></textarea>' //답글 textarea
						+'<input class="btn btn-primary" disabled="disabled" id="reply_button'+c_no+'" type="button" onclick="writeComments('+c_no+','+c_group+','+item.m_no+','+c_writer+')" value="작성" /></div></div>';	//댓글작성버튼
			 		} else { //댓글 작성자와 현재 세션에 있는 사람이 다르다면	
			 			html+='<div class="comments'+c_parent+'" style="padding-left:'+depth+'px">' 
						+'<div class="comments_writer">'
						+'<a href="/cktree/user/Profile/'+server_m_no+'"><p style="color:white; padding:5px 5px;">'+item.c_writer+'</p></a>'//작성자		
						+'<p style="padding:5px 5px; color:white;">'+str+'</p></div>' //작성날짜
						+'<div class="comments_content"><div class="item_content">'+c_content+'</div>'			
						+'<div class="comments_items">'
						+'<i class="fas fa-comment-dots" style="cursor:pointer;" onclick="javascript:writeReply('+c_no+')"></i></div></div>' //답글 버튼
						+'<div class="reply" id="reply_form'+c_no+'" style="display:none; justify-content:space-evenly; padding-bottom: 10px">'
						+'<textarea class="form-control" style="width:85%" id="reply_content'+c_no+'" name="reply_content"></textarea>' //답글 textarea
						+'<input class="btn btn-primary" disabled="disabled" id="reply_button'+c_no+'" type="button" onclick="writeComments('+c_no+','+c_group+','+item.m_no+','+c_writer+')" value="작성" />'//댓글작성버튼	           
						+'</div></div>';			
				}
			 });
			} else{
				html +="등록된 댓글이 없습니다.";
			}			
			document.getElementById("commentsList").innerHTML=html;
			return count;
		}, error: function (){
			alert("리스트 실패");
		}
	});
}
//댓글 수정폼 열기
 function updateForm(c_no,c_parent){
	//댓글내용 div
	const comments_content= document.getElementById("comments_content"+c_no);
	//댓글 내용
	const item_content = document.getElementById("item_content"+c_no).innerText;
	//백업변수
	const temp = comments_content.innerHTML;
	
	const last = item_content.indexOf(" "); // 댓글 내용중 처음 공백이 있는 index 반환 (수신자 이름뒤)
	const receiver = item_content.substring(1,last); //수신자에 @와 공백을 제외한 이름
	const replace_content = item_content.replace(item_content.substring(0,last),''); //수정폼에 내용을 보여줄땐 @수신자 이름을 제거해서 보여줌
	
	comments_content.innerHTML='<textarea class="form-control" id="updateForm'+c_no+'" style="width:550px; height:100px;">'+replace_content+'</textarea>'
	+'<div style="display:flex; align-items:flex-end;" style="float:bottom;"><input id="updateButton" class="btn btn-primary" style="float:bottom;"type="button" value="수정">'
	+'<input id="updateCancle" class="btn btn-success" style="float:bottom;"type="button" value="취소"></div>'; 
	
	$('#updateCancle').click(function(){
		comments_content.innerHTML=temp;					
	});
	
	//댓글 수정 보내기
	$("#updateButton").click(function(){
		const content = document.getElementById("updateForm"+c_no).value;
			let c_content;		
				if(c_parent == 0){ //일반 댓글
				c_content =	convertString(0,content,0);
				} else { //답글
				c_content =	convertString(c_no,content,receiver);		
				} 
			
		$.ajax({
			url:'/cktree/board/commentsUpdate',
			data:{'c_no':c_no,'c_content':c_content},
			dataType:'JSON',
			type:'POST',
			success:function(data){
			 commentsList(end);
			 },error:function(){
				alert("댓글 수정 실패")
			}
			}); 
	});
}
//댓글 삭제
function commentsDelete(c_no,c_parent,c_group){
	if(confirm("정말 삭제하시겠습니까?")==true){
	$.ajax({
		url:'/cktree/board/commentsDelete',
		data:{'c_no':c_no,'c_parent':c_parent,'c_group':c_group},
		type:'POST',
		success:function(){
			commentsList(end);
		}, error:function(request,status,error){
			 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
	} else{
		return false;
	}
}


//대댓글폼 펼치기
function writeReply(c_no){
		const display = $("#reply_form"+c_no).css("display");
	 	document.getElementById("reply_form"+c_no).style.display="flex";
	 	if( display == "flex"){
	 		document.getElementById("reply_form"+c_no).style.display="none";			
		 }
}



//좋아요
function likeit(){ 	
	const n_index = 0;
	const n_content = '<c:out value='${detail.B_TITLE}'/>';
		$.ajax({
				url:'/cktree/board/insertLikeit',
				data:{'b_no': b_no, 'm_no': m_no },
				dataType:'JSON',
				type:'POST',
				success: function (data){		
				if(data.likeit > 0){ //좋아요 추가
					document.getElementById('like').innerHTML="<i class='fas fa-thumbs-up fa-3x' onclick='javascript:likeit()' style='cursor:pointer' >";
					deleteDislike();
					countLikeit()
					const m_no = ${detail.M_NO};
					insertNotify(n_index,n_content,m_no);		
					notifyList();
				} else { //좋아요 취소
					document.getElementById('like').innerHTML="<i class='far fa-thumbs-up fa-3x' onclick='javascript:likeit()' style='cursor:pointer'>";	
					countLikeit()
				}
				} , error: function(){
					alert("로그인이 필요합니다.");
					location.href="<c:out value='/cktree/loginForm'/>";
					
				}
			});	
	}
//좋아요시 싫어요 취소
function deleteDislike(){
	$.ajax({
		url:'/cktree/board/deleteDislike',
		data:{'b_no':b_no,'m_no':m_no},
		type:'POST',
		dataType:'JSON',
		success:function(data){
			document.getElementById('dislike').innerHTML="<i class='far fa-thumbs-down fa-3x' onclick='javascript:dislike()' style='cursor:pointer'>";
			countDislike();
		},error :function(){
			alert("실패");
		}
	});
}
//좋아요 갯수	
function countLikeit(){
	$.ajax({
		url:'/cktree/board/countLikeit',
		data:{'b_no':b_no},
		dataType:'JSON',
		type:'POST',
		success: function (data){
			$("#divCountLikeit").html(data);
			$("#spanCountLikeit").html(data);
			
		} ,error: function(){
			alert("로그인이 필요합니다.");
		}
		
	});
}
//싫어요
function dislike(){
		$.ajax({
			url:'/cktree/board/insertDislike',
			data:{'b_no':b_no,'m_no':m_no},
			dataType:'JSON',
			type:'POST',
			success: function (data){
				if(data.dislike > 0){
					document.getElementById('dislike').innerHTML="<i class='fas fa-thumbs-down fa-3x' onclick='javascript:dislike()' style='cursor:pointer'>";
					deleteLikeit();
					countDislike();
				} else{
					document.getElementById('dislike').innerHTML="<i class='far fa-thumbs-down fa-3x' onclick='javascript:dislike()' style='cursor:pointer'>";
					countDislike();
				}
	
			}, error: function(){
				alert("로그인이 필요합니다.");
				location.href="<c:out value='/cktree/loginForm'/>";
			}
		
			});
}
//싫어요 시 좋아요 취소
function deleteLikeit(){
	$.ajax({
		url:'/cktree/board/deleteLikeit',
		data:{'b_no':b_no,'m_no':m_no},
		type:'POST',
		dataType:'JSON',
		success:function(data){
			document.getElementById('like').innerHTML="<i class='far fa-thumbs-up fa-3x' onclick='javascript:likeit()' style='cursor:pointer'>";	
			countLikeit()
			},error :function(){
			alert("실패");
		}
	});
}
//싫어요 갯수
function countDislike(){
	$.ajax({
		url:'/cktree/board/countDislike',
		data:{'b_no':b_no},
		dataType:'JSON',
		type:'POST',
		success: function(data){
			$("#divCountDisLike").html(data);
		}, error: function(){
			alert("실패.");
		}
	});
}
//게시글 수정
function boardUpdate(){
	const comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/board/boardUpdateForm'/>");
	comSubmit.addParam("b_no", b_no);
	comSubmit.submit();
}
//게시글 삭제
function boardDelete(){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href="/cktree/board/boardDelete/"+b_no;	
	} else{
		return false;
	}
	
}

//표기 시간 변경
function timeForToday(date){
const today = new Date();
const timeValue = new Date(date);
 	 		 
 const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) /1000 /60);
 if(betweenTime < 1) {
	 return '방금전';
	}
 if(betweenTime < 60) {
	 return betweenTime+'분전';
	}
 
 const betweenTimeHour = Math.floor(betweenTime / 60);
 if(betweenTimeHour < 24){ 
	return betweenTimeHour+'시간전';
	 
 }
	
 const betweenTimeDay = Math.floor(betweenTimeHour / 24);
 if(betweenTimeDay < 365) {
	 return betweenTimeDay+'일전';
	}
 return '${Math.floor(betweenTimeDay / 365)}년전';
}

//알림 발생
function insertNotify(n_index,n_content,m_no){
	const gen_m_no ='<%=session.getAttribute("session_m_no")%>';
	const gen_m_name ='<%=session.getAttribute("session_m_name")%>';
	$.ajax({
		url:'/cktree/insertNotify',
		data:{'n_index':n_index,'m_no':m_no,'gen_m_no':gen_m_no,'gen_m_name':gen_m_name,'b_no':b_no,'n_content':n_content},
		type:'POST',
		success:function(){
		},error:function(){
		}
			
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
	
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>