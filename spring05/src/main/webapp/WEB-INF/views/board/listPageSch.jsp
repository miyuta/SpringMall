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
<script>
	$(document).ready(function(){
		
		$("#btnSearch").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/listPageSch"
									+"${pageMaker.makeQuery(1)}"
									+"&option="
									+$("select option:selected").val()
									+"&keyword="
									+encodeURIComponent($("#keyword").val());
		});
	});
</script>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<div id="search">
			<select name="option">
				<option value="list" <c:out value="${schVO.option == 'list' ? 'selected' : ''}"/>>---------</option>
				<option value="all" <c:out value="${schVO.option == 'all' ? 'selected' : ''}"/>>All</option>
				<option value="title" <c:out value="${schVO.option == 'title' ? 'selected' : ''}"/>>Title</option>
				<option value="reg_id" <c:out value="${schVO.option == 'reg_id' ? 'selected' : ''}"/>>Writer</option>
				<option value="content" <c:out value="${schVO.option == 'content' ? 'select' : ''}"/>>Content</option>
			</select>
			
			<input type="text" id="keyword" name="keyword" value="${schVO.keyword}">
			
			<button type="button" id="btnSearch">검색</button>
		</div>
		<table id="tblList" class="table table-striped table table-boardered table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardListPageSch}">
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardListPageSch}" var="boardListPageSch">
							<tr ondblclick="location.href='${pageContext.request.contextPath}/board/view?bno=${boardListPageSch.bno}'
																																										+'&atPage=${schVO.atPage}'
																																										+'&perPagePost=${schVO.perPagePost}'
																																										+'&option=${schVO.option}'
																																										+'&keyword=${schVO.keyword}'">
								<td>${boardListPageSch.bno}</td>
								<td>${boardListPageSch.title}</td>
								<td>${boardListPageSch.reg_id}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardListPageSch.reg_dt}" /></td>
								<td>${boardListPageSch.view_cnt}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div>
			<c:if test="${pageMaker.prev}">
				<a href="${pageContext.request.contextPath}/board/listPageSch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
				<span>
					<c:if test="${pageMaker.pageVO.atPage != atPage}">
						<a href="${pageContext.request.contextPath}/board/listPageSch${pageMaker.makeSearch(atPage)}">${atPage}</a>
					</c:if>
					
					<c:if test="${pageMaker.pageVO.atPage == atPage}">
						<b>${atPage}</b>
					</c:if>
				</span>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="${pageContext.request.contextPath}/board/listPageSch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</div>
	</section>
</div>
</body>
</html>