<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");

		$("#btnUpdate").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/board/update");
			formObj.attr("method", "post");
			formObj.submit();
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
	
	<nav>
		홈 - 글작성
	</nav>
	
	<section id="container">
		<form role="form" method="post">
		<input type="hidden" name="seq" value="${boardUpdate.seq}">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">제목</label><input type="text" id="title" name="title" value="${boardUpdate.title}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${boardUpdate.writer}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" id="passwd" name="passwd" value="${boardUpdate.passwd}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label><textarea cols="55" rows="8" id=content name="content">${boardUpdate.content}</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btnUpdate">작성</button>
							<button type="submit" id="btnBack">뒤로</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>