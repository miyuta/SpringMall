<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Board</title>
</head>
<script>
	$(function(){
		$("#btnSearch").click(function(){
			self.location="${pageContext.request.contextPath}/board/listSearch"
				+"${pageMaker.makeQuery(1)}"
				+"&searchType="
				+$("select option:selected").val()
				+"&keyword="
				+encodeURIComponent($("#keyword").val());
		});
	});
</script>
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
	
		<div id="search">
			<select name="searchType">
				<option value="n" <c:out value="${schVO.searchType == null ? 'selected' : ''}" />>------</option>
				<option value="t" <c:out value="${schVO.searchType eq 't' ? 'selected' : ''}" />>제목</option>
				<option value="w" <c:out value="${schVO.searchType eq 'w' ? 'selected' : ''}" />>작성자</option>
				<option value="c" <c:out value="${schVO.searchType eq 'c' ? 'selected' : ''}" />>내용</option>
				<option value="tc" <c:out value="${schVO.searchType eq 'tc' ? 'selected' : ''}" />>제목 + 내용</option>
			</select>
			
			<input type="text" name="keyword" id="keyword" value="${schVO.keyword}">
			
			<button id="btnSearch">검색</button>
		</div>
	
		<table>
		<c:forEach items="${boardListSch}" var="boardListSch">
			<tr>
				<th>BNo</th>
				<th>Title</th>
				<th>Writer</th>
				<th>RegiterDate</th>
				<th>ViewCount</th>
			</tr>
			<tr>
				<td>${boardListSch.seq}</td>
				<td><a href="${pageContext.request.contextPath}/board/view?seq=${boardListSch.seq}&
																																		atPage=${scri.atPage}&
																																		perPagePost=${scri.perPagePost}&
																																		searchType=${scri.searchType}&
																																		keyword=${scri.keyword}">${boardListSch.title}</a></td>
				<td>${boardListSch.writer}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardListSch.regdate}" /></td>
				<td>${boardListSch.cnt}</td>
			</tr>
		</c:forEach>
		</table>
		
		<div>
			<c:if test="${pageMaker.prev}">
				<a href="${pageContext.request.contextPath}/board/listSearch${PageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
				<a href="${pageContext.request.contextPath}/board/listSearch${pageMaker.makeSearch(atPage)}">${atPage}</a>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<a href="${pageContext.request.contextPath}/board/listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</div>
	
	</section>

</body>
</html>