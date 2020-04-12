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
		var passwd = $("#passwd").val();
		var repasswd = $("#repasswd").val();
		
		$("#btnRegister").on("click", function(){
			if (valiChk()) {
				return false;
			} else {
				if ($("#btnIdDubChk").val() == "N") {
					alert("중복 확인 버튼을 눌러주세요.");
				} else {
					if (passwd == repasswd) {
						formObj.attr("action", "${pageContext.request.contextPath}/member/register");
						formObj.attr("method", "post");
						formObj.submit();
					} else {
						alert("비밀번호를 확인해주세요.");
						return;
					}
				}
			}
		});

		$("#btnIdDubChk").on("click", function(){
			var userid = $("#userid").val();
			if (userid == null || userid =="") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
			} else {
				$.ajax({
					url: "${pageContext.request.contextPath}/member/idDubChk",
					type: "post",
					data: userid,
					contentType : "application/json; charset=utf-8",
					success: function(result) {
						if (result != 0) {
							alert("중복된 아이디입니다.");
							$("#userid").focus();
						} else {
							$("#btnIdDubChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				});
			}
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/";
		});
	});

	function valiChk() {
		var regForm = $("form[role='regForm'] .form-control").length;
		for (var i = 0; i < 5; i++) {
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
		<form role="regForm">
			<div class="form-row">
				<div class="form-group col-md-6">
			    	<label for="userid">아이디</label> <button class="btn btn-secondary btn-sm" type="button" id="btnIdDubChk" value="N">중복확인</button>
			    	<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
			  	</div>
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="reg_id">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="repasswd">비밀번호 확인</label>
					<input type="password" class="form-control" id="repasswd" name="repasswd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
			    	<label for="useremail">이메일</label>
			    	<input type="email" class="form-control" id="useremail" name="useremail" placeholder="이메일을 입력해주세요.">
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
				<div class="form-group col-md-2">
					<label for="carrier"></label>
					<select class="form-control" id="carrier" name="carrier">
						<option value="" selected>Choose</option>
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
						<option value="LGU">LGU</option>
						<option value="ETC">ETC</option>
					</select>
				</div>
				<div class="form-group col-md-1">
					<label for="fstnum"></label>
					<input type="text" class="form-control" id="fstnum" name="fstnum">
				</div>
				<div class="form-group col-md-1">
					<label for="sndnum"></label>
					<input type="text" class="form-control" id="sndnum" name="sndnum">
				</div>
				<div class="form-group col-md-1">
					<label for="thdnum"></label>
					<input type="text" class="form-control" id="thdnum" name="thdnum">
				</div>
			</div>
			<h6>주소</h6>
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="useraddr1"></label>
					<select class="form-control" id="useraddr1" name="useraddr1">
						<option value="" selected>지역</option>
						<option value="1">서울</option>
						<option value="2">경기도</option>
						<option value="3">인천광역시</option>
					</select>
				</div>
			    <div class="form-group col-md-2">
			    	<label for="postnum"></label>
			    	<input type="text" class="form-control" id="postnum" name="postnum" placeholder="우편번호를 입력해주세요.">
			  	</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="useraddr2"></label>
					<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="시군구동읍면을 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="useraddr3"></label>
					<input type="text" class="form-control" id="useraddr3" name="useraddr3" placeholder="나머지 주소를 입력해주세요.">
				</div>
			</div>
		  <button type="button" class="btn btn-outline-primary" id="btnRegister">등록</button>
		  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		</form>
	</section>
</div>
</body>
</html>