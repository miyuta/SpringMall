<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
</head>
<body>
<h2>Sign In</h2>
<section id="container">
	<div id="container_box">
		
		<section id="content">
			<form role="form" method="post" autocomplete="off">
				<div class="input_area">
					<label for="userId">아이디</label>
					<input type="email" id="userId" name="userid" placeholder="example@email.com" required="required" />
				</div>
				
				<div class="input_area">
					<label for="userPass">비밀 번호</label>
					<input type="password" id="userPass" name="userpass" placeholder="비밀번호를 입력해주세요." required="required" />
				</div>
				
				<button type="submit" id="btnSignUp" name="btnSignUp">로그인</button>
				
				<c:if test="${msg == false }">
					<p style = "color:#f00;">로그인에 실패했습니다.</p>
				</c:if>
				
			</form>
		</section>
		
	</div>
</section>
</body>
</html>