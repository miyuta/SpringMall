<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div id="root">
	<header>
		<h1>메인</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	<P>  The time on the server is ${serverTime}. </P>
</div>

</body>
</html>
