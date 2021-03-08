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

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/gentelella-master/build/css/custom.min.css" rel="stylesheet">
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
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>회원가입</h3>
                        </div>

                 
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="x_panel">
                                
                                <div class="x_content">
                                    <form:form commandName="member" method="post">                              
                                      <span class="section">개인정보</span>
                                           <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">아이디<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" name="m_id"/>
                                            </div>
                                        </div>
                                       
                                      
                                        <div class="field item form-group">
											<label class="col-form-label col-md-3 col-sm-3  label-align">비밀번호<span class="required">*</span></label>
											<div class="col-md-6 col-sm-6">
												<input class="form-control" type="password" id="m_password" name="m_password"/>											
												
											</div>
										</div>
                                        
                                    <!--     <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">비밀번호 확인<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="password" name="password2" data-validate-linked='password'/></div>
                                        </div> -->
                                        
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">이름<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" name="m_name" />
                                            </div>
                                        </div>
                                       
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">이메일<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" name="m_email" class='email'  type="email" /></div>
                                        </div> 
                         
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">생년월일<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" class='date' type="text" name="birthday" ></div>
                                        </div>
                                       
                                        
                                        
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">핸드폰번호<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="tel" class='tel' name="m_phone"/></div>
                                        </div>
                                                         
                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div class="col-md-6 offset-md-3">
                                                    <button type='submit' class="btn btn-primary">가입하기</button>
                                                    <button type='reset' class="btn btn-success">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                  </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
            <footer>
            
            </footer>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/validator/multifield.js"></script>
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/validator/validator.js"></script>
    
    <!-- Javascript functions	-->
	<script>
		function hideshow(){
			var password = document.getElementById("password1");
			var slash = document.getElementById("slash");
			var eye = document.getElementById("eye");
			
			if(password.type === 'password'){
				password.type = "text";
				slash.style.display = "block";
				eye.style.display = "none";
			}
			else{
				password.type = "password";
				slash.style.display = "none";
				eye.style.display = "block";
			}

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
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script>

</body>

</html>
