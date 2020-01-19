<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			
			<form role = "form" method = "post" autocomplete = "off">
			
			<input type = "hidden" name = "n" value = "${goodsView.gdsnum}" />
				
				<c:choose>
				<c:when test="${goodsView.catecoderef != null && goodsView.catecoderef != ''}">
				<div class = "inputArea">
					<label>1차 분류</label>
					<span class="category1">${goodsView.catecoderef}</span>
					<label>2차 분류</label>
					<span class="category2">${goodsView.catecode}</span>
				</div>
				</c:when>
				<c:otherwise>
				<div class = "inputArea">
					<label>1차 분류</label>
					<span class="category1">${goodsView.catecode}</span>
					<label>2차 분류</label>
					<span class="category2"></span>
				</div>
				</c:otherwise>
				</c:choose>
				
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
					<label for = "gdsImg">이미지</label>
					<p>원본 이미지</p>
					<img src = "${pageContext.request.contextPath}/${goodsView.gdsimg}" class="oriImg" />
					
					<p>썸네일</p>
					<img src = "${pageContext.request.contextPath}/${goodsView.gdsthumbimg}" class="thumbImg" />
				</div>
				
				<div class = "inputArea">
					<button class = "btn btn-warning" type = "submit" id = "btnModify">수정</button>
					<button class = "btn btn-danger" type = "submit" id = "btnDelete">삭제</button>
					
					<script>
						var formObj = $("form[role='form']");

						$("#btnModify").click(function(){
							formObj.attr("action", "${pageContext.request.contextPath}/admin/goods/modify")	;
							formObj.attr("method", "get")
							formObj.submit();
						});

						$("#btnDelete").click(function(){

							var con = confirm("삭제하겠습니까?");

							if(con) {
								formObj.attr("action", "${pageContext.request.contextPath}/admin/goods/delete");
								formObj.submit();
							}
						})
					</script>
					
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
</body>
</html>