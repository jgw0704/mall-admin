<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
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
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	td {border: 1px solid black;}
	table {border: 1px solid black;}
</style>
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1 class = "text-center">상품카테고리 목록</h1>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class="container table table-basic table-secondary text-dark">
		<thead>
			<tr class = "table-light text-primary">
				<th>category_id</th>
				<th>category_name</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Category c : list) {
			%>
					<tr>
						<td><%=c.getCategoryId()%></td>
						<td><%=c.getCategoryName()%></td>
						<td><a class = "text-light btn-info" href="/mall-admin/category/categoryUpdateForm.jsp?categoryId=<%=c.getCategoryId()%>&&categoryName=<%=c.getCategoryName()%>">수정</a></td>
						<td><a class = "text-light btn-danger" href="/mall-admin/category/categoryDeleteAction.jsp?categoryId=<%=c.getCategoryId()%>">삭제</a></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
	<div style="text-align: center;">
		<a href="/mall-admin/category/addCategory.jsp" class = "btn btn-primary">상품카테고리추가</a>
	</div>
</body>
</html>