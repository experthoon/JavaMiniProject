<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
   span.day{
   	float: right;
   	font-size: 11pt;
   	color: gray;
   }
</style>
</head>
<%
   //로그인상태 확인후 입력폼 나타내기
   String loginok=(String)session.getAttribute("loginok");
   //id
   String myid=(String)session.getAttribute("myid");
		GuestDao dao=new GuestDao();
		
		//List<SimpleDto> list=dao.getAllBoarddatas();
		
		int totalCount;
		int totalPage; //총 페이지수
		int startPage; //각블럭의 시작페이지
		int endPage;  //각 블럭의 마지막페이지
		int start;  //각페이지 시작번호
		int perPage = 3;  //현제페이지 보여질 글의 갯수
		int perBlock = 5;  //한블럭당 보여지는 페이지개수
		int currentPage;  //현재페이지
		int no;
		
		//총갯수
		totalCount=dao.getTotalCount();
		
		//현재 페이지번호 읽기
		if (request.getParameter("currentPage") == null)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//총 페이지 갯수
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		
		//각 블럭의 시작페이지
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;
		
		//총페이지가 8... (6-10... endpage를 8로 수정)
		if (endPage > totalPage)
			endPage = totalPage;
		
		//각페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;
		
		//각 페이지 에서 필요한 개시글 가져오기
		List<GuestDto> list=dao.getList(start, perPage);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//no=totalCount-(currentPage-1)*perPage;
		
%>
<body>
  <%
    if(loginok!=null){%>
    	
    	<jsp:include page="addform.jsp"/>
    	<hr align="left" width="800">
    <%}
  %>
  
  <div>
  	  <b>총 <%=totalCount %>개의 방명록 글이 있습니다</b>
  	  <%
  	    MemberDao mdao=new MemberDao();
  	  
  	  	for(GuestDto dto:list)
  	  	{
  	  		//이름얻기
  	  		String name=mdao.getName(dto.getMyid());
  	  		%>
  	  		
  	  		<table class="table" style="width: 600px;">
  	  		  <tr>
  	  		    <td>
  	  		    <b><span class="glyphicon glyphicon-user"></span>
  	  		      <%=name %>(<%=dto.getMyid() %>)</b>
  	  		      
  	  		      <%
  	  		        //로그인한 아이디와 글을쓴아이디가 같을경우에만 수정삭제 보이게..(자기글만)
  	  		        if(loginok!=null && dto.getMyid().equals(myid)){%>
  	  		        	
  	  		        	| <a href="" style="color: black;">수정</a>
  	  		        	| <a href="" style="color: black;">삭제</a>
  	  		        <%}
  	  		      %>
  	  		      <span class="day"><%=sdf.format(dto.getWriteday()) %></span>
  	  		    </td>
  	  		  </tr>
  	  		  
  	  		  <tr>
  	  		    <td>
  	  		      <!-- 이미지가 null아닌경우만 출력 -->
  	  		      <%
  	  		        if(dto.getPhotoname()!=null){%>
  	  		        	
  	  		        	<a href="save/<%=dto.getPhotoname()%>" target="_blank">
  	  		        	<img alt="" src="save/<%=dto.getPhotoname()%>" align="left"
  	  		        	style="width: 100px;"></a>
  	  		        <%}
  	  		      %>
  	  		      
  	  		      <%=dto.getContent().replace("\n","<br>")%>
  	  		    </td>
  	  		  </tr>
  	  		  
  	  		  
  	  		</table>
  	  	<%}
  	  %>
  </div>
  
  <!-- 페이징 처리 -->
	<div style="width: 500px; text-align: center;"  >
		<ul class="pagination">
			<%
			
			//이전
			if(startPage>1){
				%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
				</li>
			<%}
			
			
			for(int pp=startPage;pp<=endPage;pp++){
				
				if(pp==currentPage){
					%>
					<li class="active">
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<% } else{
					%>
					<li>
						<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
					</li>
				<%}
				
			}
			
			//다음
			if(endPage<totalPage){
				%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
				</li>
			<%}
			%>
		</ul>
	</div>
  
</body>
</html>