<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String categoryId = request.getParameter("categoryId");
	Category category = new Category();
	category.setCategoryId(Integer.parseInt(categoryId));
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>