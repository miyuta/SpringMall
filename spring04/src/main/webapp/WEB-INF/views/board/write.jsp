<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/jquery/jquery-3.4.1.min.js"></script>
	<title>Insert title here</title>
	</head>
	
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form1']");

		$("#btnWrite").on("click", function(){
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
	
	function fn_valiChk() {
		var regForm = $("form[role='form1'] .check").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null) {
				alert($(".check").eq(i).attr("title"));
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
	<hr />
	
	<div>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</div>
	<hr />
	
	<section id="container">
		<form role="form1" method="post">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">제목</label><input type="text" name="title" class="check" title="제목을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="writer">작성자</label><input type="text" name="writer" class="check" title="작성자를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="passwd">비밀번호</label><input type="password" name="passwd" class="check" title="비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label><textarea cols="55" rows="8" name="content" class="check" title="내용을 입력해주세요."></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btnWrite">작성</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>
</body>
</html>