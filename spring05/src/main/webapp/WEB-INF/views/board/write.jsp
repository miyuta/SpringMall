<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<div id="root">
	<header>
		<h1>게시판 쓰기</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		
		<form class="form-row" role="wrtForm" method="post" action="${pageContext.request.contextPath}/board/write">
			<div class="form-group col-md-12">
				<label for="title">제목</label>
				<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
			</div>
			<div class="form-group col-md-6">
				<label for="writer">작성자</label>
				<input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력해주세요.">
			</div>
			<div class="form-group col-md-6">
				<label for="passwd">비밀번호</label>
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="form-group col-md-12">
				<label for="content">내용</label>
				<textarea cols="55" rows="8" class="form-control" id="content" name="content" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<button type="submit" id="btnWrite" class="btn btn-primary">작성</button>
		</form>
		
		<button type="button" id="btnBack" class="btn btn-success">뒤로</button>
		
	</section>
</div>
</body>
</html>