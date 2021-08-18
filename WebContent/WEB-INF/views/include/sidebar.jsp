<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
</head>
<body>
	<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<c:url value="/"/>" class="site_title"><img class="logo" style="width:44px; height:44px;" src="${pageContext.request.contextPath}/resources/gentelella-master/production/images/favicon.png"/> <span> Chuckle Tree!</span></a>
            </div>
            <div class="clearfix"></div>
          <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a> Fun Board  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                     <li><a href="${pageContext.request.contextPath }/board/BestBoardList">BEST</a></li>
                     <li><a href="${pageContext.request.contextPath }/board/funBoardList">FUN</a></li>
                     <li><a href="${pageContext.request.contextPath }/board/WorstBoardList">WORST</a></li>
                    </ul>
                  </li>
                  <li><a> 정보게시판 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html"></a></li>
                    
                    </ul>
                  </li>
                  <li><a> 커뮤니티 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.html"></a></li>
                      
                    </ul>
                  </li>
                 
                </ul>
              </div>
            </div>      
          </div>
           <!-- /sidebar menu -->
</body>
</html>