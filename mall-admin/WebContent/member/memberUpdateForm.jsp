<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>memberUpdateForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String memberEmail = request.getParameter("memberEmail");
		System.out.println(memberEmail+"<-memberEmail"); // 이메일확인
		
		String memberPw = request.getParameter("memberPw");
		System.out.println(memberPw+"<-memberPw"); // 비밀번호확인
		
		String memberName = request.getParameter("memberName");
		System.out.println(memberName+"<-memberName"); // 이름확인
	%>
	<h1>상품목록 수정</h1>
	<form method="post" action="/mall-admin/member/memberUpdateAction.jsp">
		<div>member_Email</div>
		<div><input type ="text" name= "memberEmail" value ="<%=memberEmail%>" readonly="readonly"></div>
		<div>member_Pw</div>
		<div><input type ="text" name= "memberPw" value ="<%=memberPw%>"></div>
		<div>member_Name</div>
		<div><input type ="text" name= "memberName" value ="<%=memberName%>"></div>
		<div><button type="submit" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>