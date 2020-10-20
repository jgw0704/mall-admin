<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProduct</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#categoryId").val()=="") {
				alert("카테고리번호를 입력해주세요");
				return;
			} else if($("productName").val()=="") {
				alert("상품이름을 작성해주세요");
				return;
			} else if($("#productPrice").val()=="") {
				alert("상품가격을 작성하지 않았습니다");
				return;
			} else if($("#productContent").val()=="") {
				alert("상품설명을 작성하지 않았습니다");
				return;
			}
			$("#addProductAction").submit();
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1 class = "text text-center">상품 추가</h1>
	<form method="post" id="addProductAction" action="/mall-admin/product/addProductAction.jsp">
	<div>
		<table class="table">
			<tr>
				<td>category_id</td>
				<td>
					<select name="categoryId" id="categoryId">
						<option value="">카테고리선택 </option>
						<%
							for(Category c : categoryList) {
						%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td>
					<input type="text" name="productName" id="productName">
				</td>
			</tr>
			<tr>
				<td>product_price</td>
				<td>
					<input type="text" name="productPrice" id="productPrice">
				</td>
			</tr>
			<tr>
				<td>product_content</td>
				<td>
					<textarea rows="5" cols = "80" name ="productContent" id="productContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<input type="radio" name="productSoldout" id="productSoldout" value="N" checked="checked">품절아님
					<input type="radio" name="productSoldout" id="productSoldout" value="Y">품절
				</td>
			</tr>
		</table>
		<button class = "btn btn-primary" type="button" id="btn">등록</button>
	</form>
</body>
</html>