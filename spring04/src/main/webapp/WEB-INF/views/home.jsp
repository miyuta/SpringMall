<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div id=root>
	<header>
		<c:choose>
			<c:when test="${member != null}">
				<h1>${member.username}님 환영합니다.</h1>
			</c:when>
			<c:otherwise>
				<h1>로그인하지 않았습니다.</h1>
			</c:otherwise>
		</c:choose>
	</header>
	<hr />

<div>
	<%@ include file="/WEB-INF/views/include/aside.jsp" %>
</div>
<P>  The time on the server is ${serverTime}. </P>
</div>
</body>
</html>
