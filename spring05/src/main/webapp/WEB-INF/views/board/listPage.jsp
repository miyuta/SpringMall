<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
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
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<table id="tblList" class="table table-striped table table-boardered table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardListPage}">
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardListPage}" var="boardListPage">
							<tr ondblclick="location.href='${pageContext.request.contextPath}/board/view?bno=${boardListPage.bno}'">
								<td>${boardListPage.bno}</td>
								<td>${boardListPage.title}</td>
								<td>${boardListPage.reg_id}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardListPage.reg_dt}" /></td>
								<td>${boardListPage.view_cnt}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div>
			<c:if test="${pageMaker.prev}">
				<a href="${pageContext.request.contextPath}/board/listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
				<span>
					<c:if test="${pageMaker.pageVO.atPage != atPage}">
						<a href="${pageContext.request.contextPath}/board/listPage${pageMaker.makeQuery(atPage)}">${atPage}</a>
					</c:if>
					
					<c:if test="${pageMaker.pageVO.atPage == atPage}">
						<b>${atPage}</b>
					</c:if>
				</span>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="${pageContext.request.contextPath}/board/listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</div>
	</section>
</div>
</body>
</html>