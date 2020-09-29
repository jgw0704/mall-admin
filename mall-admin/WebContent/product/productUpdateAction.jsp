<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	
	System.out.println(productId +"<-- productId");
	System.out.println(productName +"<-- productName");
	System.out.println(productPrice +"<-- prductPrice");
	System.out.println(productContent +"<-- productContent");
	System.out.println(productSoldout +"<-- productSoldout");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>