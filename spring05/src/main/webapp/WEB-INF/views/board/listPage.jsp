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
			<h1>Board List Search</h1>
		</header>
	</div>

<hr />

	<nav>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</nav>

<hr />

	<section id="container">
	
			<table>
			<c:forEach items="${boardListPage}" var="boardListPage">
				<tr>
					<th>BNo</th>
					<th>Title</th>
					<th>Writer</th>
					<th>RegiterDate</th>
					<th>ViewCount</th>
				</tr>
				<tr>
					<td>${boardListPage.seq}</td>
					<td><a href="${pageContext.request.contextPath}/board/view?seq=${boardListPage.seq}">${boardListPage.title}</a></td>
					<td>${boardListPage.writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardListPage.regdate}" /></td>
					<td>${boardListPage.cnt}</td>
				</tr>
			</c:forEach>
			</table>
			
			<div>
				<c:if test="${pageMaker.prev}">
					<a href="${pageContext.request.contextPath}/board/listPage${PageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
					<a href="${pageContext.request.contextPath}/board/listPage${pageMaker.makeQuery(atPage)}">${atPage}</a>
				</c:forEach>
				<%-- <c:if test="${pageMaker.criteria.atPage == atPage}">
					<b></b>
				</c:if> --%>
				
				<c:if test="${pageMaker.next}">
					<a href="${pageContext.request.contextPath}/board/listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
				</c:if>
			</div>
	
	</section>

</body>
</html>