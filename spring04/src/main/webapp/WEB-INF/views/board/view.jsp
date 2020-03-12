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
		var reFormObj = $("form[role='form2']");

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

		$("#btnLogin").on("click", function(){
			event.preventDefault();
			location.href="${pageContext.request.contextPath}/login/login";
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/criListSchPage?"
				+ "atPage=${scri.atPage}&perPagePost=${scri.perPagePost}"
				+ "&option=${scri.option}&keyword=${scri.keyword}";
		});

		$("#repSubmit").on("click", function(){
			reFormObj.attr("action", "${pageContext.request.contextPath}/reply/write");
			reFormObj.attr("method", "post");
			reFormObj.submit();
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
		<input type="hidden" name="bno" value="${boardView.bno}">
		<input type="hidden" id="atPage" name="atPage" value="${scri.atPage}">
		<input type="hidden" id="perPagePost" name="perPagePost" value="${scri.perPagePost}">
		<input type="hidden" id="option" name="option" value="${scri.option}">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		
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
						<c:choose>
							<c:when test="${member.userid == boardView.writer}">
								<button type="button" id="btnUpdate">수정</button>
								<button type="submit" id="btnDelete">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="btnLogin">로그인이 필요합니다.</button>
							</c:otherwise>
						</c:choose>
							<button type="button" id="btnBack">뒤로</button>
							<div>${messege}</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
		<div>
			<ol>
				<c:forEach items="${replyList}" var="repList">
					<li>
						<p>
							작성자 : ${repList.rewriter}<br />
							작성 날짜 : <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${repList.regdate}"/>
						</p>
						
						<p>${repList.recontent}</p>
					</li>
				</c:forEach>
			</ol>
			
			<section id="replyForm">
				<form role="form2" method="post">
					<input type="hidden" name="n" value="${boardView.bno}">
					
					<p><label for="rewriter">작성자</label><input type="text" id="rewriter" name="rewriter"></p>
					<p><label for="recontent">댓글</label><textarea id="recontent" name="recontent"></textarea></p>
					<p>
						<button type="button" id="repSubmit">작성</button>
					</p>
				</form>
			</section>
		</div>
	</section>
</div>
</body>
</html>