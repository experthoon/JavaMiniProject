<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");

	//데이터 읽어서 dto에 넣기
	AnswerDto dto = new AnswerDto();
	dto.setNum(request.getParameter("num"));
	dto.setMyid(request.getParameter("myid"));
	dto.setContent(request.getParameter("content"));
	
	//페이지 번호읽기
	String currentPage = request.getParameter("currentPage");
	
	//db에 저장
	AnswerDao dao = new AnswerDao();
	dao.insertAnswer(dto);
	
	//보던 목록 페이지로
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage=" + currentPage);
%>