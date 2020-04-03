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
		var formObj = $("form[role='wrtForm']");

		$("#btnWrite").on("click", function(){
			if (valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/";
		});
	});

	function valiChk() {
		 var regForm = $("form[role='wrtForm'] .form-control").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
				alert($(".form-control").eq(i).attr("placeholder"));
				$(".form-control").eq(i).focus();
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
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<form role="wrtForm">
			<div class="form-group">
		    	<label for="title">제목</label>
		    	<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" id="reg_id" name="reg_id" placeholder="작성자를 입력해주세요.">
				</div>
				<div class="form-group col-md-6">
					<label for="passwd">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-row">
			    <div class="form-group col-md-3">
			    	<label for="tag">태그</label>
			    	<input type="text" class="form-control" id="tag" name="tag" placeholder="태그를 입력해주세요.">
			  	</div>
			    <div class="form-group col-md-3">
					<label for="cate_cd">카테고리</label>
					<select class="form-control" id="cate_cd" name="cate_cd">
						<option selected>Choose</option>
						<option value="Programming">Programming</option>
						<option value="DataBase">DataBase</option>
						<option value="Etc">Etc</option>
					</select>
				</div>
			</div>
		    <div class="form-group">
   			 	<label for="content">내용</label>
    			<textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력해주세요."></textarea>
  			</div>
		  <button type="button" class="btn btn-outline-primary" id="btnWrite">등록</button>
		  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>