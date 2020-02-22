<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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