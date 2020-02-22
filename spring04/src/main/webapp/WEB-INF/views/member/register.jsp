<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
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
				event.preventDefault();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
				event.preventDefault();
				return;
			}
			if (repasswd =="") {
				alert("비밀번호를 입력해주세요.")
				$("#repasswd").focus();
				event.preventDefault();
				return;
			}
			if (username == "") {
				alert("이름을 입력해주세요.");
				$("#username").focus();
				event.preventDefault();
				return;
			}
			if (useremail == "") {
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				event.preventDefault();
				return;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/member/register");
			formObj.attr("method", "POST");
			formObj.submit();
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
			<table>
				<tbody>
					<tr>
						<td>
							<label for="userid">아이디</label><input type="text" id="userid" name="userid" title="아이디을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" id="passwd" name="passwd" title="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="repasswd">비밀번호 확인</label><input type="password" id="repasswd" name="repasswd" title="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="username">이름</label><input type="text" id="username" name="username" title="이름을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="useremail">이메일</label><input type="email" id="useremail" name="useremail" title="이메일을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btnRegister">회원가입</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>