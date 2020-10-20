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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#adminId").val()=="") {
				alert("아이디를 입력해주세요");
				return;
			} else if($("#adminPw").val()=="") {
				alert("비밀번호를 입력해주세요");
				return;
			}
			$("#loginAction").submit();
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<h1>관리자 로그인</h1>
	<div>
	<form method="post" id="loginAction" action="/mall-admin/loginAction.jsp">
		<table class="table table-basic">
			<tr>
				<td class = "text-center">관리자ID</td>
				<td><input type="text" name="adminId" id="adminId"></td>
			</tr>
			<tr>
				<td class = "text-center">관리자PW</td>
				<td><input type="password" name="adminPw" id="adminPw"></td>
			</tr>
		</table>
		<button type = "button" id="btn" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>