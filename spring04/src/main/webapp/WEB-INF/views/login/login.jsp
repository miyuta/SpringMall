<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
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
			event.preventDefault();
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
			<table border="1">
				<tbody>
					<tr>
						<td>
							<label for="userid">아이디</label><input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="btnLogin" value="로그인">
							<input type="button" id="btnBack" value="뒤로">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>