<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num
	String num = request.getParameter("num");

	//dao
	GuestDao dao = new GuestDao();
	
	//num에 해당하는 select증가
	dao.updateChu(num);
	
	//num에 해당하는 chu값 insert형식으로 반환
	int chu = dao.getData(num).getChu();
	
	JSONObject ob = new JSONObject();
	ob.put("chu",chu);
%>

<%=ob.toString()%>