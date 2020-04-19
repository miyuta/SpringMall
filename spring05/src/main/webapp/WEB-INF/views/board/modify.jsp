<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='modForm']");
		var fileNum = 0;

		$("#btnModify").on("click", function(){
			if (valiChk()) {
				return false;
			}
			formObj.attr("action", "${pageContext.request.contextPath}/board/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});

		$("#btnBack").on("click", function(){
			self.location="${pageContext.request.contextPath}/board/view?bno=${boardModify.bno}"
																																  +"&atPage=${schVO.atPage}"
																																  +"&perPagePost=${schVO.perPagePost}"
																																  +"&option=${schVO.option}"
																																  +"&keyword=${schVO.keyword}";
		});

		$("#btnList").on("click", function(){
			self.location="${pageContext.request.contextPath}/"
		});

		$("#btnFileAdd").on("click", function(){
			var fileAdd = '<div><div><label class="custom-file-label" for="customFile">Choose file(복수 파일 업로드)</label>'
								  +'<input multiple="multiple" type="file" id="customFile" class="file' + (++fileNum) + '" name="file' + (fileNum) + '"></div>'
								  +'<button type="button" name="btnFileDel" class="btn btn-outline-danger btn-sm">파일 제거</button><hr /></div>';
			$("#fileDiv").append(fileAdd);
			$("button[name='btnFileDel']").on("click", function(){
				$(this).parent().remove();
			});
		});
	});

	function valiChk() {
		 var regForm = $("form[role='modForm'] .form-control").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
				alert($(".form-control").eq(i).attr("placeholder"));
				$(".form-control").eq(i).focus();
				return true;
			}
		}
	}
	
	var fileNoDel = new Array();
	function btnExistDel(fno) {
		fileNoDel.push(fno);
		$("#fileNoDel").attr("value", fileNoDel);
		console.log(fileNoDel);
	}	
</script>
<body>
<div id=root>
	<header>
		<h1>게시판</h1>
	</header>
	<%@include file="/WEB-INF/views/include/nav.jsp" %>
	
	<section id="container">
		<form role="modForm" enctype="multipart/form-data">
			<input type="hidden" name="atPage" value="${schVO.atPage}">
		  	<input type="hidden" name="perPagePost" value="${schVO.perPagePost}">
		  	<input type="hidden" name="option" value="${schVO.option}">
		  	<input type="hidden" name="keyword" value="${schVO.keyword}">
			<input type="hidden" name="bno" value="${boardModify.bno}">
			<input type="hidden" name="fileNoDel[]" id="fileNoDel" value="">
			<input type="hidden" name="fileNameDel[]" id="fileNameDel" value="">
			<div class="form-group">
		    	<label for="title">제목</label>
		    	<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요." value="${boardModify.title}">
		  	</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" id="reg_id" name="reg_id" placeholder="작성자를 입력해주세요." value="${boardModify.reg_id}">
				</div>
				<div class="form-group col-md-6">
					<label for="passwd">등록 날짜</label>
					<input type="text" class="form-control" value=<fmt:formatDate pattern="yyyy/MM/dd::HH:mm:ss" value="${boardModify.reg_dt}"/> readonly="readonly">
				</div>
			</div>
			<div class="form-row">
			    <div class="form-group col-md-3">
			    	<label for="tag">태그</label>
			    	<input type="text" class="form-control" id="tag" name="tag" placeholder="태그를 입력해주세요." value="${boardModify.tag}">
			  	</div>
			    <div class="form-group col-md-3">
					<label for="cate_cd">카테고리</label>
					<select class="form-control" id="cate_cd" name="cate_cd">
						<option value="none" <c:out value="${boardModify.cate_cd == 'none' ? 'selected' : ''}" />>Choose</option>
						<option value="Programming" <c:out value="${boardModify.cate_cd == 'Programming' ? 'selected' : ''}"/>>Programming</option>
						<option value="DataBase" <c:out value="${boardModify.cate_cd == 'DataBase' ? 'selected' : ''}"/>>DataBase</option>
						<option value="Etc" <c:out value="${boardModify.cate_cd == 'Etc' ? 'selected' : ''}"/>>Etc</option>
					</select>
				</div>
			</div>
		    <div class="form-group">
   			 	<label for="content">내용</label>
    			<textarea class="form-control" id="content" name="content" rows="18" placeholder="내용을 입력해주세요.">${boardModify.content}</textarea>
  			</div>
  			
  			 <span>파일 목록</span>
  			 <c:if test="${fileList != null}">
		 		<div class="form-group" style="border:1px solid #dbdbdb;">
		 			<c:forEach var="fileList" items="${fileList}" varStatus="row">
		 				<input type="hidden" name="fno${row.index}" value="${fileList.FNO}">
		 				${fileList.ORINAME}
		 				<button type="button" onclick="btnExistDel(${fileList.FNO})" class="btn btn-outline-danger btn-sm">파일 제거</button>
		 				<br />
		 			</c:forEach>
		 		</div>
	 		</c:if>
	 		<div id="fileDiv"></div>
	 		<input type="button" id="btnFileAdd" class="btn btn-outline-secondary btn-sm" value="파일 추가">
	 		<hr />
	 		
	 		
		  	<button type="button" class="btn btn-outline-primary" id="btnModify">등록</button>
		  	<button type="button" class="btn btn-outline-success" id="btnBack">뒤로</button>
		  	<button type="button" class="btn btn-outline-warning" id="btnList">목록</button>
		</form>
	</section>
</div>
</body>
</html>