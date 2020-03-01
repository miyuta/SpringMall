<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Board</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='modForm']");

		$("#btnModify").on("click", function(){
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});

	function fn_valiChk() {
		var regForm = $("form[role='modForm'] .check").length;
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

	<div id="root">
		<header>
			<h1>Board Modify</h1>
		</header>
	</div>

<hr />

	<nav>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</nav>

<hr />

	<section id="container">
		<div>${message}</div>	
		<form role="'modForm" method="post" action="${pageContext.request.contextPath}/board/modify">
		<input type="hidden" name="seq" value="${boardModify.seq}">
			<p>
				<label for="title">Title</label><input type="text" id="title" name="title" class="title" title="Put in the title" value="${boardModify.title}">
			</p>
			<p>
				<label for="title">Writer</label><input type="text" id="writer" name="writer" class="writer" title="Put in the writer" value="${boardModify.writer}">
				<label for="passwd">Password</label><input type="password" id="passwd" class="passwd" title="Put in the password" name="passwd">
			</p>
			<p>
				<label for="title">Content</label><textarea id="content" class="content" name="content" title="Put in the content">${boardModify.content}</textarea>
			</p>
			<p>
				<button type="button" id="btnModify">Submit</button>
				<button type="button" id="btnBack">Back</button>
			</p>
		</form>
	
	</section>
</body>
</html>