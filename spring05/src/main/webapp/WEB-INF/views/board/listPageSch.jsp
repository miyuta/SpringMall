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
		<h1>Board List Search</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<form role="schForm" method="get">
		<div class="search">
			<select name="option">
				<option value="list" <c:out value="${searchKey.option == null ? 'selected' : '' }" />>-----</option>
				<option value="title" <c:out value="${searchKey.option eq 'title' ? 'selected' : ''}" />>Title</option>
				<option value="writer" <c:out value="${searchKey.option eq 'writer' ? 'selected' : ''}" />>Writer</option>
				<option value="content" <c:out value="${searchKey.option eq 'content' ? 'selected' : ''}" />>Content</option>
				<option value="all" <c:out value="${searchKey.option eq 'all' ? 'selected' : ''}" />>All</option>
			</select>
		
		<input type="text" name="keyword" id="keywordInput" value="${searchKey.keyword}" />
		
		<button id="btnSearch" type="button">Search</button>
			
		</div>
		<div>총 게시물 ${pageSchMaker.totalPost}개</div>
		<table class="table table-striped table table-boadered table table-hover">
			<tr>
				<th>BNO</th>
				<th>Writer</th>
				<th>Title</th>
				<th>RegDate</th>
				<th>Count</th>
			</tr>
			<c:forEach items="${boardListPageSch}" var="boardListPageSch">
			<tr>
				<td>${boardListPageSch.bno}</td>
				<td><a href="${pageContext.request.contextPath}/board/view?bno=${boardListPageSch.bno}">${boardListPageSch.title}</a></td>
				<td>${boardListPageSch.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardListPageSch.regdate}" /></td>
				<td>${boardListPageSch.cnt}</td>
			</tr>
			</c:forEach>
		</table>
		</form>
		
		<div>
			<c:if test="${pageSchMaker.prev}">
				<a href="${pageContext.request.contextPath}/board/listPage${pageSchMaker.makeQuery(pageSchMaker.startPage - 1)}">[이전]</a>
			</c:if>
			
			<c:forEach begin="${pageSchMaker.startPage}" end="${pageSchMaker.endPage}" var="idx">
				<span>
					<c:if test="${pageSchMaker.atPage != idx}">
						<a href="${pageContext.request.contextPath}/board/listPage?atPage=${idx}">${idx}</a>
					</c:if>
					
					<c:if test="${pageSchMaker.atPage == idx}">
						<b>${idx}</b>
					</c:if>
					
				</span>			
			</c:forEach>

			
			<c:if test="${pageSchMaker.next}">
				<a href="${pageContext.request.contextPath}/board/listPage${pageSchMaker.makeQuery(pageSchMaker.endPage + 1)}">[다음]</a>
			</c:if>
		</div>
		
	</section>
</div>

</body>
</html>