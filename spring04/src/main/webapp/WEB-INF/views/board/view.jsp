<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		$("#btnUpdate").on("click", function(){
			var passwd = $("#passwd").val();
			if(passwd == ""){
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
				event.preventDefault();
				return;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/view");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnDelete").on("click", function(){
			if (confirm("삭제하시겠습니까?")) {
				formObj.attr("action", "${pageContext.request.contextPath}/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			} else {
				formObj.attr("action", "${pageContext.request.contextPath}/board/view");
				formObj.attr("method", "post");
			}
		});

		$("#btnBack").on("click", function(){
			event.preventDefault();
			location.href="${pageContext.request.contextPath}/board/list";
		});
	});
</script>
</head>
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
		<form role="form1" method="post">
		<input type="hidden" name="seq" value="${boardView.seq}">
			<table border="1">
				<tbody>
					<tr>
						<td><label for="title">제목</label></td>
						<td>${boardView.title}</td>
						<td><label for="regdate">등록일</label>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardView.regdate}" /></td>
					</tr>
					<tr>
						<td><label for="writer">작성자</label></td>
						<td>${boardView.writer}</td>
						<td><label for="passwd">비밀번호</label></td>
						<td><input type="password" name="passwd" id="passwd"></td>
					</tr>
					<tr>
						<td colspan="4"><label for="content">내용</label></td>
					</tr>
					<tr>
						<td colspan="4">${boardView.content}</td>
					</tr>
					<tr>
						<td colspan="4">
							<button type="submit" id="btnUpdate">수정</button>
							<button type="submit" id="btnDelete">삭제</button>
							<button type="submit" id="btnBack">뒤로</button>
							<div>${messege}</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>