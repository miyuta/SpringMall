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
	<form name="form1" method="post" action="${pageContext.request.contextPath}/board/listPage">
		<select id="option" name="option">
			<option value="list" <c:out value="${option == 'list' ? 'selected' : ''}"/>>리스트</option>
			<option value="all" <c:out value="${option == 'all' ? 'selected' : ''}"/>>제목 + 작성자 + 내용</option>
			<option value="title" <c:out value="${option == 'title' ? 'selected' : ''}"/>>제목</option>
			<option value="writer" <c:out value="${option == 'writer' ? 'selected' : ''}"/>>작성자</option>
			<option value="content" <c:out value="${option == 'content' ? 'selected' : ''}"/>>내용</option>
		</select>
		<input id="keyword" type="text" name="keyword" value="${keyword}">
		<input type="submit" value="조회">
		<c:if test="${member != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	
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
			
			<c:if test="${map.prev == 0}">
				<span>[ <a href="${pageContext.request.contextPath}/board/listPage?num=${map.startPageNum - 1}">이전</a> ]</span>
			</c:if>
			
			<c:forEach begin="${map.startPageNum}" end="${map.endPageNum}" var="num">
				<span>
				
					<c:if test="${map.atPage != num}">
						<%-- <a href="${pageContext.request.contextPath}/board/listPage?num=${num}">${num}</a> --%>
						<input type="submit" name="num" value="${num}">
					</c:if>
					
					<c:if test="${map.atPage == num}">
						<b>${num}</b>
					</c:if>
				
				</span>
			</c:forEach>
			
			<c:if test="${map.next == 0}">
				<span>[ <a href="${pageContext.request.contextPath}/board/listPage?num=${map.endPageNum + 1}">다음</a> ]</span>
			</c:if>
			
<%-- 			<div>
				<c:forEach begin="1" end="${PageNum}" var="num">
					<span>
						<a href="${pageContext.request.contextPath}/board/listPage?num=${num}">${num}</a>
					</span>
				</c:forEach>
			</div> --%>
		</form>	
	</section>
</div>
</body>
</html>