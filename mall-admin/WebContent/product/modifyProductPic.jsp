<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyProductPic</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#productId").val()=="") {
				alert("상품번호를 선택해주세요");
				return;
			} else if($("productPic").val()=="") {
				alert("상품사진을 선택해주세요");
				return;
			}
			$("#modifyProductPicAction").submit();
		});
	});
</script>
</head>
<body>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
	%>
	<h1>상품 이미지 수정</h1>
	<form action="/mall-admin/product/modifyProductPicAction.jsp" method="post" id="modifyProductPicAction" enctype="multipart/form-data">
		<input type="hidden" name="productId" id="productId" value="<%=productId%>">
		<div>
			이미지 선택 :
			<input type="file" name="productPic" id="productPic">
		</div>
		<div>
			<button type="button" id="btn">이미지 수정</button>
		</div>
	</form>
</body>
</html>