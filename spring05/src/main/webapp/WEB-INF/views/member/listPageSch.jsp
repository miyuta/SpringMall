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
			self.location="${pageContext.request.contextPath}/member/listPageSch"
									+"${pageMaker.makeQuery(1)}"
									+"&option="
									+$("select option:selected").val()
									+"&keyword="
									+encodeURIComponent($("#keyword").val());
		});
	});
</script>
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
		<div id="search">
			<select name="option">
				<option value="list" <c:out value="${schVO.option == 'list' ? 'selected' : ''}"/>>---------</option>
				<option value="all" <c:out value="${schVO.option == 'all' ? 'selected' : ''}"/>>All</option>
				<option value="userid" <c:out value="${schVO.option == 'userid' ? 'selected' : ''}"/>>UserId</option>
				<option value="username" <c:out value="${schVO.option == 'username' ? 'selected' : ''}"/>>UserName</option>
				<option value="useremail" <c:out value="${schVO.option == 'useremail' ? 'selected' : '' }"/>>UserEmail</option>
			</select>
			
			<input type="text" id="keyword" name="keyword" value="${schVO.keyword}">
			
			<button type="button" id="btnSearch">검색</button> 
		</div>
		<table id="tblList" class="table table-striped table table-boardered table table-hover">
			<thead>
			<tr>
				<th>번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>등록일</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty memberListPageSch}">
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memberListPageSch}" var="memberListPageSch">
							<tr ondblclick="location.href='${pageContext.request.contextPath}/member/view?userid=${memberListPageSch.userid}'
																																														+'&atPage=${schVO.atPage}'
																																														+'&perPagePost=${schVO.perPagePost}'
																																														+'&option=${schVO.option}'
																																														+'&keyword=${schVO.keyword}'">
								<td>${memberListPageSch.rnum}</td>
								<td>${memberListPageSch.userid}</td>
								<td>${memberListPageSch.username}</td>
								<td>${memberListPageSch.useremail}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${memberListPageSch.reg_date}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<div>
			<c:if test="${pageMaker.prev}">
				<a href="${pageContext.request.contextPath}/member/listPageSch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="atPage">
				<span>
					<c:if test="${pageMaker.pageVO.atPage != atPage}">
						<a href="${pageContext.request.contextPath}/member/listPageSch${pageMaker.makeSearch(atPage)}">${atPage}</a>
					</c:if>
					
					<c:if test="${pageMaker.pageVO.atPage == atPage}">
						<b>${atPage}</b>
					</c:if>
				</span>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="${pageContext.request.contextPath}/member/listPageSch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>
		</div>
	</section>
</div>
</body>
</html>