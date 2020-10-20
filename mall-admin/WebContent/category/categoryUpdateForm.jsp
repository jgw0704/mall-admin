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
<title>CategoryUpdateForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#categoryId").val()=="") {
				alert("카테고리 아이디를 입력해주세요");
				return;
			} else if($("#categoryName").val()=="") {
				alert("카테고리 이름을 입력해주세요");
				return;
			}
			$("#categoryUpdateAction").submit();
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
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		System.out.println(categoryId+"<-categoryId");
		String categoryName = request.getParameter("categoryName");
		System.out.println(categoryName+"<-categoryName");
	%>
	<h1>카테고리 수정</h1>
	<form method="post" id="categoryUpdateAction" action="/mall-admin/category/categoryUpdateAction.jsp">
		<div>category_Id</div>
		<div><input type ="text" name= "categoryId" id="categoryId" value="<%=categoryId%>" readonly="readonly"></div>
		<div>category_Name</div>
		<div><input type ="text" name= "categoryName" id="categoryName" value = "<%=categoryName%>"></div>
		<div><button type="button" id="btn" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>