<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//db에 저장할 id 가져오기
	String myid = (String)session.getAttribute("myid");

	//이미지가 업로드되는 실제경로
	String realPath = getServletContext().getRealPath("../save");
	System.out.print(realPath);
	
	int uploadSize=1024*0124*2; //2mb
	MultipartRequest multi = null;
	
	try{
	multi = new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	
	//multi변수로 모든 폼 데이터 읽어오기
	String content = multi.getParameter("content");
	String photoname = multi.getFilesystemName("photo");
	
	//dto에 저장
	GuestDto dto = new GuestDto();
	dto.setMyid(myid);
	dto.setContent(content);
	dto.setPhotoname(photoname);
	
	//dao
	GuestDao dao = new GuestDao();
	dao.insertGuest(dto);
	
	//방명록 목록으로 이동
	response.sendRedirect("../index.jsp?main=guest/gusetlist.jsp");
	}catch(Exception e){
		System.out.println("업로드 오류: " + e.getMessage());
	}
	
%>