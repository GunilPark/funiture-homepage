<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common_head.jsp" %>
<%@page import="dto.*,dao.*,common.*,java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
ArrayList<Free_dto> dtos = dao.getList();


%>
		<div id="b_left">
			<P>FREE BOARD</P>
			<ul>
				<li><a href="/notice/notice_list.jsp"> NOTICE</a></li>
				<li><a href="/news/news_list.jsp">NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				FREE BOARD
			</p>
			<p class="select_box">
				<select class="sel_box">
					<option>Title</option>
					<option>Content</option>
				</select>
				<input type="text" class="sel_text">

				<button type="submit" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="65%">
					<col width="10%">
					<col width="14%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
					<% for(int k =0; k<dtos.size(); k++){%>
					<tr>
						<th><%=dtos.get(k).getNo() %></th>
						<th><%=dtos.get(k).getTitle() %></th>
						<th><%=dtos.get(k).getReg_name() %></th>
						<th><%=dtos.get(k).getReg_date() %></th>
						<th><%=dtos.get(k).getHit() %></th>
					</tr>
				<%} %>	
				</tbody>
			</table>
			
			<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="" class="active">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				
<%
if(!sessionLevel.equals("")){
%>
				<a href="freeboard_write.jsp" class="write">글쓰기</a>
<%} %>
			</div>
		</div>	
	
	<%@ include file="../common_footer.jsp" %>
		</div>	
	</div>	
</body>
</html>

<script type="text/javascript">
    //<![CDATA[
    $(function(){
    	$(".main_menu > li > a").mouseover(function(){
			$(".main_menu li div").hide();
			$(this).next().slideDown(500);
    	});    
    	$(".main_menu").mouseleave(function(){
			$(".main_menu li div").stop().slideUp(500);
		}) 
    });     
    //]]>
</script> 




