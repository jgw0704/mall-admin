<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String productId = request.getParameter("productId");
	Product product = new Product();
	product.setProductId(Integer.parseInt(productId));
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>