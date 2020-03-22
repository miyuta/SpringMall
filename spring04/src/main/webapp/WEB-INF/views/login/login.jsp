<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
</head>
<script>
	$(function(){
		$("#btnLogin").click(function(){
			var userid = $("#userid").val();
			var passwd= $("#passwd").val();

			if (userid == "") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력해주세요.")
				$("#passwd").focus();
				return;
			}
			document.form1.action="${pageContext.request.contextPath}/login/login";
			document.form1.submit();
		});

		$("#btnBack").click(function(){
			location.href="${pageContext.request.contextPath}/"
		});
	});
</script>
<body>
<div id=root>
	<header>
		<h1>로그인</h1>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<c:if test="${message  == false}">
		<div style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
	</c:if>
	
	<section id="container">
		<form name="form1" method="post">
			<div class="form-group">
				<label class="control-label" for="userid">아이디</label>
				<input class="form-control" type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="form-group">
				<label class="control-label" for="passwd">비밀번호</label>
				<input class="form-control" type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="form-group">
				<input class="btn btn-outline-primary" type="button" id="btnLogin" value="로그인">
				<input class="btn btn-outline-success" type="button" id="btnBack" value="뒤로">
			</div>
		</form>
	</section>
</div>
</body>
</html>