<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Admin GoodsView</title>
	
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

	<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="/WEB-INF/views/admin/include/header.jsp"  %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="/WEB-INF/views/admin/include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<h2>상품 등록</h2>
			
			<form role="form" method="post" autocomplete="off">
				
				<div class = "inputArea">
					<label>1차 분류</label>
					<span class="category1"></span>
					<label>2차 분류</label>
					<span class="category2">${goodsView.catecode}</span>
				</div>
				
				<div class = "inputArea">
					<label for = "gdsName">상품명</label>
					<span>${goodsView.gdsname}</span>
				</div>
				
				<div class = "inputArea">
					<label for = "gdsPrice">상품 가격</label>
					<span>
						<fmt:formatNumber value="${goodsView.gdsprice}" pattern="###,###,###" />
					</span>
				</div>
				
				<div class = "inputArea">
					<label for = "gdsStock">상품 수량</label>
					<span>
						<fmt:formatNumber value="${goodsView.gdsstock}" pattern="###,###,###" />
					</span>
				</div>
				
				<div class = "inputArea">
					<label for = "gdsDes">상품 소개</label>
					<span>${goodsView.gdsdes}</span>
				</div>
				
				<div class = "inputArea">
					<button class = "btn btn-warning" type = "submit" id = "btnRegister">수정</button>
					<button class = "btn btn-danger" type = "submit" id = "btnRegister">수정</button>
				</div>
			</form>
			
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
		</div>
	</footer>
</div>
<P>  The time on the server is ${serverTime}. </P>

<script>
	//컨트롤에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	//1차 분류 셀렉트 박스에 삽입 할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {

		if (jsonData[i].level == "1") {
			cate1Obj = new Object();		//초기화
			cate1Obj.catecode = jsonData[i].catecode;
			cate1Obj.catename = jsonData[i].catename;
			cate1Arr.push(cate1Obj);
		}
	}

	//1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for (var i=0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].catecode + "'>" + cate1Arr[i].catename + "</option>" );
	}

	$(document).on("change", "select.category1", function(){
		var cate2Arr = new Array();
		var cate2Obj = new Object();

		//2차 분류 셀렉트 박스에 삽입 할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == "2") {
				cate2Obj = new Object();
				cate2Obj.catecode = jsonData[i].catecode;
				cate2Obj.catename = jsonData[i].catename;
				cate2Obj.catecoderef = jsonData[i].catecoderef;
				cate2Arr.push(cate2Obj);
			}
		}
	
		var cate2Select = $("select.category2")
	
		/* for (var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].catecode + "'>" + cate2Arr[i].catename + "</option>");
		} */

		cate2Select.children().remove();

		$("option:selected", this).each(function(){

			var selectVal = $(this).val();
			cate2Select.append("<option value='" + selectVal +"'>전체</option>");

			for (var i = 0; i < cate2Arr.length; i++) {
				if (selectVal == cate2Arr[i].catecoderef) {
					cate2Select.append("<option value='" + cate2Arr[i].catecode + "'>" + cate2Arr[i].catename + "</option>");
				}
			}
		});
	});
</script>
</body>
</html>