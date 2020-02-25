<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
<title>회원 리스트</title>
</head>
<script>
	function linkView (passChk){
		var passwd = $("#passwd").val();

		if (passwd == "") {
			alert("비밀번호를 입력해주세요.");
			$("#passwd").focus();
			event.preventDefault();
			return;
		}
		if (passwd != passChk ) {
			alert("비밀번호를 확인해주세요.");
			event.preventDefault();
			return;
		}
	}
</script>
<body>
<div id= "root">
	<header>
		<h1>회원 리스트</h1>
	</header>
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<form role="form1" method = "post" action="${pageContext.request.contextPath}/member/list">
			<label for="passwd">비밀번호 : </label><input type="password" name="passwd" id="passwd">
			<select name="option">
				<option value="list" <c:out value="${option == 'list' ? 'selected' : ''}" />>리스트</option>
				<option value="all" <c:out value="${option == 'all' ? 'selected' : ''}" />>아이디 + 이메일 + 권한</option>
				<option value="userid" <c:out value="${option == 'userid' ? 'selected' : ''}" />>아이디</option>
				<option value="username" <c:out value="${option == 'username' ? 'selected' : ''}" />>이름</option>
				<option value="useremail" <c:out value="${option == 'useremail' ? 'selected' : ''}" />>이메일</option>
				<option value="useraccess" <c:out value="${option == 'useraccess' ? 'selected' : ''}" />>권한</option>
			</select>
			<input type="text" name="keyword" value="${keyword}">
			<input type=submit value="조회">
			</form>
			
			<table>
			<tr>
				<th>번호</th><th>아이디</th><th>이름</th><th>이메일</th><th>등록일</th><th>권한</th>
			</tr>
			<c:forEach items="${memberList}" var="memlist">
			<c:set var="access" value="${memlist.useraccess}" />
				<tr align="center">
					<td>${memlist.rnum}</td>
					<td>${memlist.userid}</td>
					<td><a href="${pageContext.request.contextPath}/member/view?n=${memlist.rnum}&error=0" onclick="linkView(${memlist.passwd})">${memlist.username}</a></td>
					<td>${memlist.useremail}</td>
					<td><fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${memlist.reg_date}"/></td>
					<td>
					<c:choose>
						<c:when test="${access == 0}">관리자</c:when>
						<c:when test="${access == 1}">특별 회원</c:when>
						<c:when test="${access == 2}">일반 회원</c:when>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</table>
	</section>
</div>
</body>
</html>