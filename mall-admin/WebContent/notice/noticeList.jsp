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
<title>noticeList</title>
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
	<h1 class = "text-center">공지사항</h1>
	<%
				NoticeDao noticeDao = new NoticeDao();
				ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<table class="container table table-basic table-secondary text-dark">
		<thead>
			<tr class = "table-light text-success">
				<th>notice_id</th>
				<th>notice_name</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Notice n : noticeList) {
			%>
					<tr>
							<td><a href="/mall-admin/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeId()%></a></td>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeDate()%></td>
					</tr>	
			<%
					}
			%>
		</tbody>
	</table>
	<div style="text-align: center;">
		<a class="btn btn-info" href="/mall-admin/notice/addNotice.jsp">공지사항 추가</a>
	</div>
</body>
</html>