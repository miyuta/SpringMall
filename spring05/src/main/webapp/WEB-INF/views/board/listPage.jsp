<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>Board List</h1>
		</header>
	</div>

<hr />

	<nav>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</nav>

<hr />

	<section id="container">
	
		<form role="pChkForm" method="post" action="${pageContext.request.contextPath}/board/write">
			<table>
			<c:forEach items="${boardList}" var="boardList">
				<tr>
					<th>BNo</th>
					<th>Title</th>
					<th>Writer</th>
					<th>RegiterDate</th>
					<th>ViewCount</th>
				</tr>
				<tr>
					<td>${boardList.seq}</td>
					<td><a href="${pageContext.request.contextPath}/board/view?seq=${boardList.seq}">${boardList.title}</a></td>
					<td>${boardList.writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardList.regdate}" /></td>
					<td>${boardList.cnt}</td>
				</tr>
			</c:forEach>
			</table>
		</form>
	
	</section>

</body>
</html>