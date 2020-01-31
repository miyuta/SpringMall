<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Shop List</title>
	
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

	<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
<style>

 body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:90%; margin:0 auto; }
 header#header { }
 nav#nav { }
 section#container { }
 section#content { float:left; width:700px; }
 aside#aside { float:left; width:180px; padding:100px 0; }
 section#container::after { content:""; display:block; clear:both; } 
 footer#footer { background:#eee; padding:30px; }
 
 /* ---------- */
 
 header#header div#header_box { text-align:center; padding:30px 0; }
 header#header div#header_box h1 { font-size:30px; }
 header#header div#header_box h1 a { color:#000; }
 
 nav#nav div#nav_box { font-size:14px; padding:20px 0 10px; text-align:right; border-bottom: 1px solid; #666; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
 
 section#container { }
 
aside#aside h3 { font-size:22px; margin-bottom:50px; text-align:center; }
aside#aside li { font-size:16px; text-align:center; }
aside#aside li a { color:#000; display:block; padding:15px 0; }
aside#aside li a:hover { text-decoration:none; background:#eee; }
 
aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }
 
 footer#footer { margin-top:120px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
aside ul li { text-align:center; margin-bottom:10px; }
aside ul li a { display:block; width:100%; padding:10px 0; }
aside ul li a:hover { background:#eee; }

footer#footer { background:#f9f9f9; padding:20px; }
footer#footer ul li { display:inline-block; margin-right:10px; }
</style>
<style>
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
</style>

<style>
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 .deliveryChange { text-align:right; }
.btnOnDelivery,
.btnDelivered { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
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
		<div id="container_box">
			<aside id="aside">
				<%@ include file="/WEB-INF/views/admin/include/aside.jsp" %>
			</aside>
			
			<section id="content">
		
				<div class="orderInfo">
					<c:forEach items="${orderView}" var="orderview" varStatus="status">
						
						<c:if test="${status.first}">
							<p><span>주문자</span>${orderview.userid}</p>
							<p><span>수령인</span>${orderview.orderrec}</p>
							<p><span>주소</span>(${orderview.useraddr1}) ${orderview.useraddr2} ${orderview.useraddr3}</p>
							<p><span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderview.amount}" /> 원</p>
							<p><span>상태</span>${orderview.delivery}</p>
							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
								
								<input type="hidden" name="orderid" value="${orderview.orderid}" />
								<input type="hidden" name="delivery" class="delivery" value="" />
								
								<button type="button" class="btnOnDelivery">배송 중</button>
								<button type="button" class="btnDelivered">배송 완료</button>
								
								<script>
									$(".btnOnDelivery").click(function(){
											$(".delivery").val("배송 중");
											run();
										});

									$(".btnDelivered").click(function(){
											$(".delivery").val("배송 완료");
											 run();
										});

									function run() {
											$(".deliveryForm").submit();
										}
								</script>
								</form>
							</div>
						</c:if>
						
					</c:forEach>
				</div>
				
				<ul class="orderView">
					<c:forEach items="${orderView}" var="orderview">
					<li>
						<div class="thumb">
							<img src="${pageContext.request.contextPath}/${orderview.gdsthumbimg}" />
						</div>
						<div class="gdsInfo">
							<p>
								<span>상품명</span>${orderview.gdsname}<br />
								<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderview.gdsprice}" /> 원<br />
								<span>구입 수량</span>${orderview.cartstock} 개<br />
								<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderview.gdsprice * orderview.cartstock}" /> 원<br />
							</p>
						</div>
					</li>
					</c:forEach>
				</ul>
			</section>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
	</footer>
</div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>