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

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">  
  <style>
.searchOption {
	height: 42px;
	border-right: 0;
	-webkit-box-shadow: inset 0 1px 0px rgba(0, 0, 0, 0.075);
	border-radius: 25px 0px 0px 25px;
	box-shadow: inset 0 1px 0px rgba(0, 0, 0, 0.075);
	padding-left: 10px;
	border: 1px solid rgba(221, 226, 232, 0.49);
}

.search_box {
	width: 135px;
	height: 42px;
	border-right: 0;
	-webkit-box-shadow: inset 0 1px 0px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 0px rgba(0, 0, 0, 0.075);
	padding-left: 0px;
	border: 1px solid rgba(221, 226, 232, 0.49);
}

.list {
	border-bottom:1px solid rgba(222,226,230,5.0);
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
     <div style="height:1000px;" class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3></h3>
              </div>
	   
              <div class="title_right">
                  <form name="searchForm" method="get" action="${pageContext.request.contextPath}/board/BestBoardList">
                   <div class="input-group" style="width:300px; display:flex; float:right;">       	 
                	 <select class="searchOption" name="searchOption">
                 <c:choose>
					<c:when test="${searchOption == 'all'}">
						<option value="all" selected>전체</option>
						<option value="b_writer">작성자</option>
						<option value="b_content">내용</option>
					</c:when>
					<c:when test="${searchOption == 'b_writer'}">
						<option value="all" >전체</option>
						<option value="b_writer" selected>작성자</option>
						<option value="b_content">내용</option>
					</c:when>
					<c:when test="${searchOption == 'b_content'}">
						<option value="all" >전체</option>
						<option value="b_writer">작성자</option>
						<option value="b_content" selected>내용</option>
					</c:when>
				</c:choose>		
                  </select>
                   <input class="search_box" type="text" id="keyword" name="keyword" autoComplete="off">
                   
                        <input type="submit" class="btn btn-secondary" style="height:42px;  border-radius:0px 25px 25px 0px;" value="Search"/>
     	           </div>                 
                </form>
              </div>
             
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>WORST BOARD </h2>
                    <ul class="nav navbar-right panel_toolbox">
                    
                    </ul>
                    <div class="clearfix"></div>
                  </div>
        
        	    <div class="x_content">					
                    <table class="table">
                      <thead>
                        <tr>                        
                          <th style="width:50%">제 목</th>
                          <th>작성자</th>
                          <th>날 짜</th>
                        </tr>
                      </thead>
                      <tbody>
                     <c:choose> 	
                     <c:when test="${fn:length(list) > 0 }">
                      <c:forEach var="list" items="${list}" varStatus="status">
                        <tr class="list">
                          <td><a href="${Path}/board/funBoardDetail/${list.b_no}">${list.b_title }</a></td>
                          <c:choose>
                          	<c:when test="${session_m_no != list.m_no }">
                          		<td><a href="/cktree/user/Profile/${list.m_no }" >${list.b_writer }</a></td>
                          	</c:when>
                          	<c:otherwise>
                          		<td>
                          			<a href="/cktree/member/myProfile/${list.m_no }">${list.b_writer }</a>
                          		</td>
                          	</c:otherwise>
                          </c:choose>
                          <td id="td_date">                         
                    <jsp:useBean id="today" class="java.util.Date"/>                       
                      <fmt:parseNumber value="${today.time }" var ="now"/>                  
                      <fmt:parseNumber value="${list.b_date.time }" var = "b_date" />
                      <fmt:formatDate value="${list.b_date }" pattern="yyyy/MM/dd" var="date"/>                 
                   		  <c:set value="${((now - b_date)/1000/60)}" var="dayDiff" />                 		  
               			<fmt:formatNumber type="number" maxFractionDigits="0"  value="${dayDiff}" var="time"/>  
               			<fmt:parseNumber value="${time}" integerOnly="true" var="parse_time" />
               			<c:set value="${parse_time/60}" var="diffHour"/>
         				<fmt:formatNumber type="number" maxFractionDigits="0"  value="${diffHour}" var="hour"/>
         				<fmt:parseNumber value="${hour}" integerOnly="true" var="parse_hour" />             				  				
               			<c:set value="${parse_hour/24}" var="diffDay"/>
                		<fmt:formatNumber type="number" maxFractionDigits="0"  value="${diffDay}" var="day"/>
               			<fmt:parseNumber value="${day}" integerOnly="true" var="parse_day" />
                	<c:choose>
                		<c:when test="${parse_time  < 1 }">
                			방금전
                		</c:when>
                		<c:when test="${parse_time  < 60 }">
                			${parse_time }분전
                		</c:when>
                		<c:when test="${parse_hour  < 24 }">
                			${parse_hour }시간전
                		</c:when>
                		<c:when test="${parse_day  < 8 }">
                			${parse_day }일전
                		</c:when> 
                		<c:otherwise>
                			${date}
                		</c:otherwise>             		
                	</c:choose>
               
                	
                       </td>                     
                      </tr>
                       </c:forEach> 
                       </c:when>
                       <c:otherwise>
                     	<tr>
                     	<td>
               			 등록된 게시물이 없습니다.   	
                     	</td>
             			</tr>    
                       </c:otherwise>                     
                       </c:choose>
                      </tbody>
                    </table>
                  </div>
            
            
                </div>
              </div>
            </div>
          </div> 
          	 
          	       
            <div class="paging" style="text-align:center;">     
    			<c:if test="${pager.curBlock > 1 }">
				<a class="btn btn-secondary" href="javascript:list('1')">처음</a>&nbsp;
			</c:if>
			
			<c:if test="${pager.curBlock > 1 }">
			<a class="btn btn-secondary" href="javascript:list('${pager.prevPage}')">이전</a>&nbsp;
			</c:if>
			
			<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}"> 
			<c:choose>
			 <c:when test="${num == pager.curPage}">
			 	<a class="btn btn-secondary">${num} </a>
			 </c:when>
			 <c:otherwise>	
				<a class="btn btn-secondary" href="javascript:list('${num}')">${num}</a>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			
			<c:if test="${pager.curBlock <= pager.totBlock }">
				<a class="btn btn-secondary" href="javascript:list('${pager.nextPage}')">다음</a>&nbsp;
			</c:if>
			
			<c:if test="${pager.curPage <= pager.totPage}">
				<a  class="btn btn-secondary" href="javascript:list('${pager.totPage }')">끝</a>&nbsp;
			</c:if>		
			
	        </div> 
                     
          
        </div> 
        <!-- /page content -->  
      </div>
     </div>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	 function list(page) {
		location.href="${pageContext.request.contextPath}/board/WorstBoardList?curPage="+page
			+"&searchOption=${searchOption}"
			+"&keyword=${keyword}"; 
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

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>