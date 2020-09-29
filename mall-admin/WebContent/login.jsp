<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") !=null) {
		System.out.println("이미 로그인이 되어 있습니다");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>관리자 로그인</h1>
	<div>
	<form method="post" action="/mall-admin/loginAction.jsp">
		<table class="table table-basic">
			<tr>
				<td class = "text-center">관리자ID</td>
				<td><input type="text" name="adminId"></td>
			</tr>
			<tr>
				<td class = "text-center">관리자PW</td>
				<td><input type="password" name="adminPw"></td>
			</tr>
		</table>
		<button type = "submit" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>