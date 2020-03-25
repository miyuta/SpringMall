<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='modForm']");

		$("#btnModify").on("click", function(){
			if (valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/view?bno=${boardModify.bno}";
		});

		$("#btnList").on("click", function(){
			self.location="${pageContext.request.contextPath}/"
		});
	});

	function valiChk() {
		 var regForm = $("form[role='modForm'] .form-control").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
				alert($(".form-control").eq(i).attr("placeholder"));
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
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<form role="modForm">
		<input type="hidden" name="bno" value="${boardModify.bno}">
			<div class="form-group">
		    	<label for="title">제목</label>
		    	<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." value="${boardModify.title}">
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" id="reg_id" name="reg_id" placeholder="작성자를 입력해주세요." value="${boardModify.reg_id}">
				</div>
				<div class="form-group col-md-6">
					<label for="passwd">등록 날짜</label>
					<input type="text" class="form-control" value=<fmt:formatDate pattern="yyyy/MM/dd::HH:mm:ss" value="${boardModify.reg_dt}"/> readonly="readonly">
				</div>
			</div>
			<div class="form-row">
			    <div class="form-group col-md-3">
			    	<label for="tag">태그</label>
			    	<input type="text" class="form-control" id="tag" name="tag" placeholder="태그를 입력해주세요." value="${boardModify.tag}">
			  	</div>
			    <div class="form-group col-md-3">
					<label for="cate_cd">카테고리</label>
					<select class="form-control" id="cate_cd" name="cate_cd">
						<option selected>Choose</option>
						<option value="Programming" <c:out value="${boardModify.cate_cd == 'Programming' ? 'selected' : ''}"/>>Programming</option>
						<option value="DataBase" <c:out value="${boardModify.cate_cd == 'DataBase' ? 'selected' : ''}"/>>DataBase</option>
						<option value="Etc" <c:out value="${boardModify.cate_cd == 'Etc' ? 'selected' : ''}"/>>Etc</option>
					</select>
				</div>
			</div>
		    <div class="form-group">
   			 	<label for="content">내용</label>
    			<textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력해주세요.">${boardModify.title}</textarea>
  			</div>
		  <button type="button" class="btn btn-outline-primary" id="btnModify">등록</button>
		  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		  <button type="button" class="btn btn-outline-warning" id="btnList">목록</button>
		</form>
	</section>
</div>
</body>
</html>