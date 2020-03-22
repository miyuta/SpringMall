<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		listReply();

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

		$("#btnReply").on("click", function(){
			var recontent = $("#recontent").val();
			var bno = "${boardView.bno}";
			var param = "recontent="+recontent+"&bno="+bno;

			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/reply/write",
				data: param,
				success: function() {
					alert("댓글이 등록되었습니다.");
					listReply();
				}
			});
		});
	});

	function listReply(){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/reply/list?bno=${boardView.bno}",
			success: function(result) {
				$("#listReply").html(result);
			}
		});
	}
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
		
			<table class="table table-striped table table-bordered table table-hover">
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
								<button class="btn btn-outline-warning" type="button" id="btnUpdate">수정</button>
								<button class="btn btn-outline-danger" type="submit" id="btnDelete">삭제</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-info" type="button" id="btnLogin">로그인이 필요합니다.</button>
							</c:otherwise>
						</c:choose>
							<button class="btn btn-outline-success" type="button" id="btnBack">뒤로</button>
							<div>${messege}</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
		<div>
		<div class="form-group">
			<p>
				<label for="recontent">댓글</label>
				<textarea class="form-control" cols="60" rows="8" id="recontent" name="recontent"></textarea>
			</p>
		</div>
			<c:choose>
			<c:when test="${member != null}">
				<p>
					<button type="button" id="btnReply">작성</button>
				</p>
			</c:when>
			<c:otherwise>
				<p>
					<button type="button" class="btnLogin">로그인이 필요합니다.</button>
				</p>
			</c:otherwise>
			</c:choose>
		</div>
		
		<div id="listReply"></div>
	</section>
</div>
</body>
</html>