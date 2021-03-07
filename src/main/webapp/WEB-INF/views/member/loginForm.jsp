<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">

  <body class="login">
    <div>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form:form commandName="member" method="post">
              <h1>Login Form</h1>
              <div>
                <input type="text" class="form-control" placeholder="ID" name="m_id"/>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="PASSWORD" name="m_password" />
              </div>
              <div>
                <button type="submit" class="btn btn-success">로그인</button>
              
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <a href="">아이디 찾기</a>|<a href=""> 비밀번호 찾기</a><br/>
                <p class="change_link">첫 방문이신가요?
                  <a href="<c:url value="joinForm"/>" class="to_register">  회원가입 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                 <a href="<c:url value="/" />"> <h1>Chuckle Tree!</h1></a>
                  <p>©2021 All Rights Reserved.</p>
                </div>
              </div>
            </form:form>
          </section>
        </div>

      </div>
    </div>
  </body>
</html>
