<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		$("#btnUpdate").on("click", function(){
 			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/update");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			event.preventDefault();
			location.href="${pageContext.request.contextPath}/board/view?error=0&n=" + ${boardUpdate.bno};
		});
	});

 	function fn_valiChk() {
		var regForm = $("form[role='form1'] .check").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null) {
				alert($(".check").eq(i).attr("title"));
				$(".check").eq(i).focus();
				return true;
			}
		}
	}
</script>
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
		<input type="hidden" name="bno" value="${boardUpdate.bno}">
			<div class="form-group">
				<label class="control-label" for="title">제목</label>
				<input class="form-control" type="text" id="title" name="title" value="${boardUpdate.title}" class="check" title="제목을 입력해주세요.">
			</div>
			<div class="form-group">
				<label class="control-label" for="writer">작성자</label>
				<input class="form-control" type="text" id="writer" name="writer" value="${boardUpdate.writer}" class="check" title="작성자를 입력해주세요.">
			</div>
			<div class="form-group">
				<label class="control-label" for="passwd">비밀번호</label>
				<input class="form-control" type="password" id="passwd" name="passwd" value="${boardUpdate.passwd}" class="check" title="비밀번호를 입력해주세요.">
			</div>
			<div class="form-group">
				<label class="control-label" for="content">내용</label>
				<textarea class="form-control" cols="55" rows="8" id=content name="content" class="check" title="내용을 입력해주세요.">${boardUpdate.content}</textarea>
			</div>
				<button class="btn btn-outline-primary" type="submit" id="btnUpdate">작성</button>
				<button class="btn btn-outline-success" type="submit" id="btnBack">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>