<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,java.util.*" %>    
<%

	String sessionId    = (String)session.getAttribute("sessionId");
	String sessionName  = (String)session.getAttribute("sessionName");
	String sessionLevel = (String)session.getAttribute("sessionLevel");

	
	if(sessionId == null){
		sessionId   ="";
		sessionName ="";
		sessionLevel="";
	}
	//notice리스트
	Notice_dao dao = new Notice_dao();
	ArrayList<Notice_dto> dtos = dao.getList("a.title", "", 1, 7);
	
	//furniture리스트
	Member_dao Mdao = new Member_dao();
	ArrayList<Furniture_dto> Mdtos = Mdao.getFurnitureList();
%>    
<html>
<head>
<link href="css/index_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>	
<title>박건일</title>
<script type="text/javascript">
	$(function(){
		$(".main_menu > li > a").hover(function(){
			$(this).css("font-weight","bold");
		},function(){
			$(this).css("font-weight","");
		});		
		
		$(".bu_1").mouseover(function(){
			var imgName = $(this).attr('src');
			if(imgName =="images/bu_01.jpg"){
				$(this).attr("src","images/bu_01_over.jpg");
			} else if(imgName =="images/bu_02.jpg"){
				$(this).attr("src","images/bu_02_over.jpg");
			} else if(imgName =="images/bu_03.jpg"){
				$(this).attr("src","images/bu_03_over.jpg");
			} else if(imgName =="images/bu_04.jpg"){
				$(this).attr("src","images/bu_04_over.jpg");
			} else if(imgName =="images/bu_05.jpg"){
				$(this).attr("src","images/bu_05_over.jpg");
			} else if(imgName =="images/bu_06.jpg"){
				$(this).attr("src","images/bu_06_over.jpg");
			}
		});	
		$(".bu_1").mouseout(function(){
			var imgName = $(this).attr('src');
			if(imgName =="images/bu_01_over.jpg"){
				$(this).attr("src","images/bu_01.jpg");
			} else if(imgName =="images/bu_02_over.jpg"){
				$(this).attr("src","images/bu_02.jpg");
			} else if(imgName =="images/bu_03_over.jpg"){
				$(this).attr("src","images/bu_03.jpg");
			} else if(imgName =="images/bu_04_over.jpg"){
				$(this).attr("src","images/bu_04.jpg");
			} else if(imgName =="images/bu_05_over.jpg"){
				$(this).attr("src","images/bu_05.jpg");
			} else if(imgName =="images/bu_06_over.jpg"){
				$(this).attr("src","images/bu_06.jpg");
			}			
		});				

		$(".allclick").click(function(e){
			e.preventDefault();
			$("#disableDiv").css("display","block");
			$("#b_menu_all").slideDown(500);
			$("#b_menu_all").css("z-index","999");
		});
		
		$(".closeclick").click(function(e){
			e.preventDefault();
			$("#b_menu_all").slideUp(500);
			$("#disableDiv").css("display","none");
		});

	});	
	
	
	function goView(no){
		view.t_no.value=no;
		view.method = "post";
		view.action = "notice/notice.view.jsp?t_no="+no;
		view.submit();
	}
	
