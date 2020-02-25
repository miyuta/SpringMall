<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<script>
	$(function(){
		$("#btnWrite").click(function(){
			location.href="${pageContext.request.contextPath}/board/write";
		});
	});
</script>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<section id="container">
	<form name="form1" method="post" action="${pageContext.request.contextPath}/board/list">
		<select name="option">
			<option value="list" <c:out value="${optoin == 'list' ? 'selected' : ''}"/>>리스트</option>
			<option value="all" <c:out value="${optoin == 'all' ? 'selected' : ''}"/>>제목 + 작성자 + 내용</option>
			<option value="title" <c:out value="${optoin == 'title' ? 'selected' : ''}"/>>제목</option>
			<option value="writer" <c:out value="${optoin == 'writer' ? 'selected' : ''}"/>>작성자</option>
			<option value="content" <c:out value="${optoin == 'content' ? 'selected' : ''}"/>>내용</option>
		</select>
		<input type="text" name="keyword" value="${keyword}">
		<input type="submit" value="조회">
		<c:if test="${member != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	</form>
			<table>
			<c:forEach items="${boardList}" var="boardlist">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
				</tr>
				<tr>
					<td>${boardlist.seq}</td>
					<td><a href="${pageContext.request.contextPath}/board/view?n=${boardlist.seq}&error=0">${boardlist.title}</a></td>
					<td>${boardlist.writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardlist.regdate}"/></td>
					<td>${boardlist.cnt}</td>
				</tr>
			</c:forEach>
			</table>
			
			<c:if test="${prev}">
				<span>[ <a href="${pageContext.request.contextPath}/board/listPage?num=${startPageNum - 1}">이전</a> ]</span>
			</c:if>
			
			<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				<span>
				
					<c:if test="${atPage != num}">
						<a href="${pageContext.request.contextPath}/board/listPage?num=${num}">${num}</a>
					</c:if>
					
					<c:if test="${atPage == num}">
						<b>${num}</b>
					</c:if>
				
				</span>
			</c:forEach>
			
			<c:if test="${next}">
				<span>[ <a href="${pageContext.request.contextPath}/board/listPage?num=${endPageNum + 1}">다음</a> ]</span>
			</c:if>
			
<%-- 			<div>
				<c:forEach begin="1" end="${PageNum}" var="num">
					<span>
						<a href="${pageContext.request.contextPath}/board/listPage?num=${num}">${num}</a>
					</span>
				</c:forEach>
			</div> --%>
			
	</section>
</div>
</body>
</html>