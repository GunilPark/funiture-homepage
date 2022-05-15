<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,java.util.*" %>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>
<%
request.setCharacterEncoding("utf-8");
Etc_dao dao = new Etc_dao();
String select = request.getParameter("t_select");
String search = request.getParameter("t_search");
if(select == null){
	select = "title";
	search = "";
}
ArrayList<Etc_dto> dtos = dao.etcList(select, search);


%>
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="/notice/notice_list.jsp">NOTICE</a></li>
				<li><a href="/news/news_list.jsp">NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				ETC
			</p>
			<form name="etc" method="post" action="ect_list.jsp">
			<p class="select_box">
				<select name="t_select" class="sel_box">
					<option value="title">Title</option>
					<option value="content">Content</option>
				</select>
				<input name="t_search" type="text" class="sel_text">

				<button type="submit" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>
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
				<%for(int k = 0; k < dtos.size(); k++){ %>
					<tr>
						<td><%=dtos.get(k).getNo() %></td>
						<td class="t_center"><a href="etc_view.jsp"><%=dtos.get(k).getTitle() %></a></td>
						<td><%=dtos.get(k).getReg_name() %></td>
						<td><%=dtos.get(k).getReg_date() %></td>
						<td><%=dtos.get(k).getHit() %></td>
					</tr>	
				<% } %>
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
				<%if(sessionLevel.equals("top")||sessionLevel.equals("manager")){%>
				<a href="etc_write.jsp" class="write">글쓰기</a>
				<%} %>
			</div>
		</div>	
	<%@ include file="/common_footer.jsp" %>
			
		</div>	
	</div>	
</body>
</html>






