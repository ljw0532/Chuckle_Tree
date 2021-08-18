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
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
	<!-- Datatables -->
    
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

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
	text-align:center;
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
            <div class="page-title">
             
            </div>

            <div class="clearfix"></div>

            <div class="">
            
            <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Report List</h2>            
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
				<form name="form" action="/cktree/givePenalty" method="post">
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    	 
                    	<thead>
                    		<tr>
                    		<th>신고자</th> <th>신고대상자</th> <th>신고 내용</th> <th>신고시간</th> <th>페널티 주기</th> <th>상세 내용</th>  
                    		</tr>    	
                    	</thead>    
                    		<tbody>         			
                   
                    <c:forEach var="list" items="${list }">  
                   		
                   		         			
                    		<tr>
                    			<td> ${list.reporter_name } (${list.reporter_no })
                    				<input type="hidden" name="m_no" value="${list.m_no }">
                    			</td>
	                    		<td> ${list.m_name } (${list.m_no })
	                    		<input type="hidden" name="report_no" value="${list.report_no }">     		
	                    		</td> 
	                    		<td>${list.report_content } </td>
	                    		<td><fmt:formatDate value="${list.report_date }" pattern="yy년 MM월 dd일 HH시 mm분"/></td>
	                    		<td><input type="submit" value="페널티 주기"></td>  
	                    		<td>${list.report_content }</td>                     		
               
                 		   	</tr>      	
                    </c:forEach>
                     
                    </tbody>
                  </table>
                  </form>
                    		</div>
                  	   </div>
                   	</div>
                  </div>
                </div>
              </div>
             <div class="clearfix"></div>
        	  </div>
 			</div>
 			
 			<!-- 페이징 -->
 			
        <div class="paging" style="text-align:center;">
					<c:if test="${pager.curBlock > 1 }">
						<a class="btn btn-secondary" href="javascript:list('1')">처음</a>&nbsp;
					</c:if>
					<c:if test="${pager.curBlock > 1 }">
						<a class="btn btn-secondary"
							href="javascript:list('${pager.prevPage}')">이전</a>&nbsp;
					</c:if>
					<c:forEach var="num" begin="${pager.blockBegin}"
						end="${pager.blockEnd}">
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
						<a class="btn btn-secondary"
							href="javascript:list('${pager.nextPage}')">다음</a>&nbsp;
					</c:if>
					<c:if test="${pager.curPage <= pager.totPage}">
						<a class="btn btn-secondary"
							href="javascript:list('${pager.totPage }')">끝</a>&nbsp;
					</c:if>
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
	function list(page) {
		location.href="${pageContext.request.contextPath}/admin/selectReportList?curPage="+page
	}
	
	function report(m_no,report_no){
		$.ajax({
			url:'/cktree/givePenalty',
			data:{'m_no':m_no,'report_no':report_no},
			type:'POST',
			success:function(){
				alert("페널티 적용 완료")
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
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jszip/dist/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/pdfmake/build/vfs_fonts.js"></script>
	
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>
  </body>
</html>