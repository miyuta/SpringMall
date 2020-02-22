<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		$("#btnModify").on("click", function(){
			var username = $("#username").val();
			var passwd = $("#passwd").val();
			var useremail = $("#useremail").val();
			if (username == "") {
				alert("이름을 입력해주세요.");
				$("#username").focus();
				event.preventDefault();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
				event.preventDefault();
				return;
			}
			if (useremail == "") {
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				event.preventDefault();
				return;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/member/modify");
			formObj.attr("method", "POST");
			formObj.submit();
		});
	});
</script>

<body>
<div id=root>
	<header>
		<h1>회원 가입</h1><div style = "color: red;">${message}</div>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<section id="container">
		<form role="form1" method="post">
		<input type="hidden" name="userid" value="${memberModify.userid}">
		<input type="hidden" name="rnum" value="${memberModify.rnum}">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="userid">아이디</label>${memberModify.userid}
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" id="passwd" name="passwd">
						</td>
					</tr>
					<tr>
						<td>
							<label for="username">이름</label><input type="text" id="username" name="username" value="${memberModify.username}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="useremail">이메일</label><input type="email" id="useremail" name="useremail" value="${memberModify.useremail}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="userphone">전화번호</label><input type="text" id="userphone" name="userephone" value="${memberModify.userphone}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="useraddr1">주소1</label><input type="text" id="useraddr1" name="useraddr1" value="${memberModify.useraddr1}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="useraddr2">주소2</label><input type="text" id="useraddr2" name="useraddr2" value="${memberModify.useraddr2}">
						</td>
					</tr>
					<tr>
						<td>
							<label for="useraddr3">주소3</label><input type="text" id="useraddr3" name="useraddr3" value="${memberModify.useraddr3}">
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btnModify">확인</button>
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