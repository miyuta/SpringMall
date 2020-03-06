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
		var modFormObj = $("form[role='modForm']");

		$("#btnModify").on("click", function(){
			if (fn_valiChk()) {
				return false;
			}
			modFormObj.attr("action", "${pageContext.request.contextPath}/board/modify");
			modFormObj.attr("method", "post");
			modFormObj.submit();
		});
	});

	function fn_valiChk() {
		var regForm = $("form[role='modForm'] .form-control").length;

		for (var i = 0; i < regForm; i++ ) {
			if ($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
				alert($(".form-control").eq(i).attr("title"));
				$(".form-control").eq(i).focus();
				return true;
			}
		}
	}
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
		
		<form class="form-row" role="modForm">
		<input type="hidden" name="bno" value="${boardModify.bno}">
			<div class="form-group col-md-12">
				<label for="title">Title</label>
				<input type="text" class="form-control" id="title" name="title" value="${boardModify.title}" placeholder="PutIn the Title" title="PutIn the Title.">
			</div>
			<div class="form-group col-md-6">
				<label for="writer">Writer</label>
				<input type="text" class="form-control" id="writer" name="writer" value="${boardModify.writer}" placeholder="PutIn the Writer" title="PutIn the Writer.">
			</div>
			<div class="form-group col-md-6">
				<label for="passwd">Password</label>
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="PutIn the Password."  title="PutIn the Password.">
			</div>
			<div class="form-group col-md-12">
				<label for="content">Content</label>
				<textarea cols="55" rows="8" class="form-control" id="content" name="content" placeholder="PutIn the Content" title="PutIn the Content.">${boardModify.content}</textarea>
			</div>			
		</form>
		<button type="button" id="btnModify" class="btn btn-primary">Modify</button>
		<button type="button" id="btnBack" class="btn btn-success">Back</button>
		
	</section>
</div>
</body>
</html>