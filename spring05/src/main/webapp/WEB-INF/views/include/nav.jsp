<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/member/list">Member</a>
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/member/register">Register</a>
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/board/list">List</a>
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/board/listPage">ListPage</a>
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/board/listPageSch">listPageSch</a>
		<a class="nav-item nav-link" href="${pageContext.request.contextPath}/board/write">Write</a>
    </div>
  </div>
</nav>