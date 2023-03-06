<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
   //db삭제뿐아니라 업로드된 파일도 삭제해보자
   String num=request.getParameter("num");
   String currentPage=request.getParameter("currentPage");
   
   //db로부터 저장된 이미지명 얻기
   GuestDao dao=new GuestDao();
   String photoname=dao.getData(num).getPhotoname();
   
   //db삭제
   dao.deleteGuest(num);
   
   //프로젝트 경로
   String realPath=getServletContext().getRealPath("/save");
   //파일객체생성
   File file=new File(realPath+"\\"+photoname);
   
   //파일삭제
   file.delete();
   
   //보던페이지로 이동
   response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
%>