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
function btnReModify(repno, bno) {
	if(confirm("수정하시겠습니까?")) {
		var data = {"repno": repno, "bno":bno}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/reply/view",
			type: "get",
			data: data,
			success: function(result){
				$("#rootReply"+repno).replaceWith(result);
			}
		});
	};
};

function btnReDelete(repno, bno) {
	if (confirm("삭제하시겠습니까?")){
		var data = {"repno":repno, "bno":bno}

		$.ajax({
			url: "${pageContext.request.contextPath}/reply/delete",
			type: "post",
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success: function(){
				replyList();
			}
		});
	};
};
</script>
<body>
<c:forEach var="replyList" items="${replyList}">
	<div id="rootReply${replyList.repno}">
		<input type="hidden" id="repno" value="${replyList.repno}">
		<input type="hidden" id="bno" value="${replyList.bno}">
		<div class="row">
			<div class="col-md-8">
				작성자 ${replyList.rewriter}
				<fmt:formatDate pattern="yyyy/MM/dd HH:mm:SS" value="${replyList.regdate}"></fmt:formatDate>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8" style="word-break:break-all">
				${replyList.recontent}
			</div>
			<div class="col-md-2">
				<button class="btn btn-outline-warning btn-sm" type="button" onclick="btnReModify(${replyList.repno}, ${replyList.bno})">수정</button>
				<button class="btn btn-outline-danger btn-sm" type="button" onclick="btnReDelete(${replyList.repno}, ${replyList.bno})">삭제</button>
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>