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
	$(document).ready(function(){
		var formObj = $("form[name='form1']");
		
		$("#btnWrite").	on("click", function(){
			location.href="${pageContext.request.contextPath}/board/write";
		});

		$("#btnSearch").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/board/listPage");
			formObj.attr("method", "post");
			formObj.submit();
		});

		var startPageNum = $("#btnPrev").val();
		$("#btnPrev").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/board/listPage");
			formObj.attr("method", "post");
			formObj.submit();
		});

		var endPageNum = $("#btnNext").val();
		$("btnNext").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/board/listPage");
			formObj.attr("method", "post");
			formObj.submit();
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
	<form name="form1" method="post">
		<select id="option" name="option">
			<option value="list" <c:out value="${option == 'list' ? 'selected' : ''}"/>>리스트</option>
			<option value="all" <c:out value="${option == 'all' ? 'selected' : ''}"/>>제목 + 작성자 + 내용</option>
			<option value="title" <c:out value="${option == 'title' ? 'selected' : ''}"/>>제목</option>
			<option value="writer" <c:out value="${option == 'writer' ? 'selected' : ''}"/>>작성자</option>
			<option value="content" <c:out value="${option == 'content' ? 'selected' : ''}"/>>내용</option>
		</select>
		<input id="keyword" type="text" name="keyword" value="${keyword}">
		<button type="button" id="btnSearch">조회</button>

		<c:if test="${member != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	
			<table>
			<c:forEach items="${boardList}" var="boardlist">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
				</tr>
				<tr>
					<td>${boardlist.bno}</td>
					<td><a href="${pageContext.request.contextPath}/board/view?n=${boardlist.bno}&error=0">${boardlist.title}</a></td>
					<td>${boardlist.writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardlist.regdate}"/></td>
					<td>${boardlist.cnt}</td>
				</tr>
			</c:forEach>
			</table>
			
			<c:if test="${pageMaker.prev}">
				<span>[ <a href="${pageContext.request.contextPath}/board/criListPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a> ]</span>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<a href="${pageContext.request.contextPath}/board/criListPage${pageMaker.makeQuery(idx)}">${idx}</a>

					
					<%-- <c:if test="${pageMaker.atPage == idx}">
						<b>${idx}</b>
					</c:if> --%>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<span>[ <a href="${pageContext.request.contextPath}/board/criListPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a> ]</span>
			</c:if>
			
			<%-- <div>
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