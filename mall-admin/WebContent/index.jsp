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
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container">
	<!-- 메뉴 -->
	<div>
		<table>
			<tr>
				<td><a href="./index.jsp" class = "btn btn-warning">홈으로</a></td>
				<td><a href="/mall-admin/category/categoryList.jsp" class = "btn btn-warning">카테고리 목록</a></td>
				<td><a href="/mall-admin/product/productList.jsp" class = "btn btn-warning">상품 목록</a></td>
				<td><a href="/mall-admin/orders/ordersList.jsp" class = "btn btn-warning">주문 목록</a></td>
				<td><a href="/mall-admin/notice/noticeList.jsp" class = "btn btn-warning">공지목록</a></td>
				<td><a href="/mall-admin/member/memberList.jsp" class="btn btn-warning">회원관리</a></td>
				<td><a href="/mall-admin/logoutAction.jsp" class = "btn btn-warning">로그아웃</a></td>
			</tr>
		</table>
	</div>
	
	<div class="container jumbotron text-center bg-warning" >
	  <h1>쇼핑몰 관리자 페이지</h1>
	  <p><%=session.getAttribute("loginAdminId")%> 님 반갑습니다</p>
	  <a href="/mall-admin/category/categoryList.jsp" ><img src="./image/shop.jpg" class="rounded-circle" alt="Cinque Terre"></a>
	  <p>환영합니다</p>
	</div>
</body>
</html>