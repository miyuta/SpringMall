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
			var userid = "${boardView.userid}";
			var data  = {"passwd":passwd, "userid":userid};
			
			if ( passwd != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/member/passChk",
					type: "post",
					dataType : "text",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result=="true") {
							self.location="${pageContext.request.contextPath}/board/modify?userid=${memberView.userid}"
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
			var userid = "${memberView.userid}";
			if (passwd != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/member/delete",
					type: "post",
					data: JSON.stringify(userid),
					contentType : "application/json; charset=utf-8",
					success: function() {
						self.location="${pageContext.request.contextPath}/member/listPageSch?userid=${memberView.userid}"
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
			self.location="${pageContext.request.contextPath}/member/listPageSch?userid=${memberView.userid}"
																																			+"&atPage=${schVO.atPage}"
																																			+"&perPagePost=${schVO.perPagePost}"
																																			+"&option=${schVO.option}"
																																			+"&keyword=${schVO.keyword}";
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
		<div class="form-row">
			<div class="form-group col-md-6">
		    	<label for="userid">아이디</label>
		    	<input type="text" class="form-control" id="userid" name="userid" value="${memberView.userid}" readonly="readonly">
		  	</div>
	  	</div>
		<div class="form-row">
			<div class="form-group col-md-3">
				<label for="reg_id">비밀번호</label>
				<input type="password" class="form-control" id="passwd" name="passwd">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
		    	<label for="useremail">이메일</label>
		    	<input type="email" class="form-control" id="useremail" name="useremail" value="${memberView.useremail}" readonly="readonly">
		  	</div>
	  	</div>
		<h6>이름</h6>
		<div class="form-row">
			<div class="form-group col-md-2">
		    	<label for="familyname"></label>
		    	<input type="text" class="form-control" id="familyname" name="familyname" value="${memberView.familyname}" readonly="readonly">
		  	</div>
			<div class="form-group col-md-2">
		    	<label for="lastname"></label>
		    	<input type="text" class="form-control" id="lastname" name="lastname" value="${memberView.lastname}" readonly="readonly">
		  	</div>
	  	</div>
	  	<h6>전화번호</h6>
	  	<div class="form-row">
			<div class="form-group col-md-1">
				<label for="carrier"></label>
				<input class="form-control" id="carrier" name="carrier" value="${memberView.carrier}" readonly="readonly">
			</div>
			<div class="form-group col-md-1">
				<label for="fstnum"></label>
				<input type="text" class="form-control" id="fstnum" name="fstnum" value="${memberView.fstnum}" readonly="readonly">
			</div>
			<div class="form-group col-md-1">
				<label for="sndnum"></label>
				<input type="text" class="form-control" id="sndnum" name="sndnum" value="${memberView.sndnum}" readonly="readonly">
			</div>
			<div class="form-group col-md-1">
				<label for="thdnum"></label>
				<input type="text" class="form-control" id="thdnum" name="thdnum" value="${memberView.thdnum}" readonly="readonly">
			</div>
		</div>
		<h6>주소</h6>
		<div class="form-row">
			<div class="form-group col-md-2">
				<label for="useradd1"></label>
				<input class="form-control" id="useradd1" name="useradd1" value="${memberView.useraddr1}" readonly="readonly">
			</div>
		    <div class="form-group col-md-2">
		    	<label for="postnum"></label>
		    	<input type="text" class="form-control" id="postnum" name="postnum" value="${memberView.postnum}" readonly="readonly">
		  	</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-3">
				<label for="useradd2">시군구</label>
				<input type="text" class="form-control" id="useradd2" name="useradd2" value="${memberView.useraddr2}" readonly="readonly">
			</div>
			<div class="form-group col-md-3">
				<label for="useradd3">동읍면</label>
				<input type="text" class="form-control" id="useradd3" name="useradd3" value="${memberView.useraddr3}" readonly="readonly">
			</div>
		</div>
	  <button type="button" class="btn btn-outline-primary" id="btnModify">수정</button>
	  <button type="button" class="btn btn-outline-danger" id="btnDelete">삭제</button>
	  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
	</section>
</div>
</body>
</html>