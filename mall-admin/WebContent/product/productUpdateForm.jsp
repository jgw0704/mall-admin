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
<title>productUpdateForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		int productId = Integer.parseInt(request.getParameter("productId"));
		System.out.println(productId+"<-productId"); // 상품id 확인
		
		String productName = request.getParameter("productName");
		System.out.println(productName+"<-productName"); // 상품이름 확인
		
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		System.out.println(productPrice+"<-productPrice"); // 상품가격 확인
		
		String productContent = request.getParameter("productContent");
		System.out.println(productContent+"<-productContent"); // 상품내용 확인
		
		String productSoldout = request.getParameter("productSoldout");
		System.out.println(productSoldout+"<-productSoldout"); // 상품 품절유무 확인
	%>
	<h1>상품목록 수정</h1>
	<form method="post" action="/mall-admin/product/productUpdateAction.jsp">
		<div>product_Id</div>
		<div><input type ="text" name= "productId" value ="<%=productId%>" readonly="readonly"></div>
		<div>product_Name</div>
		<div><input type ="text" name= "productName" value ="<%=productName%>"></div>
		<div>product_Price</div>
		<div><input type ="text" name= "productPrice" value ="<%=productPrice%>"></div>
		<div>product_Content</div>
		<div><textarea rows="5" cols = "80" name="productContent" ></textarea></div>
		<div>product_Soldout</div>
		<div>
		<input type ="radio" name= "productSoldout" value ="Y">Y(품절)
		<input type ="radio" name= "productSoldout" value ="N">N(판매중)
		</div>
		<div><button type="submit" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>