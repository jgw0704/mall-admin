<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
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
<title>productList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	td {border: 1px solid black;}
	table {border: 1px solid black;}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");	
		int categoryId = -1;	
		if(request.getParameter("categoryId") != null) {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
	
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1) {
			productList= productDao.selectProductList();
		} else {
			productList= productDao.selectProductListByCategoryId(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1 class = "text-center">상품 관리</h1>
	<div class="container">
		<%
			for(Category c : categoryList) {
		%>
				<a class="btn btn-success" href="/mall-admin/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">
					[<%=c.getCategoryName()%>]
				</a>
		<%		
			}
		%>
	</div>
	<table class="container table table-basic table-secondary text-dark">
		<thead>
			<tr class = "table-light text-success">
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList) {
					if(p.getProductSoldout().equals("Y")) {
			%>
						<tr>
							<td><del><a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></del></td>
							<td><del><%=p.getCategoryId()%></del></td>
							<td><del><%=p.getProductName()%></del></td>
							<td><del><%=p.getProductPrice()%></del></td>
							<td class = "text-danger">품절</td>
							<td><a class = "text-light btn-info" href="/mall-admin/product/productUpdateForm.jsp?productId=<%=p.getProductId()%>&&productName=<%=p.getProductName()%>&&productPrice=<%=p.getProductPrice()%>&&productContent=<%=p.getProductContent()%>&&productSoldout=<%=p.getProductSoldout()%>">수정</a></td>
							<td><a class = "text-light btn-danger" href="/mall-admin/product/productDeleteAction.jsp?productId=<%=p.getProductId()%>">삭제</a></td>
						</tr>	
			<%			
					} else {
			%>
						<tr>
							<td><a href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></td>
							<td><%=p.getCategoryId()%></td>
							<td><%=p.getProductName()%></td>
							<td><%=p.getProductPrice()%></td>
							<td class = "text-success">판매</td>
							<td><a class = "text-light btn-info" href="/mall-admin/product/productUpdateForm.jsp?productId=<%=p.getProductId()%>&&productName=<%=p.getProductName()%>&&productPrice=<%=p.getProductPrice()%>&&productContent=<%=p.getProductContent()%>&&productSoldout=<%=p.getProductSoldout()%>">수정</a></td>
							<td><a class = "text-light btn-danger" href="/mall-admin/product/productDeleteAction.jsp?productId=<%=p.getProductId()%>">삭제</a></td>
						</tr>	
			<%
					}
				}
			%>
		</tbody>
	</table>
	<div style="text-align: center;">
		<a class="btn btn-info" href="/mall-admin/product/addProduct.jsp">상품목록추가</a>
	</div>
</body>
</html>