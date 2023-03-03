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
	
</head>
<%
	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no=1;
%>
<body>
	<table class = "table table-bordered" style ="width:900px;">
		<caption><b>전제회원목록</b></caption>
		<tr bgcolor = "skyblue">
			<th width="60">번호</th>
			<th width="120">회원명</th>
			<th width="160">아이디</th>
			<th width="160">핸드폰</th>
			<th width="260">주소</th>
			<th width="260">이메일</th>
			<th width="260">가입일</th>
			<th width="160">편집</th>
		</tr>
		<%
		for(MemberDto dto:list)
		{%>
			<tr align = "center">
				<td><%=no++ %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getHp() %></td>
				<td><%=dto.getAddr() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=sdf.format(dto.getGaipday()) %></td>
				<td>
					
					<button type="button" class="btn btn-danger btn-xs"
						 onclick="location.href='member/memberdelete.jsp?num=<%=dto.getNum()%>'">삭제</button>	
				</td>
			</tr>
		<%}
		%>
	</table>
</body>
</html>