<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Shop All Reply</title>
	
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
 
</style>
<style>
 /*section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }*/
 
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
<style>
#content ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }

.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
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
		<div id=container_box>
			<aside id="aside">
				<%@ include file="/WEB-INF/views/admin/include/aside.jsp" %>
			</aside>
		
			<section id="content">
		
				<ul>
					<c:forEach items = "${allReply}" var = "allreply">
						<li>
							<div class="replyInfo">
								<p>
									<span>작성자</span>${allreply.username} (${allreply.userid})
								</p>
								
								<p>
									<span>작성된 상품</span><a href="${pageContext.request.contextPath}/shop/view?n=${allreply.gdsnum}">바로가기</a>
								</p>
							</div>
							
							<div class="replyContent">
								${allreply.repcon}
							</div>
							
							<div class="replyControll">
								<form role="form" method="post">
									
									<input type="hidden" name="repnum" value="${allreply.repnum}" />
									<button type="submit" class="btnDelete${allreply.repnum}">삭제</button>
									
								</form>
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