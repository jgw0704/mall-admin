package dao;

import java.util.*;
import vo.*;
import java.sql.*;
import commons.*;

public class NoticeDao {
	public Notice selectNoticeOne(int noticeId) throws Exception{
		Notice notice = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
		
		System.out.println("SQL noticeId: " + noticeId);
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		System.out.println("SQL Query 입력");
		
		ResultSet rs = stmt.executeQuery();
		
		System.out.println("SQL Query 실행");
		
		if(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		
		conn.close();
		
		return notice;
	}
	
	public void insertNotice(Notice notice) throws Exception {
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.executeUpdate();
	}
	
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id, notice_title, notice_date from notice order by notice_date desc limit 0,10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
				n.setNoticeId(rs.getInt("notice_id"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeDate(rs.getString("notice_date"));
				list.add(n);
			}
	return list;
	}
}