</script>
</head>
<body>
<form name="view">
<input type="hidden" name="t_no">
</form>
<style>
#disableDiv { position:absolute; left:0; top:0;width:100%; height:1700px; z-index:995 ; background-color:#EEEEEE; filter:Alpha(opacity=80);opacity:0.8; -moz-opaciry:0.8}
</style>
<div id="disableDiv" class="disableDiv" style="display:none"></div>
<div id="container">

	<div id="container_top">	
			<div id="b_top_menu">
				<ul class="top_menu">
					<li><a href="" class="allclick"><i class="fas fa-bars"></i></a></li>
					
					<%  if(sessionLevel.equals("top")){ %>
						<li><a href="admin/admin_list.jsp">Admin</a></li>
					<%	} %>
					
					<%  if(sessionId.equals("")){ %>
						<li><a href="member/member_join.jsp">Join</a></li>						
						<li><a href="member/member_login.jsp">Login</a></li>
					<%	} else { %>
						<li><a href="member/member_view.jsp">MyInfo</a></li>
						<li><a href="member/member_logout.jsp">Logout</a></li>
					<%	} %>
					
					
					<li><a href=""><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				</ul>
			</div>	
	</div>
	<div id="container_bottom">			
		<div id="b_menu_all">		
			<div id="b_menu_all_top">
				<div class="menu1"><a href=""><span class="maintitle">Office</span></a>
					<ul>
						<li>menu1 sub1</li>
						<li>menu1 sub2</li>
						<li>menu1 sub3</li>
						<li>menu1 sub4</li>
						<li>menu1 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Wooden</span></a>
					<ul>
						<li>menu2 sub1</li>
						<li>menu2 sub2</li>
						<li>menu2 sub3</li>
						<li>menu2 sub4</li>
						<li>menu2 sub5</li>
						<li>menu2 sub6</li>
						<li>menu2 sub7</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Sofa</span></a>
					<ul>
						<li>menu3 sub1</li>
						<li>menu3 sub2</li>
						<li>menu3 sub3</li>
						<li>menu3 sub4</li>
						<li>menu3 sub5</li>
						<li>menu3 sub6</li>
						<li>menu3 sub7</li>
						<li>menu3 sub8</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Kitchen</span></a>
					<ul>
						<li>menu4 sub1</li>
						<li>menu4 sub2</li>
						<li>menu4 sub3</li>
						<li>menu4 sub4</li>
						<li>menu4 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Chiffonier</span></a>
					<ul>
						<li>menu5 sub1</li>
						<li>menu5 sub2</li>
						<li>menu5 sub3</li>
						<li>menu5 sub4</li>
						<li>menu5 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href=""><span class="maintitle">Chair</span></a>
					<ul>
						<li>menu6 sub1</li>
						<li>menu6 sub2</li>
						<li>menu6 sub3</li>
						<li>menu6 sub4</li>
						<li>menu6 sub5</li>
					</ul>
				</div>
				<div class="menu1"><a href="notice/notice_list.jsp"><span class="maintitle">Notice & News</span></a>
					<ul>
						<li><a href="notice/notice_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
						<li><a href="news/news_list.jsp">NEWS</a></li>
						<li><a href="qanda/qanda_list.jsp">Q & A</a></li>
						<li><a href="freeboard/freeboard_list.jsp">FREE BOARD</a></li>
						<li><a href="etc/etc_list.jsp">ETC</a></li>
					</ul>
				</div>
				
			</div>
			<div class="menu_close"><a href="#" class="closeclick">[CLOSE]</a></div>
		</div>	
		
		<div id="b_top">
			<div id="b_top_back">
<!--			
				<p class="b_top_text">aaaa</p>
				<p class="b_top_line"></p>
-->				
			</div>
			<ul class="main_menu">
				<li><a href="">오피스</a></li>
				<li><a href="">Wooden</a></li>
				<li><a href="">Sofa</a></li>
				<li><a href="">kKtchen</a></li>
				<li><a href="">Chiffonier</a></li>
				<li><a href="">Chair</a></li>
				<li><a href="notice/notice_list.jsp">Notice & News</a></li>
			</ul>
		</div>
		
		
		<div id="b_top_2">
			<ul class="b_top_menu">
				<li><a href=""><img src="images/bu_01.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_02.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_03.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_04.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_05.jpg" class="bu_1"></a></li>
				<li><a href=""><img src="images/bu_06.jpg" class="bu_1"></a></li>
			</ul>
		</div>	
			
		<hr><br>
		<div id="b_left">
			<p class="left_top">
				<img src="images/left_top.jpg"><a href="notice/notice_list.jsp"><img src="images/left_right.jpg"></a>
			</p>
			<div class="left_middle">
			<%for(int i=0; i<dtos.size(); i++){ %>
				<ul>
					<li class="noti_title"><a href="notice/notice_view.jsp?t_no=<%=dtos.get(i).getNo() %>"><%=dao.sizeDown(dtos.get(i).getTitle()) %></a></li>
					<li class="noti_date"><%=dtos.get(i).getReg_date().substring(2) %></li>
				</ul>
			<% } %>
			</div>
		
		</div>
		<div id="b_center">
			<p class="b_center_top"><img src="images/center_top.jpg"></p>
			<p class="b_center_middle"><%if(Mdtos.size() >= 6){for(int k = 0; k<6; k++){%><a href="/admin/furniture_view.jsp?t_no=<%=Mdtos.get(k).getNo()%>"><img src="/attach/furniture/<%=Mdtos.get(k).getAttach()%>"></a><%}%><%}else if(Mdtos.size()<6){%><%for(int k = 0; k<Mdtos.size(); k++){%><a href="/admin/furniture_view.jsp?t_no=<%=Mdtos.get(k).getNo()%>"><img src="/attach/furniture/<%=Mdtos.get(k).getAttach()%>"></a><%}}%></p>
		</div>
		<div id="b_right">
			<img src="images/center_right.jpg">
		</div>
		<div id="b_bottom_2">
			<a href=""><img src="images/cello.png"></a>
		</div>		
		<%@ include file="common_footer.jsp" %>
		</div>
	</div>
	


</div>	
</body>
</html>
