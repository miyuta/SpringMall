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
		var fileNum = 0;

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

/* 		$("#btnFileAdd").on("click", function(){
			var fileAdd = '<div><div class="custom-file"><label class="custom-file-label" for="customFile">Choose file(복수 파일 업로드)</label>'
								  +'<input multiple="multiple" type="file" id="customFile" class="file' + (++fileNum) + '" name="file' + (fileNum) + '"></div>'
								  +'<button type="button" name="btnFileDel" class="btn btn-outline-danger btn-sm">파일 제거</button></div>';
			$("#fileDiv").append(fileAdd);
			$("button[name='btnFileDel']").on("click", function(){
				$(this).parent().remove();
			});
		}); */
		$("#btnFileAdd").on("click", function(){
			var fileAdd = '<div><div><label class="custom-file-label" for="customFile">Choose file(복수 파일 업로드)</label>'
								  +'<input multiple="multiple" type="file" id="customFile" class="file' + (++fileNum) + '" name="file' + (fileNum) + '"></div>'
								  +'<button type="button" name="btnFileDel" class="btn btn-outline-danger btn-sm">파일 제거</button></div><hr />';
			$("#fileDiv").append(fileAdd);
			$("button[name='btnFileDel']").on("click", function(){
				$(this).parent().remove();
			});
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
		<form role="wrtForm" enctype="multipart/form-data">
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
    			<textarea class="form-control" id="content" name="content" rows="18" placeholder="내용을 입력해주세요."></textarea>
  			</div>
			<div class="custom-file">
				<label class="custom-file-label" for="customFile">Choose file(단일 파일 업로드)</label>
				<input type="file" class="custom-file-input" id="customFile" name="file">
			</div>
			<hr />
			
			<div id="fileDiv"></div>
			<hr />
			<input type="button" id="btnFileAdd" class="btn btn-outline-secondary btn-sm" value="파일 추가">
			<hr />
			
			<!-- <div class="custom-file">
				<label class="custom-file-label" for="customFile">Choose file(복수 파일 업로드)</label>
				<input multiple="multiple" type="file" class="custom-file-input" id="customFile" name="file">
			</div> -->
			
		    <button type="button" class="btn btn-outline-primary" id="btnWrite">등록</button>
		    <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		</form>
		</section>
</div>
</body>
</html>