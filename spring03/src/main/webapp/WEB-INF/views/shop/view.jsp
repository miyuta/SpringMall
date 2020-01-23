<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	<title>Shop View</title>
	
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
  section#content { float:right; width:700px; }
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
 
 footer#footer { margin-top:630px; border-radius:50px 50px 0 0; }
 footer#footer div#footer_box { padding:0 20px; }
 
</style>

<style>
 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
  div.goods div.goodsInfo p.addToCart button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
</style>

<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="/WEB-INF/views/include/header.jsp"  %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="contentainer">
	
		<div id="container_box">
			<section id="content">
			
			<form role="form" method="post">
				<input type="hidden" name="gdsnum" value="${shopView.gdsnum}" />
			</form>
			
			<div class="goods">
				<div class="goodsImg">
					<img src="${pageContext.request.contextPath}/${shopView.gdsimg}" />
				</div>
				
				<div class="goodsInfo">
					<p class="gdsName"><span>상품명</span>${shopView.gdsname}</p>
					<p class="cateName"><span>카테고리</span>${shopView.catename}</p>
					<p class="gdsPrice">
						<span>가격</span><fmt:formatNumber pattern="###,###,###" value="${shopView.gdsprice}"></fmt:formatNumber>원
					</p>
					<p class="gdsStock">
						<span>재고</span><fmt:formatNumber pattern="###,###,###" value="${shopView.gdsstock}"></fmt:formatNumber>EA
					</p>
					<p class="cartStock">
						<span>구입 수량</span>
						<button type="button" class="btnPlus">+</button>
						<input type="number" class="numBox" min="1" max="${shopView.gdsstock}" value="1" readonly="readonly" />
						<button type="button" class="btnMinus">-</button>
						
						<script>
							$(".btnPlus").click(function(){
								var num = $(".numBox").val();		//numBox 값
								var plusNum = Number(num) + 1;		//numBox 값에 1더하기

								if (plusNum > ${shopView.gdsstock}) {
									$(".numBox").val(num);		//numBox 값이 재고보다 크면 numBox 값 +1 안함
								} else {
									$(".numBox").val(plusNum);		//numBox 값이 재고보다 작으면 numBox + 1
								}
							});

							$(".btnMinus").click(function(){
								var num = $(".numBox").val();		//numBox 값
								var minusNum = Number(num) - 1;		//numBox 값에 1 빼기

								if (minusNum <= 0) {
									$(".numBox").val(num);		//numBox 값이 0보다 같거나 작으면 numBox
								} else {
									$(".numBox").val(minusNum);		//numBox값이 0보다 크면 numBox 값에 -1
								}
							});
						</script>
					</p>
					<p class="addToCart">
						<button type="button">카트에 담기</button>
					</p>
				</div>
				
				<div class="gdsDes">${shopView.gdsdes}</div>
			</div>
			
				<div id="reply">
				
					<c:if test = "${member == null}">
						<p>의견을 남기시려면<a href="${pageContext.request.contextPath}/member/signin">로그인</a>해주세요</p>
					</c:if>
					
					<c:if test = "${member !=null }">
					<section class="replyForm">
						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="gdsnum" value="${shopView.gdsnum}">
							
							<div class="input_area">
								<textarea name="repcon" id="repcon"></textarea>
							</div>
							
							<div class="input_area">
								<button type="submit" id="btnReply">의견 남기기</button>
							</div>
							
						</form>
					</section>
					</c:if>
					
					<section class="replyList">
						<ol>
							<c:forEach items="${replyList}" var="replylist">
							<li>
								<div class="userInfo">
								<span class="userName">${replylist.username}</span>
								<span class="date"><fmt:formatDate value="${replylist.repdate}" pattern="yyyy-MM-dd" /></span>
								</div>
								<div class="replyContent">${replylist.repcon}</div>
							</li>
							</c:forEach>
						</ol>
					</section>
				</div>
		</section>
	</div>
		
		<aside id="aside">
			<%@ include file="/WEB-INF/views/include/aside.jsp" %>
		</aside>
		
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
