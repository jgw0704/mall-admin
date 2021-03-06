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
<title>ordersUpdate</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($(".ordersState").checked == "undefined") {
				return;
			}
			$("#ordersUpdateAction").submit();
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
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		System.out.println(ordersId+"<-ordersId"); // 주문id 확인
		
		String ordersState = request.getParameter("ordersState");
		System.out.println(ordersState+"<-ordersState"); // 주문상태 확인
	%>
	<h1>상품목록 수정</h1>
	<form method="post" id="ordersUpdateAction" action="/mall-admin/orders/ordersUpdateAction.jsp">
		<div>orders_Id</div>
		<div><input type ="text" name= "ordersId" id="ordersId" value ="<%=ordersId%>" readonly="readonly"></div>
		<div>orders_State</div>
		<div>
		<input type ="radio" name= "ordersState" class="ordersState" value ="결제완료" checked>결제완료
		<input type ="radio" name= "ordersState" class="ordersState" value ="배송준비중">배송준비중
		<input type ="radio" name= "ordersState" class="ordersState" value ="배송완료">배송완료
		<input type ="radio" name= "ordersState" class="ordersState" value ="주문취소">주문취소
		</div>
		<div><button type="button" id="btn" class="btn btn-primary">수정</button></div>
	</form>
</body>
</html>