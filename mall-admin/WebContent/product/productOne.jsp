<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
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
<title>productOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	table {border: 1px solid black;}
	td {border: 1px solid black;}
</style>
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
		System.out.println(productId+ "<--prdocutId");
		
		Product product = new ProductDao().selectProductOne(productId);
	%>
	
	<h1 class = "text-center">상품 상세보기</h1>
	<table class = "table table-basic table-secondary text-dark text-center">
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/image/<%=product.getProductPic() %>">
				<a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=product.getProductId()%>">이미지 수정</a>
			</td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId()%></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.getCategoryId()%></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName()%></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice()%></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent()%></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<%
					if(product.getProductSoldout().equals("Y")) {
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>">[품절]</a>
				<%	
					} else {
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productSId=<%=product.getProductId()%>">[판매중]</a>
				<%		
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a href="">[수정]</a></td>
			<td><a href="">[삭제]</a></td>
		</tr>
	</table>
</body>
</html>