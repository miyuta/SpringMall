<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!
	</h1>
	<div>
		<c:choose>
			<c:when test="${member != null}">
				<h3>${member.username}님 환영합니다.</h3>
			</c:when>
			<c:otherwise>
				<h3>로그인하지 않았습니다.</h3>
			</c:otherwise>
		</c:choose>
	</div>
<div>
	<%@ include file="/WEB-INF/views/include/aside.jsp" %>
</div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
