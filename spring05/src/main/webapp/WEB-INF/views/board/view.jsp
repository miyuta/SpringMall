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
		var formObj = $("form[role='viewForm']");

		$("#btnModify").on("click", function(){
			var passwd = $("#passwd").val();
			
			if (passwd == "") {
				alert("Put in the password.");
				$("#passwd").focus();
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
			}
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/listSearch?"
				+"atPage=${scri.atPage}&perPagePost=${scri.perPagePost}"
				+"&seartType=${scri.searchType}&keyword=${scri.keyword}";
		});
	});
</script>
<body>

	<div id="root">
		<header>
			<h1>Board View</h1>
		</header>
	</div>

<hr />

	<nav>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</nav>

<hr />

	<section id="container">
		<div>${message}</div>	
		<form role="viewForm" method="post">
		<input type="hidden" name="seq" value="${boardView.seq}">
		<input type="hidden" id="atPage" name="atPage" value="${scri.atPage}" readonly="readonly">
		<input type="hidden" id="perPagePost" name="perPagePost" value="${scri.perPagePost}" readonly="readonly">
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly">
		
			<p>
				<label for="title">Title</label> ${boardView.title}
			</p>
			<p>
				<label for="title">Writer</label> ${boardView.writer}
				<label for="passwd">Password</label><input type="password" id="passwd" name="passwd">
			</p>
			<p>
				<label for="title">Content</label> ${boardView.content}
			</p>
			<p>
				<button type="button" id="btnModify">Modify</button>
				<button type="button" id="btnDelete">Delete</button>
				<button type="button" id="btnBack">Back</button>
			</p>
		</form>
		
	</section>
</body>
</html>