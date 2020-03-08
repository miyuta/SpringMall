<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<script>
	$(document).ready(function(){
		var viewFormObj = $("form[role='viewForm']");

		$("#btnModify").on("click", function(){
			var passwd = $("#passwd").val();
			if (passwd == "" || passwd == null) {
				alert("PutIn the Password.");
				$("#passwd").focus();
				return;
			}
			viewFormObj.attr("action", "${pageContext.request.contextPath}/board/view");
			viewFormObj.attr("method", "post");
			viewFormObj.submit();
		});

		$("#btnDelete").on("click", function(){
			if (confirm("Are you sure you wnat to delete?")){
				viewFormObj.attr("action", "${pageContext.request.contextPath}/board/delete");
				viewFormObj.attr("method", "post");
				viewFormObj.submit();
			}
		});

		$("#btnBack").on("click", function(){
			location.href="${pageContext.request.contextPath}/board/list";
		});
	});
</script>
<body>
<div id="root">
	<header>
		<h1>Board Write</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="/WEB-INF/views/include/aside.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		
		
			<div class="form-group col-md-12">
				<label for="title">Title</label>
				TITLE : ${boardView.title}
			</div>
			<div class="form-group col-md-12">
				<label for="writer">Writer</label>
				WRITER : ${boardView.writer}
			</div>
			<form class="form-row" role="viewForm">
			<input type="hidden" name="bno" value="${boardView.bno}">
			<div class="form-group col-md-6">
				<label for="passwd">Password</label>
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="PutIn Password."> <span style="color:red;">${message}</span>
			</div>
			</form>
			<div class="form-group col-md-12">
				<label for="content">Content</label>
				<textarea cols="55" rows="8" class="form-control" readonly="readonly">${boardView.content}</textarea>
			</div>
		<button type="button" id="btnModify" class="btn btn-primary">Modify</button>
		<button type="button" id="btnDelete" class="btn btn-danger">Delete</button>
		<button type="button" id="btnBack" class="btn btn-success">Back</button>
		
	</section>
</div>
</body>
</html>