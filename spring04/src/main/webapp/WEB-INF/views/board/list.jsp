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
	
	<nav>
		홈 - 글작성
	</nav>
	<hr />
	
	<section id="container">
		<form role="form" method="post" action="${pageContext.request.contextPath}/board/write">
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
			<button type="submit">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>