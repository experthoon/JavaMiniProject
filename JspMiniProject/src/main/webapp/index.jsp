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
	font-size:25px;
	top: 10px;
	
	text-align : center;
}
div.menu{
 	width: 100%;
 	height: 80px;
 	font-size: 20px;
 	top: 190px;
 	text-align : center;
 	
}
div.info{
	width: 170px;
 	height: 200px;
 	line-height: 10px;
 	font-size: 15pt;
 	top: 280px;
 	border: 1px solid gray;
 	border-radious: 20px;
 	left: 50px;
 	padding: 20px 10px;
 	
}
div.main{
	width: 1200px;
 	height: 800px;
 	font-size: 12pt;
 	top: 280px;
 	left: 300px;
 	
}
</style>
</head>
	<%
		String mainPage = "layout/main.jsp";
	
		//url을 통해서 main값을 얻어서 메인페이지에 출력한다
		if(request.getParameter("main")!=null)
		{
			mainPage = request.getParameter("main");
		}
		//프로젝트 경로구하기
		String root = request.getContextPath();
	%>
<body>
	<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
	</div>
	
	<div class = "layout menu">
	<jsp:include page="layout/menu.jsp"/>
	</div>
	
	<div class = "layout info">
	<jsp:include page="layout/info.jsp"/>
	</div>
	
	<div class = "layout main">
	<jsp:include page="<%=mainPage %>"/>
	</div>
	
</body>
</html>