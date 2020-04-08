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
<!-- <script>
	$(document).ready(function(){
		$(function(){
			$("#tblList tbody").sortable();
		});
	});
</script> -->
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
				<th>번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>등록일</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty memberListPage}">
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memberListPage}" var="memberListPage">
							<tr ondblclick="location.href='${pageContext.request.contextPath}/member/view?userid=${memberListPage.userid}'">
								<td>${memberListPage.rnum}</td>
								<td>${memberListPage.userid}</td>
								<td>${memberListPage.username}</td>
								<td>${memberListPage.useremail}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${memberListPage.reg_date}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div>
			<c:if test="${pageMaker.prev}">
				<a href="${pageContext.request.contextPath}/member/listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
				<span>
					<c:if test="${pageMaker.pageVO.atPage != atPage}">
						<a href="${pageContext.request.contextPath}/member/listPage${pageMaker.makeQuery(atPage)}">${atPage}</a>
					</c:if>
					
					<c:if test="${pageMaker.pageVO.atPage == atPage}">
						<b>${atPage}</b>
					</c:if>
				</span>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="${pageContext.request.contextPath}/member/listPage${pageMaker.makeQeury(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</div>
	</section>
</div>
</body>
</html>