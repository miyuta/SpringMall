<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Admin GoodsRegister</title>
	
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap-theme.min.css">
	<link rel = "stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js"></script>

	<link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
	
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
		<aside>
			<%@ include file="/WEB-INF/views/admin/include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<h2>상품 등록</h2>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<div class = "inputArea">
					<label>1차 분류</label>
					<select class="category1">
						<option value="">전체</option>
					</select>
					
					<label>2차 분류</label>
					<select class="category2" name = "catecode">
						<option value="">전체</option>
					</select>
				</div>
				
				<div class = "inputArea">
					<label for = "gdsName">상품명</label>
					<input type = "text" id = "gdsName" name = "gdsname" />
				</div>
				
				<div class = "inputArea">
					<label for = "gdsPrice">상품 가격</label>
					<input type = "text" id = "gdsPrice" name = "gdsprice" />
				</div>
				
				<div class = "inputArea">
					<label for = "gdsStock">상품 수량</label>
					<input type = "text" id = "gdsStock" name = "gdsstock" />
				</div>
				
				<div class = "inputArea">
					<label for = "gdsDes">상품 소개</label>
					<textarea rows = "5" cols = "50" id = "gdsDes" name = "gdsdes"></textarea>
				
					<script>
					 var ckeditor_config = {
					   resize_enaleb : false,
					   enterMode : CKEDITOR.ENTER_BR,
					   shiftEnterMode : CKEDITOR.ENTER_P,
					   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
					 };
					 
					 CKEDITOR.replace("gdsDes", ckeditor_config);
					</script>
				</div>
				
				<div class="inputArea">
					<label for="gdsImg">이미지</label>
					<input type="file" id="gdsImg" name="file" />
					<div class="select_img"><img src=""></div>
					
					<script>
						$("#gdsImg").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>					
					<%=request.getRealPath("/") %>					
				</div>
				
				<div class = "inputArea">
					<button class = "btn btn-primary" type = "submit" id = "btnRegister">등록</button>
				</div>
			</form>
			
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
		</div>
	</footer>
</div>
<P>  The time on the server is ${serverTime}. </P>

<script>
	//컨트롤에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	//1차 분류 셀렉트 박스에 삽입 할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {

		if (jsonData[i].level == "1") {
			cate1Obj = new Object();		//초기화
			cate1Obj.catecode = jsonData[i].catecode;
			cate1Obj.catename = jsonData[i].catename;
			cate1Arr.push(cate1Obj);
		}
	}

	//1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for (var i=0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].catecode + "'>" + cate1Arr[i].catename + "</option>" );
	}

	$(document).on("change", "select.category1", function(){
		var cate2Arr = new Array();
		var cate2Obj = new Object();

		//2차 분류 셀렉트 박스에 삽입 할 데이터 준비
		for (var i = 0; i < jsonData.length; i++) {

			if (jsonData[i].level == "2") {
				cate2Obj = new Object();
				cate2Obj.catecode = jsonData[i].catecode;
				cate2Obj.catename = jsonData[i].catename;
				cate2Obj.catecoderef = jsonData[i].catecoderef;
				cate2Arr.push(cate2Obj);
			}
		}
	
		var cate2Select = $("select.category2")
	
		/* for (var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].catecode + "'>" + cate2Arr[i].catename + "</option>");
		} */

		cate2Select.children().remove();

		$("option:selected", this).each(function(){

			var selectVal = $(this).val();
			cate2Select.append("<option value='" + selectVal +"'>전체</option>");

			for (var i = 0; i < cate2Arr.length; i++) {
				if (selectVal == cate2Arr[i].catecoderef) {
					cate2Select.append("<option value='" + cate2Arr[i].catecode + "'>" + cate2Arr[i].catename + "</option>");
				}
			}
		});
	});
</script>
</body>
</html>