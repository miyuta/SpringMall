<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
<h2>Sign Up</h2>
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
					<input type="password" id="userPass" name="userpass" placeholder="비밀번호를 입력해주세요." requierd="required" />
				</div>
				
				<div class="input_area">
					<label for="userName">닉네임</label>
					<input type="text" id="userName" name="username" placeholder="닉네임을 입력해주세요." required="required" />
				</div>
				
				<div class="input_area">
					<label for="userPhone">전화 번호</label>
					<input type="text" id="userPhone" name="userphone" placeholder="연락처를 입력해주세요." required="required" />
				</div>
				
				<button type="submit" id="btnSignUp" name="btnSignUp">회원 가입</button>
				
			</form>
		</section>
		
	</div>
</section>
</body>
</html>