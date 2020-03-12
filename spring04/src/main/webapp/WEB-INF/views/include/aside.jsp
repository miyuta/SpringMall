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
		<a href="${pageContext.request.contextPath}/">홈</a>
<c:choose>
	<c:when test="${member == null}">
		<a href="${pageContext.request.contextPath}/login/login">로그인</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
		<a href="${pageContext.request.contextPath}/member/register">회원 등록</a>
		<a href="${pageContext.request.contextPath}/member/list">회원 리스트</a>
		<a href="${pageContext.request.contextPath}/board/listPage?num=1">글 목록(페이지)</a>
		<a href="${pageContext.request.contextPath}/board/criListPage">글 목록(페이지cri)</a>
		<a href="${pageContext.request.contextPath}/board/criListSchPage">글 목록(페이지+검색cri)</a>
		<%-- <a href="${pageContext.request.contextPath}/board/list">목록</a> --%>
		<a href="${pageContext.request.contextPath}/board/write">글 작성</a>
	</div>
</div>