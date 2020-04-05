<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='signForm']");

		$("#btnLogin").on("click", function(){
			if (valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/login/login");
			formObj.attr("method", "post");
			formObj.submit();
			});
		});

	function valiChk() {
		var regForm = $("form[role='signForm'] .form-control").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
				alert($(".form-control").eq(i).attr("placeholder"));
				$(".form-control").eq(i).focus();
				return true;
			}
		}
	}
</script>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<p style="color:red;"><c:if test="${message}">아이디 또는 비밀번호를 확인해주세요.</c:if></p>
		<form role="signForm">
			<div class="form-group col-md-12">
			   	<label for="userid">아이디</label>
			   	<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
			 </div>
			<div class="form-group col-md-12">
				<label for="reg_id">비밀번호</label>
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div align="center" class="form-group">
				<button type="button" class="btn btn-outline-primary" id="btnLogin">로그인</button>
				<button type="button" class="btn btn-outline-danger" id="btnLogout">로그아웃</button>
			</div>
		</form>
	</section>
</div>
</body>
</html>