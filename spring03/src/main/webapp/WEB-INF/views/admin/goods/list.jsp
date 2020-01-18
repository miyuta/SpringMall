<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>Admin GoodsList</title>
	
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

	<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
	
<style>
	#container_box table td { width:100px; }
</style>

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
		<div id=container_box>
			<!-- <h2>상품 목록</h2> -->
			
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items = "${goodsList}" var = "goodslist">
					<tr>
						<td>${goodslist.gdsnum}</td>
						<td>
							<a href = "${pageContext.request.contextPath}/admin/goods/view?n=${goodslist.gdsnum}">${goodslist.gdsname}</a>
						</td>
						<td>${goodslist.catecode}</td>
						<td>
							<fmt:formatNumber value="${goodslist.gdsprice}" pattern = "###,###,###" />
						</td>
						<td>
							<fmt:formatNumber value="${goodslist.gdsstock}" pattern = "###,###,###" />
						</td>
						<td>
							<fmt:formatDate value="${goodslist.gdsdate}" pattern = "yyyy-MM-dd" />
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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