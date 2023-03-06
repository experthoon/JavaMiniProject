<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String idx = request.getParameter("idx");
	AnswerDao dao = new AnswerDao();
	dao.deleteAnswers(idx);
%>
