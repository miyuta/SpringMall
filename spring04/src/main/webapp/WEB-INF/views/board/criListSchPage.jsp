<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<script>
	$(document).ready(function(){
		
		$("#btnWrite").	on("click", function(){
			location.href="${pageContext.request.contextPath}/board/write";
		});

		$("#btnSearch").on("click", function(){
			self.location="criListSchPage"
				+ '${pageMaker.makeQuery(1)}'
				+ "&option="
				+ $("select option:selected").val()
				+ "&keyword="
				+ encodeURIComponent($('#keyword').val());
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
		<select id="option" name="option">
			<option value="list" <c:out value="${scri.option == null ? 'selected' : ''}"/>>리스트</option>
			<option value="all" <c:out value="${scri.option == 'all' ? 'selected' : ''}"/>>제목 + 작성자 + 내용</option>
			<option value="title" <c:out value="${scri.option == 'title' ? 'selected' : ''}"/>>제목</option>
			<option value="writer" <c:out value="${scri.option == 'writer' ? 'selected' : ''}"/>>작성자</option>
			<option value="content" <c:out value="${scri.option == 'content' ? 'selected' : ''}"/>>내용</option>
		</select>
		<input id="keyword" type="text" name="keyword" value="${scri.keyword}">
		<button type="button" id="btnSearch">조회</button>

		<c:if test="${member != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
			<table class="table table-striped table table-bordered table table-hover">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
				</tr>
				<c:forEach items="${boardSchList}" var="boardSchList">
				<tr>
					<td>${boardSchList.bno}</td>
					<td><a href="${pageContext.request.contextPath}/board/view?bno=${boardSchList.bno}&
																																	atPage=${scri.atPage}&
																																	perPagePost=${scri.perPagePost}&
																																	option=${scri.option}&
																																	keyword=${scri.keyword}&
																																	error=0">${boardSchList.title} [${boardSchList.repno}]</a></td>
					<td>${boardSchList.writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardSchList.regdate}"/></td>
					<td>${boardSchList.cnt}</td>
				</tr>
			</c:forEach>
			</table>
			
			<c:if test="${pageMaker.prev}">
				<span>[ <a href="${pageContext.request.contextPath}/board/criListSchPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a> ]</span>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<span>
					<c:if test="${pageMaker.cri.atPage != idx}">
						<a href="${pageContext.request.contextPath}/board/criListSchPage${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:if>
					
					<c:if test="${pageMaker.cri.atPage == idx}">
						<b>${idx}</b>
					</c:if>
				</span>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<span>[ <a href="${pageContext.request.contextPath}/board/criListSchPage${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a> ]</span>
			</c:if>
			
			<%-- <div>
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