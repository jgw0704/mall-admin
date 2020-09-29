package dao;
import java.util.*;
import vo.*;
import java.sql.*;
import commons.*;

public class CategoryDao {
	// Category를 추가
	public void insertCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	// 카테고리 삭제 
	public void deleteCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
			
		String sql = "delete from category where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.getCategoryId());
		stmt.executeUpdate();	
			
		conn.close();
	}
	
	// 카테고리 수정
	public void updateCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update category set category_name=? where category_id=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeUpdate();	
		
		conn.close();
	}
	
	// Category 목록
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
}
