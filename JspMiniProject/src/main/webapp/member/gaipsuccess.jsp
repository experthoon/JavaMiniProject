<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
		MemberDao dao = new MemberDao();
		
		String name = dao.getName(id);
	%>
	
	<div>
		<img alt = "" src = "image2/s6.JPG">
		<b><%=name %>님의 회원가입을 축하합니다</b>
		<br><br>
		
		<button type = "button" class = "btn btn-success"
		onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
		
		<button type = "button" class = "btn btn-success"
		onclick="location.href='index.jsp'">Home</button>
	</div>
</body>
</html>