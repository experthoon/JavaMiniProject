<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
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

</head>
<%
//전체멤버 정보 가져오기
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//세션
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
%>
<body>
<table class="table table-bordered" style="width: 500px;">
	<%
     for(MemberDto dto:list)
     {%>
     
     <%
     //로그인중이면서 로그인한 아이디와 같은사람만 보기
     if(loginok!=null && dto.getId().equals(myid)){%>
    	 
    	 <tr>
    	    
    	    <td><%=dto.getName() %><br>
    	    <%=dto.getId() %><br>
    	    <%=dto.getHp() %><br>
    	    <%=dto.getAddr() %><br>
    	    <%=dto.getEmail() %><br>
    	    <%=sdf.format(dto.getGaipday()) %><br>
    	    <div style="float: right;">
    	    	<button type="button" class="btn btn-danger btn-xs"
    	       onclick="delfunc(<%=dto.getNum()%>)">수정</button>
    	       
    	       	<button type="button" class="btn btn-danger btn-xs"
    	       onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
    	     </div>
    	    </td>
    	 </tr>
     <%}
     %>
     
     
    	 
     <%}
     %>
</table>
</body>
</html>