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
		
		$("#btnModify").on("click", function(){
			var passwd = $("#passwd").val();
			var bno = "${boardView.bno}";
			var data = {"passwd":passwd, "bno":bno};
			if ( passwd != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/board/passChk",
					type: "post",
					dataType : "text",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						console.log(result);
						if (result=="true") {
							self.location="${pageContext.request.contextPath}/board/modify?bno=${boardView.bno}";
						} else {
							$("#message").html("비밀번호를 확인해주세요.");
						}
					}
				});
			} else {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
			}
		});

		$("#btnDelete").on("click", function(){
			var passwd = $("#passwd").val();
			var bno = ${boardView.bno};
			if (passwd != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/board/delete",
					type: "post",
					data: JSON.stringify(bno),
					contentType : "application/json; charset=utf-8",
					success: function() {
						self.location="${pageContext.request.contextPath}/board/list";
					}
				});
			} else {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
			}
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/list";
		});
	});		
</script>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<div id="message" style="color:red;"></div>
		<div class="form-group">
	    	<label for="title">제목</label>
	    	<input type="text" class="form-control" id="title" name="title" value="${boardView.title}" readonly="readonly">
	  	</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="reg_id">작성자</label>
				<input type="text" class="form-control" id="reg_id" name="reg_id" value="${boardView.reg_id}" readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="passwd">비밀번호</label>
				<input type="password" class="form-control" id="passwd" name="passwd">
			</div>
		</div>
		<div class="form-row">
		    <div class="form-group col-md-3">
		    	<label for="tag">태그</label>
		    	<input type="text" class="form-control" id="tag" name="tag" value="${boardView.tag}" readonly="readonly">
		  	</div>
		    <div class="form-group col-md-3">
		    	<label for="tag">카테고리</label>
		    	<input type="text" class="form-control" id="cate_cd" name="cate_cd" value="${boardView.cate_cd}" readonly="readonly">
		  	</div>
			<div class="form-group col-md-6">
				<label for="passwd">등록 날짜</label>
				<input type="text" class="form-control" id="reg_dt" name="reg_dt" value=<fmt:formatDate pattern="yyyy/MM/dd::HH:mm:SS" value="${boardView.reg_dt}" /> readonly="readonly">
			</div>
		</div>
	    <div class="form-group">
  			 	<label for="content">내용</label>
   			<textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력해주세요." readonly="readonly">${boardView.content}</textarea>
 			</div>
	  <button type="button" class="btn btn-outline-primary" id="btnModify">수정</button>
	  <button type="button" class="btn btn-outline-danger" id="btnDelete">삭제</button>
	  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
	</section>
</div>
</body>
</html>