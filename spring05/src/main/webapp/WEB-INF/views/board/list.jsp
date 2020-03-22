<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<section id="container">
		<table class="table table-striped table table-boardered table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardList}">
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList}" var="boardList">
							<tr>
								<td><c:out value="${boardList.bno}"/></td>
								<td><c:out value="${boardList.title}"/></td>
								<td><c:out value="${boardList.reg_id}"/></td>
								<td><c:out value="${boardList.view_cnt}"/></td>
								<td><c:out value="${boardList.reg_dt}"/></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</section>
</div>
</body>
</html>