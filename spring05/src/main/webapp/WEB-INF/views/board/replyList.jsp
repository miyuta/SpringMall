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
	<table style="width:700px">
		<c:forEach var="replyList" items="${replyList}">
			<tr>
				<td>작성자</td>
				<td>${replyList.rewiter}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${replyList.regdate}"></fmt:formatDate></td>
			</tr>
			<tr>
				<td colspan="3">${replyList.recontent}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>