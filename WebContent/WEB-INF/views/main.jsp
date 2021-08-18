<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- Meta, title, CSS, favicons, etc. -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
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

    <title>Chuckle Tree! | </title>
<style>
.board_cnt{
	color:#29b6f6;
}
.board-title{
	height:30px;
	width:100%;
	border-bottom: 2px solid #E6E9ED;
}
.board_content{
	display:inline;
}

tr{
border-collapse:collapse;
border-bottom:1px solid #E6E9ED;
height:50px;
}

table{
margin:0 auto;
width:100%;
}

@media screen and (min-height:933px) {
.right_col{
height:1000px;
}

}
</style>  
<script async src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script async src="${pageContext.request.contextPath}/resources/js/notify.js"></script>  
</head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      <!-- 헤더  -->
       <div class="top_nav">
        	<%-- <jsp:include page="/WEB-INF/views/include/header.jsp"/> --%>   
        	<%@ include file="/WEB-INF/views/include/header.jsp" %>
        </div> 
      <!-- 사이드바 -->
        <div class="col-md-3 left_col menu_fixed">
          <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
        </div>
      <!-- 페이지 내용 -->
      <div class="right_col" role="main">
      	<div class="">
            <div class="page-title">
           
            </div>

            <div class="clearfix"></div>

            <div class="">
              <div class="col-md-6 col-sm-6" >
                <div class="x_panel" style="height:679px;">
                  <div class="x_title">
                    <h2><a href="/cktree/board/BestBoardList">BEST</a></h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
							<table style="height:100%;">
	              	 				<c:choose>
	              	 					<c:when test="${fn:length(bestList)>0 }">
	              	 						<c:forEach items="${bestList }" var="bestList" end="11">	  
	              	 		 			       <tr>    	 		
	              	 								<td><a href="/cktree/board/funBoardDetail/${bestList.b_no }">${bestList.b_title }</a>&nbsp;&nbsp;
	              	 								<span class="board_cnt">${bestList.comments_count }</span></td>
	              	 								<td></td>
	              								</tr>
	              	 						</c:forEach>
	              	 				</c:when>
	              	 					<c:otherwise>
	              	 						<tr><td>등록된 게시글이 없습니다.</td><td></td></tr>
	              	 					</c:otherwise>
	              	 				</c:choose>
							</table>			
            	      </div>
               	 </div>
              </div>
              
              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><a href="/cktree/board/funBoardList">FUN</a></h2>
                     <ul class="nav navbar-right panel_toolbox">
                    <c:choose>
                    <c:when test="${session_m_no != null }">
                    <li><a style="color:#5a738e;" href="/cktree/board/boardWrite"><i class="fas fa-pen"></i> 글쓰기</a></li>
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                    </c:choose>
                    </ul>               
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
							<table>
	              	 			<c:choose>
	              	 					<c:when test="${fn:length(funList)>0 }">
	              	 						<c:forEach items="${funList }" var="funList" end="4">	              	 							
	              	 		  		 	     <tr>    	 		
	              	 							<td><a href="/cktree/board/funBoardDetail/${funList.b_no }">${funList.b_title }</a>&nbsp;&nbsp;
	              	 							<span class="board_cnt">${funList.comments_count }</span></td>
	              	 							<td></td>
	              							</tr>		
	              	 					</c:forEach>
	              	 					</c:when>
	              	 				<c:otherwise>
	              	 					<tr><td>등록된 게시글이 없습니다.</td><td></td></tr>
	              	 				</c:otherwise>
	              	 			</c:choose>
							</table>			
            	      </div>
               	 </div>
              </div>
              
              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><a href="/cktree/board/WorstBoardList">WORST</a></h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
							<table>
	              	 				<c:choose>
	              	 					<c:when test="${fn:length(worstList)>0 }">
	              	 						<c:forEach items="${worstList }" var="worstList" end="4">	  
	              	 		  			      <tr>    	 		
	              	 							<td><a href="/cktree/board/funBoardDetail/${worstList.b_no }">${worstList.b_title }</a>&nbsp;&nbsp;
	              	 							<span class="board_cnt">${worstList.comments_count }</span></td>
	              	 							<td></td>
	              					     	  </tr>
	              	 					</c:forEach>
	              	 				</c:when>
	              	 				<c:otherwise>
	              	 					<tr><td>등록된 게시글이 없습니다.</td><td></td></tr>
	              	 				</c:otherwise>
	              	 				</c:choose>
							</table>			  	 			
            	      </div>
               	 </div>
              </div>
              
              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><a href="">정보게시판</a></h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
							<table>
	          					<tr><td>등록된 게시글이 없습니다.</td><td></td></tr>
	              	 		</table>			
            	      </div>
               	 </div>
              </div>
              
              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><a href="">커뮤니티</a></h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
							<table>
	              				<tr><td>등록된 게시글이 없습니다.</td><td></td></tr>		
							</table>			
            	      </div>
               	 </div>
              </div>
          </div>
          <div class="clearfix"></div>
        </div>
        <!-- /page content -->
		</div> 
    	<footer></footer>
    </div>
   </div>
   
    <script type="text/javascript">
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