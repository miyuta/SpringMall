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
	
	<section id="container">
		<form role="form1" method="post">
			<table border="1">
				<tbody>
					<tr>
						<td>
							<label for="userid">아이디</label><input type="text" name="userid" placeholder="아이디를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" name="passwd" placeholder="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btnLogin">로그인</button>
							<button type="submit" id="btnBack">뒤로</button>
						</td>
					</tr>
					<tr>
						<td>
							<c:set var="message" value="${message}" />
							<c:if test="${message == 'failed'}">
								<div>아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>