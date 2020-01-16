<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
<c:if test="${member != null}">
	<li>
		<a href ="${pageContext.request.contextPath}/">일반 회원</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/member/signout">로그아웃</a>
	</li>
</c:if>
</ul>