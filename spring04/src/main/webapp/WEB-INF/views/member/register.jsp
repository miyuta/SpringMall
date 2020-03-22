<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		$("#btnRegister").on("click", function(){
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			var repasswd = $("#repasswd").val();
			var username = $("#username").val();
			var useremail =$("#useremail").val();
			if (userid == "") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
				return;
			}
			if (repasswd =="") {
				alert("비밀번호를 입력해주세요.")
				$("#repasswd").focus();
				return;
			}
			if (username == "") {
				alert("이름을 입력해주세요.");
				$("#username").focus();
				return;
			}
			if (useremail == "") {
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				return;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/member/register");
			formObj.attr("method", "POST");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/"
		});
	});
</script>

<body>
<div id=root>
	<header>
		<h1>회원 가입</h1>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<section id="container">
		<form role="form1" method="post">
			<div class="form-group">
				<label class="control-label" for="userid">아이디</label>
				<input class="form-control" type="text" id="userid" name="userid" placeholder="아이디을 입력해주세요.">
			</div>
				<div class="form-row">
				<div class="form-group col-md-6">
					<label class="control-label" for="passwd">비밀번호</label>
					<input class="form-control" type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-group col-md-6">	
					<label class="control-label" for="repasswd">비밀번호 확인</label>
					<input class="form-control" type="password" id="repasswd" name="repasswd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-group">		
				<label class="control-label" for="username">이름</label>
				<input class="form-control" type="text" id="username" name="username" placeholder="이름을 입력해주세요.">
			</div>
			<div class="form-group">
				<label class="control-label" for="useremail">이메일</label>
				<input class="form-control" type="email" id="useremail" name="useremail" placeholder="이메일을 입력해주세요.">
			</div>
				<button class="btn btn-outline-primary" type="button" id="btnRegister">회원가입</button>
				<button class="btn btn-outline-success" type="button" id="btnBack">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>