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
		/* 리스트 테이블 */
	#container_box table { width:900px; }
	#container_box table th { font-size:20px; font-weight:bold; text-align:center; padding:10px; border-bottom:2px solid #666; }
	#container_box table tr : hover { background:#eee; }
	#container_box table td { width:100px; padding:10px; text-align:center; }
	#container_box table img {width:150px; height:auto; }
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
						<td>
							<img src = "${pageContext.request.contextPath}/${goodslist.gdsthumbimg}" />
						</td>
						<td>
							<a href = "${pageContext.request.contextPath}/admin/goods/view?n=${goodslist.gdsnum}">${goodslist.gdsname}</a>
						</td>
						<td>${goodslist.catename}</td>
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