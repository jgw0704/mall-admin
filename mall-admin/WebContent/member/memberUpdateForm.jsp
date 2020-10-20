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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberPw").val()=="") {
				alert("수정할 패스워드를 입력해주세요");
				return;
			} else if($("#memberName").val()=="") {
				alert("수정할 이름을 입력해주세요");
				return;
			}
			$("#memberUpdateAction").submit();
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
		request.setCharacterEncoding("UTF-8");
		
		String memberEmail = request.getParameter("memberEmail");
		System.out.println(memberEmail+"<-memberEmail"); // 이메일확인
		
		String memberPw = request.getParameter("memberPw");
		System.out.println(memberPw+"<-memberPw"); // 비밀번호확인
		
		String memberName = request.getParameter("memberName");
		System.out.println(memberName+"<-memberName"); // 이름확인
	%>
	<h1>상품목록 수정</h1>
	<form method="post" id="memberUpdateAction" action="/mall-admin/member/memberUpdateAction.jsp">
		<div>member_Email</div>
		<div><input type ="text" name="memberEmail" value ="<%=memberEmail%>" readonly="readonly"></div>
		<div>member_Pw</div>
		<div><input type ="text" name="memberPw" id="memberPw" value ="<%=memberPw%>"></div>
		<div>member_Name</div>
		<div><input type ="text" name= "memberName" id="memberName" value ="<%=memberName%>"></div>
		<div><button type="button" id="btn" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>