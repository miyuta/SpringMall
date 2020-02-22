<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div>
		<a href="${pageContext.request.contextPath}/">홈</a>
		<a href="${pageContext.request.contextPath}/member/register">회원 등록</a>
		<a href="${pageContext.request.contextPath}/member/list">회원 리스트</a>
		<a href="${pageContext.request.contextPath}/board/listPage?num=1">글 목록(페이징)</a>
		<%-- <a href="${pageContext.request.contextPath}/board/list">목록</a> --%>
		<a href="${pageContext.request.contextPath}/board/write">글 작성</a>
	</div>
</div>