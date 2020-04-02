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
		var formObj = $("form[role='regForm']");

		$("#btnRegister").on("click", function(){
			if (valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/member/register");
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
		<form role="regForm">
			<div class="form-row">
				<div class="form-group col-md-6">
			    	<label for="title">아이디</label>
			    	<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
			  	</div>
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="reg_id">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="passwd">비밀번호 확인</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<h6>이름</h6>
			<div class="form-row">
				<div class="form-group col-md-2">
			    	<label for="familyname"></label>
			    	<input type="text" class="form-control" id="familyname" name="familyname" placeholder="성을 입력해주세요.">
			  	</div>
				<div class="form-group col-md-2">
			    	<label for="lastname"></label>
			    	<input type="text" class="form-control" id="lastname" name="lastname" placeholder="이름을 입력해주세요.">
			  	</div>
		  	</div>
		  	<h6>전화번호</h6>
		  	<div class="form-row">
				<div class="form-group col-md-1">
					<label for="carrier"></label>
					<select class="form-control" id="carrier" name="carrier">
						<option>SKT</option>
						<option>KT</option>
						<option>LGU</option>
						<option>ETC</option>
					</select>
				</div>
				<div class="form-group col-md-1">
					<label for="FstNum"></label>
					<input type="text" class="form-control" id="FstNum" name="FstNum">
				</div>
				<div class="form-group col-md-1">
					<label for="SndNum"></label>
					<input type="text" class="form-control" id="SndNum" name="SndNum">
				</div>
				<div class="form-group col-md-1">
					<label for="ThdNum"></label>
					<input type="text" class="form-control" id="ThdNum" name="ThdNum">
				</div>
			</div>
			<h6>주소</h6>
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="state"></label>
					<select class="form-control" id="state" name="state">
						<option value="null" selected>지역</option>
						<option value="1">서울</option>
						<option value="2">경기도</option>
						<option value="3">인천광역시</option>
					</select>
				</div>
			    <div class="form-group col-md-2">
			    	<label for="postNum"></label>
			    	<input type="text" class="form-control" id="postNum" name="postNum" placeholder="우편번호를 입력해주세요.">
			  	</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="city">시군구</label>
					<input type="text" class="form-control" id="city" name="city" placeholder="시군구를 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="road">동읍면</label>
					<input type="text" class="form-control" id="road" name="road" placeholder="동읍면을 입력해주세요.">
				</div>
			</div>
		  <button type="button" class="btn btn-outline-primary" id="btnRegister">등록</button>
		  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>