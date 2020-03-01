<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>Board Write</h1>
		</header>
	</div>

<hr />

	<nav>
		<%@ include file="/WEB-INF/views/include/aside.jsp"%>
	</nav>

<hr />

	<section id="container">
	
		<form role="wrtForm" method="post" action="${pageContext.request.contextPath}/board/write">
			<p>
				<label for="title">Title</label><input type="text" id="title" name="title">
			</p>
			<p>
				<label for="title">Writer</label><input type="text" id="writer" name="writer">
				<label for="passwd">Password</label><input type="password" id="passwd" name="passwd">
			</p>
			<p>
				<label for="title">Content</label><textarea id="content" name="content"></textarea>
			</p>
			<p>
				<button type="submit">Submit</button>
			</p>
		</form>
	
	</section>
	
</body>
</html>