<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeDate = request.getParameter("noticeDate");
	
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	notice.setNoticeDate(noticeDate);
	
	NoticeDao noticetDao = new NoticeDao();
	noticetDao.insertNotice(notice);
	
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>