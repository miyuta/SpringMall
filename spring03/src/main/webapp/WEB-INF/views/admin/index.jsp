<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Admin Home</title>
	
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

	<link rel ="stylesheet" href="">
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="/WEB-INF/views/admin/include/header.jsp"  %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="/WEB-INF/views/admin/include/aside.jsp" %>
		</aside>
		<div id="container_box">
			본문 영역
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
		</div>
	</footer>
</div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>