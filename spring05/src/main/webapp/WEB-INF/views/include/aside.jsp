<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<div>
<c:if test="${member != null}">
	${member.userid}님이 로그인 중입니다.
</c:if>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/">HOME</a>
<c:choose>
	<c:when test="${member == null}">
		<a href="${pageContext.request.contextPath}/login/login">LOGIN</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login/logout">LOGOUT</a>
	</c:otherwise>
</c:choose>
		<a href="${pageContext.request.contextPath}/member/register">REGISTER</a>
		<a href="${pageContext.request.contextPath}/member/list">MEMBERLIST</a>
		<a href="${pageContext.request.contextPath}/board/list">LIST</a>
		<a href="${pageContext.request.contextPath}/board/listPage?num=1">LIST(Pagination)</a>
		<a href="${pageContext.request.contextPath}/board/write">WRITE</a>
	</div>
</div>