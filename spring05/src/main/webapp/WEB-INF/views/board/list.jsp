<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/board.css">
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<div id="root">
	<header>
		<h1>Board Listト</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<table class="table table-striped table table-boadered table table-hover">
			<tr>
				<th>BNO</th>
				<th>Writer</th>
				<th>Title</th>
				<th>RegDate</th>
				<th>Count</th>
			</tr>
			<c:forEach items="${boardList}" var="boardList">
			<tr>
				<td>${boardList.bno}</td>
				<td><a href="${pageContext.request.contextPath}/board/view?bno=${boardList.bno}">${boardList.title}</a></td>
				<td>${boardList.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardList.regdate}" /></td>
				<td>${boardList.cnt}</td>
			</tr>
			</c:forEach>
		</table>	
		
	</section>
</div>

</body>
</html>