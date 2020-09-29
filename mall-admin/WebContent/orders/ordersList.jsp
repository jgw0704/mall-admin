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
<title>ordersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	td {border: 1px solid black;}
	table {border: 1px solid black;}
</style>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		String ordersState = "";
		if(request.getParameter("ordersState") != null) {
			ordersState = request.getParameter("ordersState");
		}
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		if(ordersState.equals("")) {
			list = ordersDao.selectOrdersList();
		} else {
			list = ordersDao.selectOrdersListByState(ordersState);
		}
		ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();
	%>
	<h1 class = "text-center">주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState" class="btn btn-primary">
			<option value="">선택</option>
			<%
				for(String s : ordersStateList) {
			%>
					<option value="<%=s%>"><%=s%></option>
			<%		
				}
			%>
		</select>
		<button type="submit" class="btn btn-primary">주문상태별로 보기</button>
	</form>
	<table class="container table table-basic table-secondary text-dark">
		<thead>
			<tr class = "table-light text-success">
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>orders_state</th>
				<th>orders_date</th>
				<th>수정 </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list) {
			%>
					<tr>
					<td><%=oap.getOrders().getOrdersId()%></td>
						<td><%=oap.getOrders().getProductId()%></td>
						<td><%=oap.getProduct().getProductName()%></td>
						<td><%=oap.getOrders().getOrdersAmount()%></td>
						<td><%=oap.getOrders().getOrdersPrice()%></td>
						<td><%=oap.getOrders().getMemberEmail()%></td>
						<td><%=oap.getOrders().getOrdersAddr()%></td>
						<td><%=oap.getOrders().getOrdersState()%></td>
						<td><%=oap.getOrders().getOrdersDate()%></td>
						<td><a href="/mall-admin/orders/ordersUpdateForm.jsp?ordersId=<%=oap.getOrders().getOrdersId()%>&&ordersState=<%=oap.getOrders().getOrdersState()%>">수정</a></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>