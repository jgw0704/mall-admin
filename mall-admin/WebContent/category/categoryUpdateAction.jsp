<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String categoryId = request.getParameter("categoryId");
	String categoryName = request.getParameter("categoryName");
	System.out.println(categoryId +"<-- categoryId");
	System.out.println(categoryName +"<-- categoryName");
	Category category = new Category();
	category.setCategoryId(Integer.parseInt(categoryId));
	category.setCategoryName(categoryName);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>