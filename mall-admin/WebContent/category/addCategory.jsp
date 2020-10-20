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
<title>addCategory</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#categoryName").val()=="") {
				alert("카테고리 이름을 입력해주세요");
				return;
			}
			$("#addCategoryAction").submit();
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>카테고리 입력</h1>
	<form method="post" id="addCategoryAction" action="/mall-admin/category/addCategoryAction.jsp">
		<div>카테고리 이름</div>
		<div><input type="text" name="categoryName" id="categoryName"></div>
		<div><button type="button" id="btn" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>