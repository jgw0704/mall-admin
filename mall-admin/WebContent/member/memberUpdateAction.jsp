<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	System.out.println(memberEmail +"<-- memberEmail");
	System.out.println(memberPw +"<-- memberPw");
	System.out.println(memberName +"<-- memberName");
	
	Member member = new Member();
	member.setMemberEmail(memberEmail);
	member.setMemberPw(memberPw);
	member.setMemberName(memberName);
	
	MemberDao memberDao = new MemberDao();
	memberDao.updateMemberList(member);
	
	response.sendRedirect("/mall-admin/member/memberList.jsp");
%>