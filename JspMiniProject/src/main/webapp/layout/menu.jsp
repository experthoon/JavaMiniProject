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
	<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
    
	<script type="text/javascript" src="menu/js/jquery.js"></script>
	<script type="text/javascript" src="menu/js/function.js"></script>
</head>
	<%
		//프로젝트 경로구하기
		String root = request.getContextPath();
	
		//아이디 
		String myid = (String)session.getAttribute("myid");
		//로그인상태
		String loginok = (String)session.getAttribute("loginok");

	%>
<body>
	<!--  <a href="<%=root%>/index.jsp?">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=login/loginmain.jsp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=member/addform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=member/memberlist.jsp">회원목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">스마트게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">상품등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="http://www.freshdesignweb.com"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root%>/index.jsp?">Home</a></li>
					<li class="parent">
						<a href="http://www.freshdesignweb.com/responsive-drop-down-menu-jquery-css3-using-icon-symbol.html">aboutMember</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i class="icon-wrench"></i> 로그인</a></li>
							<li><a href="<%=root%>/index.jsp?main=member/addform.jsp"><i class="icon-credit-card"></i>회원가입</a></li>
							<li><a href="index.jsp?main=member/myinfo.jsp"><i class = "icon-credit-card"></i> 마이정보</a></li>
							
							<%
								//로그인중이고 그 아이디가 관리자
								if(loginok!=null && myid.equals("admin")){%>
									<li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i class="icon-gift"></i>회원목록</a></li>
								<%}
							%>
							
							
							
						</ul>
					</li>
					<li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a></li>
					<li class="parent">
						<a href="#">Board</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A게시판</a></li>
							<li><a href="#">업로드 게시판</a></li>
							<li><a href="#">스마트 게시판</a></li>
							
						</ul>
					</li>
					<li><a href="#">SHOP</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</body>
</html>