<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
<title>addNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#noticeTitle").val()=="") {
				alert("공지사항 제목을 작성해주세요");
				return;
			} else if($("#noticeContent").val()=="") {
				alert("공지사항 내용을 작성해주세요");
				return;
			}
			$("#addNoticeAction").submit();
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<h1 class = "text text-center">공지사항 추가</h1>
	<form method="post" id="addNoticeAction" action="/mall-admin/notice/addNoticeAction.jsp">
	<div>
		<table class="table">
			<tr>
				<td>notice_title</td>
				<td>
					<input type="text" name="noticeTitle" id="noticeTitle">
				</td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td>
					<textarea rows="5" cols = "80" name="noticeContent" id="noticeContent"></textarea>
				</td>
			</tr>
		</table>
		<button class = "btn btn-primary" type="button" id="btn">등록</button>
	</form>
</body>
</html>