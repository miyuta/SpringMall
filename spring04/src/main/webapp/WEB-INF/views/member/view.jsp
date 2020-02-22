<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
<title>회원 상세</title>
</head>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");
		
		$("#btnModify").on("click", function(){
			formObj.attr("action", "${pageContext.request.contextPath}/member/modify");
			formObj.attr("method", "POST");
			formObj.submit();
		});
		
		$("#btnDelete").on("click", function(){
			var passwd = $("#passwd").val();
			
			if (passwd = "") {
				alert("비밀번호를 입력해주세요");
				$("#passwd").focus();
				event.preventDefault();
				return;
			}
			if (confirm("삭제하시겠습니까?")) {
				formObj.attr("action", "${pageContext.request.contextPath}/member/delete");
				formObj.attr("method", "POST");
				formObj.submit();
			}
			event.preventDefault();
		});
	});
</script>

<body>
<div id=root>
	<header>
		<h1>회원 가입</h1><div style="color:red;">${message}</div>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<section id="container">
		<form role="form1" method = "post">
		<input type="hidden" name="rnum" value="${memberView.rnum}">
		<input type="hidden" name="userid" value="${memberView.userid}">
		<input type="hidden" name="error" value=0>
			<table border="1">
				<tr>
					<td>아이디</td><td>${memberView.userid}</td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" name="passwd" id="passwd"><button type="submit" id="btnDelete">삭제</button></td>
				</tr>
				<tr>
					<td>이름</td><td>${memberView.username}</td>
				</tr>
				<tr>
					<td>이메일</td><td>${memberView.useremail}</td>
				</tr>
				<tr>
					<td>주소</td><td>${memberView.useraddr1} ${memberView.useraddr2} ${memberView.useraddr3}</td>
				</tr>
				<tr>
					<td>등록일</td><td><fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${memberView.reg_date}"/></td>
				</tr>
				<tr>
					<td>변경일</td><td><fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${memberView.up_date}"/></td>
				</tr>
				<tr>
				<c:set var="access" value="${memberView.useraccess}" />
					<td>권한</td>
					<td>
					<c:choose>
						<c:when test="${access == 0}">관리자</c:when>
						<c:when test="${access == 1}">특별 회원</c:when>
						<c:when test="${access == 2}">일반 회원</c:when>
					</c:choose>
					</td>
				</tr>
				<tr align="center">
					<td colspan = "2">
						<button type="submit" id="btnModify">수정</button>
						<button type="submit" id="btnBack">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
</div>
</body>
</html>