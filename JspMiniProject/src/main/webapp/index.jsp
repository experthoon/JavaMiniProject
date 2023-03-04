<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<style type="text/css">
div.layout{
	border: 0px solid gray;
	position: absolute;
	font-family: 'Gamja Flower';
}
div.title{
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 25px;
	text-align: center;
	
}
div.menu{
	width: 100%;
	height: 80px;
	font-size: 25pt;
	top: 120px;
	text-align: center;
}
div.info{
	width: 170px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	top: 280px;
	border: 1px solid gray;
	border-radius: 20px;
	left: 80px;
	padding: 20px 10px;
	
}
div.main{
	
	width: 1200px;
	height: 800px;
	font-size: 15pt;
	top: 280px;
	left: 350px;
	padding-left: 100px;
}
</style>
</head>
<%
	String mainPage="layout/main.jsp";
    //url을 통해서 main값을 읽어서 메인페이지에 출력을한다
    if(request.getParameter("main")!=null)
    {
    	mainPage=request.getParameter("main");
    }
 String root=request.getContextPath();
%>
<body>
<div class="layout title">
  <jsp:include page="layout/title.jsp"/>
</div>

<div class="layout menu">
  <jsp:include page="layout/menu.jsp"/>
</div>

<div class="layout info">
  <jsp:include page="layout/info.jsp"/>
</div>

<div class="layout main">
   <jsp:include page="<%=mainPage %>"/>
</div>
</body>
</html>