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
<script>
	$(function(){
		$("#btnReDelete").on("click", function(){
			var repno = $("#repno").val();
			var bno = $("#bno").val();
			var data = {"repno":repno, "bno":bno}
			$.ajax({
				url: "${pageContext.request.contextPath}/reply/delete",
				type: "post",
				data: JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success: function(){
					alert("댓글이 삭제되었습니다.");
					replyList();
				}
			});
		});
	});
</script>
<body>
	<table style="width:100px'">
		<c:forEach var="replyList" items="${replyList}">
		<input type="hidden" id="repno" value="${replyList.repno}">
		<input type="hidden" id="bno" value="${replyList.bno}">
			<tr>
				<td>작성자</td>
				<td>${replyList.rewriter}</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${replyList.regdate}"></fmt:formatDate></td>
				<td><button class="btn btn-outline-warning btn-sm" type="button" id="btnReModify">수정</button></td>
			</tr>
			<tr>
				<td colspan="3">${replyList.recontent}</td>
				<td><button class="btn btn-outline-danger btn-sm" type="button" id="btnReDelete">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>