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
		var formObj = $("form[role='schForm']");

		replyList();
		
		$("#btnModify").on("click", function(){
			var passwd = $("#passwd").val();
			var passBno = "${boardView.bno}";
			var data  = {"passwd":passwd, "bno":passBno};
			if ( passwd != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/board/passChk",
					type: "post",
					dataType : "text",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result =="true") {
							self.location="${pageContext.request.contextPath}/board/modify?bno=${boardView.bno}"
																																			+"&atPage=${schVO.atPage}"
																																			+"&perPagePost=${schVO.perPagePost}"
																																			+"&option=${schVO.option}"
																																			+"&keyword=${schVO.keyword}"
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
						self.location="${pageContext.request.contextPath}/board/listPageSch?bno=${boardView.bno}"
																																				+"&atPage=${schVO.atPage}"
																																				+"&perPagePost=${schVO.perPagePost}"
																																				+"&option=${schVO.option}"
																																				+"&keyword=${schVO.keyword}";
					}
				});
			} else {
				alert("비밀번호를 입력해주세요.");
				$("#passwd").focus();
			}
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/listPageSch?bno=${boardView.bno}"
									+"&atPage=${schVO.atPage}"
									+"&perPagePost=${schVO.perPagePost}"
									+"&option=${schVO.option}"
									+"&keyword=${schVO.keyword}";
		});

		$("#btnReply").on("click", function(){
			var bno = "${boardView.bno}";
			var rewriter = "${boardView.reg_id}";
			var recontent = $("#recontent").val();
			var data = {"bno":bno, "rewriter":rewriter, "recontent":recontent}
			if (recontent != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/reply/write",
					type:"post",
					data: JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success: function() {
						alert("댓글이 등록되었습니다.");
						$("#recontent").val("");
						replyList();
					}
				});
			} else {
			alert("댓글을 입력해주세요.");
			}
		});
	});

	function replyList() {
		$.ajax({
			url: "${pageContext.request.contextPath}/reply/list?bno=${boardView.bno}",
			type: "get",
			success: function(result) {
				$("#replyList").html(result);
			}
		});
	}
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
			<div class="form-group col-md-4">
				<label for="passwd">비밀번호</label>
				<input type="password" class="form-control" id="passwd" name="passwd">
			</div>
			<div class="form-group col-md-2">
				<label for="view_cnt">조회수</label>
				<input type="text" class="form-control" id="view_cnt" name="view_cnt" value="${boardView.view_cnt}" readonly="readonly">
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
   			<textarea class="form-control" id="content" name="content" rows="18" placeholder="내용을 입력해주세요." readonly="readonly">${boardView.content}</textarea>
 		</div>
 		<hr />
 		
 		<span>파일 목록</span>
 		<div class="form-group" style="border:1px solid #dbdbdb;">
 			<c:forEach var="fileList" items="${fileList}">
 				<button type="button" class="btn btn-link">${fileList.ORINAME}</button>(${fileList.FSIZE} ${fileList.VOLUME})
 			</c:forEach>
 		</div>
		
		<div>
			<button type="button" class="btn btn-outline-primary" id="btnModify">수정</button>
		 	<button type="button" class="btn btn-outline-danger" id="btnDelete">삭제</button>
		 	<button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		</div>
	  <form role="schForm">
	  	<input class="search" type="hidden" id="atPage" value="${schVO.atPage}">
	  	<input class="search" type="hidden" id="perPagePost" value="${schVO.perPagePost}">
	  	<input class="search" type="hidden" id="option" value="${schVO.option}">
	  	<input class="search" type="hidden" id="keyword" value="${schVO.keyword}">
	  </form>
	  
	  		
		<!-- 댓글 -->
		<div class="form-group col-md-5">
			<label for="recontent">댓글</label>
			<textarea class="form-control" cols="160" rows="2" id="recontent" name="recontent"></textarea>
		</div>
		<div>
			<button class="btn btn-outline-primary" type="button" id="btnReply">작성</button>
		</div>
		<hr />
		
		<div id="replyList"></div>

	</section>
</div>
</body>
</html>