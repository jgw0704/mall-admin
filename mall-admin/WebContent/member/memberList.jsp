<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
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
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	td {border: 1px solid black;}
	table {border: 1px solid black;}
</style>
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1 class = "text-center">고객 목록</h1>
	<%
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> list = memberDao.selectMemberList();
	%>
	<table class="container table table-basic table-secondary text-dark">
		<thead>
			<tr class = "table-light text-primary">
				<th>member_email</th>
				<th>member_pw</th>
				<th>member_name</th>
				<th>member_date</th>
				<th>회원정보수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : list) {
			%>
					<tr>
						<td><%=m.getMemberEmail()%></td>
						<td><%=m.getMemberPw()%></td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getMemberDate()%></td>
						<td><a class = "text-light btn-info" href="/mall-admin/member/memberUpdateForm.jsp?memberEmail=<%=m.getMemberEmail()%>&&memberPw=<%=m.getMemberPw()%>&&memberName=<%=m.getMemberName()%>">수정</a></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</body>
</html>