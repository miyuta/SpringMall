<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<P>  The time on the server is ${serverTime}. </P>
</div>
</body>
</html>
