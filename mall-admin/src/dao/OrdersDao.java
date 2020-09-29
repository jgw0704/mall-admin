package dao;

import java.util.*;

import commons.DBUtil;

import java.sql.*;
import vo.*;

public class OrdersDao {
	public ArrayList<String> selectOrdersStateList() throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn + "<-conn");
		String sql = "select distinct o.orders_state from orders o";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + "<-stmt");
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs + "<-rs");
		while (rs.next()) {
			list.add(rs.getString("o.orders_state"));
		}
		conn.close();
		return list;
	}
	
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn + "<-conn"); // 테스트용 출력
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
			oap.getOrders().setProductId(rs.getInt("o.product_id"));
			oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
			oap.getProduct().setProductName( rs.getString("p.product_name"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where o.orders_state like ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + ordersState + "%");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
			oap.getOrders().setProductId(rs.getInt("o.product_id"));
			oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("o.member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
			oap.getProduct().setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	public void updateOrdersState(Orders orders) throws Exception { //주문 수정
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update orders set orders_state=? where orders_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		// stmt.setString(1, orders.getOrdersState());
		if(orders.getOrdersState().equals("결제완료")) {
			stmt.setString(1, "결제완료");
		} else if(orders.getOrdersState().equals("배송준비중")) {
			stmt.setString(1, "배송준비중");
		} else if(orders.getOrdersState().equals("배송완료")) {
			stmt.setString(1, "배송완료");
		} else if(orders.getOrdersState().equals("주문취소")) {
			stmt.setString(1, "주문취소");
		}
		stmt.setInt(2, orders.getOrdersId());
		
		stmt.executeUpdate();
		
		conn.close();
	}
/*
	public Orders selectOrdersOne(int ordersId) {
		String sql = "select orders_id, orders_state from orders where orders_id = ?";
		
		return null;
	}
*/
}