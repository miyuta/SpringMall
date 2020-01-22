<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h3>카테고리</h3>
    
    <ul>
    	<li><a href="${pageContext.request.contextPath}/shop/list?c=100&l=1">GAMES</a>
    		
    		<ul class="low">
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=101&l=2">RPG</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=102&l=2">ACTION</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=103&l=2">SHOTING</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=104&l=2">ACADE</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=105&l=2">SIMULATION</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=106&l=2">SPORTS</a></li>
    			<li><a href="${pageContext.request.contextPath}/shop/list?c=107&l=2">ETC</a></li>
    		</ul>
    		
    	</li>
    	
    	<li><a href="${pageContext.request.contextPath}/shop/list?c=200&l=1">CONSOLE</a></li>
    	<li><a href="${pageContext.request.contextPath}/shop/list?c=300&l=1">SOUNDTRACK</a></li>
    	<li><a href="${pageContext.request.contextPath}/shop/list?c=400&l=1">DLC</a></li>
    </ul>