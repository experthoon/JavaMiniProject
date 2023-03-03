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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    body{
    	
    }
    </style>
</head>
<%
	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//세션
	String loginok = (String)session.getAttribute("loginok");
	String myid = (String)session.getAttribute("myid");
%>
<body>
	<table class = "table table-bordered" style = "width:500px;">
	<%
		for(MemberDto dto:list)
		{%>
		
		<%
			//로그인중이면서 로그인한 아이디와 같은사람만 보기
			if(loginok!=null && dto.getId().equals(myid)){%>
					
			<tr>
				
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getHp() %></td>
				<td><%=dto.getAddr() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=sdf.format(dto.getGaipday()) %></td>
				<td>
					<button type="button" class="btn btn-danger btn-xs"
						 onclick="location.href='member/memberdelete.jsp?num=<%=dto.getNum()%>'">수정</button>	
					<button type="button" class="btn btn-danger btn-xs"
						 onclick="location.href='member/memberdelete.jsp?num=<%=dto.getNum()%>'">삭제</button>	
				</td>
			</tr>
					
			<%}
		%>
		
		
			
		<%}
		%>
	</table>
</body>
</html>