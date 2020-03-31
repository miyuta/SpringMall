<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function(){

		$("#btnReWrite").on("click", function(){
			var repno = "${replyView.repno}";
			var bno = "${replyView.bno}";
			var recontent = $("textarea[name=recontent]").text();
			var data = {"repno":repno, "bno":bno, "recontent":recontent}
			console.log(data);

			$.ajax({
				url: "${pageContext.request.contextPath}/reply/modify",
				type: "post",
				data: JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success: function() {
					alert("댓글이 수정되었습니다.");
					replyList();
				}
			});
		});
		
		$("#btnReCancel").on("click", function(){
			var bno = $("#bno").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/board/view?bno=" + bno,
				type: "get",
				success: function(result){
					replyList();
				}
			});
		});
	});
</script>
<body>
<div id="replyModify">
	<input type="hidden" id="repno" value="${replyView.repno}">
	<input type="hidden" id="bno" value="${replyView.bno}">
	<div class="row">
		 <div class="col-md-8">
			작성자 ${replyView.rewriter}
			<fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${replyView.regdate}"></fmt:formatDate>
		</div>
	</div>	
	<div class="row">
		<div class="col-md-8">
			<textarea class="form-control" name="recontent" cols="160" rows="2"></textarea>
		</div>
		<div class="col-md-2">
			<button class="btn btn-outline-warning btn-sm" type="button" id="btnReWrite">작성</button>
			<button class="btn btn-outline-danger btn-sm" type="button" id="btnReCancel">취소</button>
		</div>
	</div>	
</div>
</body>
</html>