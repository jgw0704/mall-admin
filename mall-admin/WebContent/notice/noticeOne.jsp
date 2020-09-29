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
<title>noticetOne</title>
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
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		System.out.println(noticeId+ "<--noticeId"); // id출력
		
		Notice notice = new NoticeDao().selectNoticeOne(noticeId);
		
		System.out.println(notice.getNoticeId());
		System.out.println(notice.getNoticeTitle());
		System.out.println(notice.getNoticeContent());
		System.out.println(notice.getNoticeDate());
	%>
	<h1 class = "text-center">공지사항</h1>
	<table class = "table table-basic table-secondary text-dark text-center">
		<tr>
			<td>notice_id</td>
			<td class = "table-light"><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>notice_title</td>
			<td class = "table-light"><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>notice_content</td>
			<td class = "table-light"><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>notice_date</td>
			<td class = "table-light"><%=notice.getNoticeDate()%></td>
		</tr>
	</table>
</body>
</html>