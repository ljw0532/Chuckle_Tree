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
	<!-- iCheck -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	<!-- bootstrap-wysiwyg -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
	<!-- Select2 -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
	<!-- Switchery -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
	<!-- starrr -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/starrr/dist/starrr.css" rel="stylesheet">
	<!-- bootstrap-daterangepicker -->
	<link href="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                        <h3></h3>
                        </div>

                 
                    </div>
                    <div class="clearfix"></div>
					
                    <div class="row">
                        <div class="col-md-12 col-sm-12 ">
						<div class="x_panel">
						<form:form commandName="board" id="form" name="form" enctype="multipart/form-data">
							<div class="x_title">					
								<input type="text" id="b_title" name="b_title" class="form-control" style="width:75%;" maxlength="30" value="${detail.B_TITLE }">
								<input type="hidden" id="b_writer" name="b_writer" value="${session_m_name}">
								<input type="hidden" id="m_no" name="m_no" value="${session_m_no }">
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div id="alerts"></div>
								<div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
										<ul class="dropdown-menu">
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li>
												<a data-edit="fontSize 5">
													<p style="font-size:17px">Huge</p>
												</a>
											</li>
											<li>
												<a data-edit="fontSize 3">
													<p style="font-size:14px">Normal</p>
												</a>
											</li>
											<li>
												<a data-edit="fontSize 1">
													<p style="font-size:11px">Small</p>
												</a>
											</li>
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
										<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
										<a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
										<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
										<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
										<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
										<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
										<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
										<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
										<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
										<div class="dropdown-menu input-append">
											<input class="span2" placeholder="URL" type="text" data-edit="createLink" />
											<button class="btn" type="button">Add</button>
										</div>
										<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
										<input type="file" name="file" id="inputFile" multiple="multiple"/>
										<input type="hidden" name="uuidFileName" value="">
							<!--  data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage"  -->
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
										<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
									</div>
								</div>

						
							<div id="editor-one" class="editor-wrapper">
								${detail.b_content}
							</div>
								
								<textarea name="b_content" id="descr" style="display:none;"></textarea>
	
								<br />
								<br />

								<div class="ln_solid"></div>

								<div class="form-group">
								<input type="button" onclick="location.href='/cktree/board/funBoardDetail/${detail.B_NO}'" style="float:right;" class="btn btn-success" value="취소">
								<input type="button" onclick="submit_form(this.form.inputFile)" class="btn btn-primary" style="float:right;" value="수정">
								</div>
							
							</div>
							<input type="hidden" name="b_no" value="${detail.B_NO }">
							</form:form>
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
	<script type="text/javascript">
		
		//이미지 업로드시 미리보기	
		var sel_files = [];	
		$(document).ready(function(){
			$("#inputFile").on("change",filePreview);
		});
		
		function filePreview(e){
			sel_files = [];
			
			const files = e.target.files;
			const filesArr = Array.prototype.slice.call(files);
			
			let index=0;
			filesArr.forEach(function(f){
				sel_files.push(f);
				
				const reader = new FileReader();
				reader.onload = function(e){
					let img = document.createElement("img");
						img.setAttribute("src", e.target.result);
						img.id="image"+index;
						img.width=450;
						img.height=350;
						
					document.querySelector("#editor-one").appendChild(img);
					index++;
				}
				reader.readAsDataURL(f);
			});
		}
		
		//form submit
		function submit_form(file){
			let ufnArr = new Array();
			let fileSize = 0;
			const form = document.getElementById("form");
			const fileNames = document.getElementById("inputFile").files;
			
			if(form.b_title.value == ""){
				alert("제목을 작성해주세요.");
				form.b_title.focus();
				return false;
			}
			 for(var i=0; i<fileNames.length; i++){
				 fileSize += file.files[i].size;
				const uuid = uuidv4();
				const image = document.getElementById("image"+i);
				const uuidFileName = uuid + '_' + fileNames[i].name;
			 	
			 	ufnArr[i] = uuidFileName; 
				 image.setAttribute("src",'/cktree/upload/'+uuidFileName);	
				
				 if(107374180 < fileSize){			
					alert("파일의 용량은 최대 100MB입니다.");
					$("input[name=file]").val('');		
					$("#editor-one").empty();
					return false;
				}
		
			}
		
			 const b_content = document.getElementById("editor-one").innerHTML;
		 form.b_content.value= b_content;
		 form.uuidFileName.value = ufnArr;
		 form.action="/cktree/board/boardUpdate";
		form.submit()
		
	}
		
		//UUID생성
		function uuidv4() {
			  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
			    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
			    return v.toString(16);
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
	<!-- bootstrap-progressbar -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/vendors/starrr/dist/starrr.js"></script> 
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/resources/gentelella-master/build/js/custom.min.js"></script> 

</body>

</html>
