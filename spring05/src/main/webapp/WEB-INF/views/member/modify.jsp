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
			var formObj = $("form[role='modForm']");

			if (valiChk()){
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/member/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/member/view?userid=${memberModify.userid}";
																																		+"&atPage=${schVO.atPage}"
																																		+"&perPagePost=${schVO.perPagePost}"
																																		+"&option=${schVO.option}"
																																		+"&keyword=${schVO.keyword}";
		});
	});

	function valiChk(){
		var regForm = $("form[role='modForm'] .form-control").length;
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
	<form role="modForm">
			<div class="form-row">
				<div class="form-group col-md-6">
			    	<label for="userid">아이디</label>
			    	<input type="text" class="form-control" id="userid" name="userid" value="${memberModify.userid}" readonly="readonly">
			  	</div>
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="reg_id">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
			    	<label for="useremail">이메일</label>
			    	<input type="email" class="form-control" id="useremail" name="useremail" value="${memberModify.useremail}" placeholder="이메일을 입력해주세요.">
			  	</div>
		  	</div>
			<h6>이름</h6>
			<div class="form-row">
				<div class="form-group col-md-3">
			    	<label for="familyname"></label>
			    	<input type="text" class="form-control" id="familyname" name="familyname" value="${memberModify.familyname}" placeholder="성을 입력해주세요.">
			  	</div>
				<div class="form-group col-md-3">
			    	<label for="lastname"></label>
			    	<input type="text" class="form-control" id="lastname" name="lastname" value="${memberModify.lastname}" placeholder="이름을 입력해주세요.">
			  	</div>
		  	</div>
		  	<h6>전화번호</h6>
		  	<div class="form-row">
				<div class="form-group col-md-2">
					<label for="carrier"></label>
					<select class="form-control" id="carrier" name="carrier">
						<option value="" <c:out value="${memberModify.carrier == '' ? 'selected' : ''}"/>>Choose</option>
						<option value="SKT" <c:out value="${memberModify.carrier == 'SKT' ? 'selected' : ''}"/>>SKT</option>
						<option value="KT" <c:out value="${memberModify.carrier == 'KT' ? 'selected' : ''}"/>>KT</option>
						<option value="LGU" <c:out value="${memberModify.carrier == 'LGU' ? 'selected' : ''}"/>>LGU</option>
						<option value="ETC" <c:out value="${memberModify.carrier == 'ETC' ? 'selected' : ''}"/>>ETC</option>
					</select>
				</div>
				<div class="form-group col-md-1">
					<label for="fstnum"></label>
					<input type="text" class="form-control" id="fstnum" name="fstnum" value="${memberModify.fstnum}">
				</div>
				<div class="form-group col-md-1">
					<label for="sndnum"></label>
					<input type="text" class="form-control" id="sndnum" name="sndnum" value="${memberModify.sndnum}">
				</div>
				<div class="form-group col-md-1">
					<label for="thdnum"></label>
					<input type="text" class="form-control" id="thdnum" name="thdnum" value="${memberModify.thdnum}">
				</div>
			</div>
			<h6>주소</h6>
			<div class="form-row">
				<div class="form-group col-md-2">
					<label for="useraddr1"></label>
					<select class="form-control" id="useraddr1" name="useraddr1">
						<option value="" <c:out value="${memberModify.useraddr1 == '' ? 'selected' : ''}"/>>지역</option>
						<option value="1" <c:out value="${memberModify.useraddr1 == '1' ? 'selected' : ''}"/>>서울</option>
						<option value="2" <c:out value="${memberModify.useraddr1 == '2' ? 'selected' : ''}"/>>경기도</option>
						<option value="3" <c:out value="${memberModify.useraddr1 == '3' ? 'selected' : ''}"/>>인천광역시</option>
					</select>
				</div>
			    <div class="form-group col-md-3">
			    	<label for="postnum"></label>
			    	<input type="text" class="form-control" id="postnum" name="postnum" value="${memberModify.postnum}" placeholder="우편번호를 입력해주세요.">
			  	</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="useraddr2">시군구</label>
					<input type="text" class="form-control" id="useraddr2" name="useraddr2" value="${memberModify.useraddr2}" placeholder="시군구를 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="useraddr3">동읍면</label>
					<input type="text" class="form-control" id="useraddr3" name="useraddr3" value="${memberModify.useraddr3}" placeholder="동읍면을 입력해주세요.">
				</div>
			</div>
		</form>
	  <button type="button" class="btn btn-outline-primary" id="btnModify">수정</button>
	  <button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
	</section>
</div>
</body>
</html>