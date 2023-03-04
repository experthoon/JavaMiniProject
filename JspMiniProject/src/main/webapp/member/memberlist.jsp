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
<style type="text/css">
	th,td{
	   text-align: center;
	}
</style>
<script type="text/javascript">
   function delfunc(num){
	   
	   var yes=confirm("정말 강퇴처리 하시겠습니까?");
	   
	   if(yes)
		   location.href='member/memberdelete.jsp?num='+num;
   }
</script>
</head>
<%
//전체멤버 정보 가져오기
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
int no=1;
%>
<body>
<table class="table table-bordered" style="width: 1000px;">
   <caption><b>전체회원목록</b></caption>
     <tr bgcolor="#fff0f5" >
       <th width="80">번호</th>
       <th width="120">회원명</th>
       <th width="100" >아이디</th>
       <th width="220">헨드폰</th>
       <th width="480">주소</th>
       <th width="260">이메일</th>
       <th width="220">가입일</th>
       <th width="160">편집</th>
     </tr>
     <%
     for(MemberDto dto:list)
     {%>
    	 <tr>
    	    <td><%=no++ %></td>
    	    <td><%=dto.getName() %></td>
    	    <td><%=dto.getId() %></td>
    	    <td><%=dto.getHp() %></td>
    	    <td><%=dto.getAddr() %></td>
    	    <td><%=dto.getEmail() %></td>
    	    <td><%=sdf.format(dto.getGaipday()) %></td>
    	    <td>
    	       
    	       <button type="button" class="btn btn-danger btn-xs"
    	       onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
    	    </td>
    	 </tr>
     <%}
     %>
</table>
</body>
</html>