<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String num = request.getParameter("num");
	MemberDao dao = new MemberDao();
	dao.deleteMember(num);
	
	response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
%>