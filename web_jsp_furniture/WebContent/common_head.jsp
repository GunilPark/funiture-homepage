<%@ page pageEncoding="UTF-8"%>
<%
	String sessionId    = (String)session.getAttribute("sessionId");
	String sessionName  = (String)session.getAttribute("sessionName");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	
	if(sessionId == null){
		sessionId = "";
		sessionName = "";
		sessionLevel = "";
	}
	
%>	
	
<html>
<head>
<link href="../css/sub_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>

</head>
<body>
	<div id="container">

		<div id="b_top_menu">
				<ul class="top_menu">
					<%  if(sessionLevel.equals("top")){ %>
						<li><a href="../member/member_list.jsp">Admin</a></li>
					<%	} %>
					
					<%  if(sessionId.equals("")){ %>
						<li><a href="../member/member_join.jsp">Join</a></li>						
						<li><a href="../member/member_login.jsp">Login</a></li>
					<%	} else { %>
						<li><a href="../member/member_view.jsp">MyInfo</a></li>
						<li><a href="../member/member_logout.jsp">Logout</a></li>
					<%	} %>

					<li><a href="../index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				</ul>
		</div>	

		<div id="b_top">
			<ul class="main_menu">
				<li><a href="">Office</a>
					<div>
						<ul>
							<li><a href="">Bells</a></li>
							<li><a href="">Camping</a></li>
							<li><a href="">Embrocation</a></li>
							<li><a href="">Fenders</a></li>
							<li><a href="">Kickstands</a></li>
							<li><a href="">Horns</a></li>
						</ul>
					</div>
				</li>
				<li><a href="">Wooden</a>
					<div>
						<ul>
							<li><a href="">BMX</a></li>
							<li><a href="">Cyclocross</a></li>
							<li><a href="">Forks</a></li>
							<li><a href="">Frames</a></li>
						</ul>
					</div>
				
				</li>
				<li><a href="">Sofa</a>
					<div class="div3">
						<ul>
							<li><a href="">3sub menu 1</a></li>
							<li><a href="">3sub menu 2</a></li>
							<li><a href="">3sub menu 3</a></li>
						</ul>
					</div>				
				</li>
				<li><a href="">kKtchen</a>
					<div class="div4">
						<ul>
							<li><a href="">4sub menu 1</a></li>
							<li><a href="">4sub menu 2</a></li>
							<li><a href="">4sub menu 3</a></li>
							<li><a href="">4sub menu 4</a></li>
							<li><a href="">4sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="">Chiffonier</a>
					<div class="div5">
						<ul>
							<li><a href="">5sub menu 1</a></li>
							<li><a href="">5sub menu 2</a></li>
							<li><a href="">5sub menu 3</a></li>
							<li><a href="">5sub menu 4</a></li>
							<li><a href="">5sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="">Chair</a>
					<div class="div6">
						<ul>
							<li><a href="">6sub menu 1</a></li>
							<li><a href="">6sub menu 2</a></li>
							<li><a href="">6sub menu 3</a></li>
							<li><a href="">6sub menu 4</a></li>
							<li><a href="">6sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="../notice/notice_list.jsp">Notice & News</a>
					<div class="div7">
						<ul>
							<li><a href="../notice/notice_list.jsp">NOTICE</a></li>
							<li><a href="../news/news_list.jsp">NEWS</a></li>
							<li><a href="../qanda/qanda_list.jsp">Q AND A</a></li>
							<li><a href="../freeboard/freeboard_list.jsp">FREE BOARD</a></li>
							<li><a href="../etc/etc_list.jsp">ETC</a></li>
						</ul>
					</div>					
				</li>
			</ul>		
		</div>	