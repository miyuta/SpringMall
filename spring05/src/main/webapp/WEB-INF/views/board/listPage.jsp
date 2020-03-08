<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
			<c:forEach items="${boardListPage}" var="boardListPage">
			<tr>
				<td>${boardListPage.bno}</td>
				<td><a href="${pageContext.request.contextPath}/board/view?bno=${boardListPage.bno}">${boardListPage.title}</a></td>
				<td>${boardListPage.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardListPage.regdate}" /></td>
				<td>${boardListPage.cnt}</td>
			</tr>
			</c:forEach>
		</table>
		
		<div>
			<c:if test="${pagiNation.prev != 0}">
				<a href="${pageContext.request.contextPath}/board/listPage?atPage=${pagiNation.startPage - 1}">[이전]</a>
			</c:if>
			
			<c:forEach begin="${pagiNation.startPage}" end="${pagiNation.endPage}" var="idx">
				<a href="${pageContext.request.contextPath}/board/listPage?atPage=${idx}">${idx}</a>
			</c:forEach>
			
			<c:if test="${pagiNation.next != 0}">
				<a href="${pageContext.request.contextPath}/board/listPage?atPage=${pagiNation.endPage + 1}">[다음]</a>
			</c:if>
		</div>
		
	</section>
</div>

</body>
</html>