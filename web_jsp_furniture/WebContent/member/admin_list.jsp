<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*,java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
Member_dao dao = new Member_dao();
String select = request.getParameter("t_select");
String search = request.getParameter("t_search");
if(select == null){
	select = "id";
}
	
if(search == null){
	search = "";
}

/* paging 설정 start*/
String nowPage = request.getParameter("t_nowPage");
int current_page = 0; // 현재페이지 번호
int total_page = 0;    // 전체 페이지 수
int total_count = dao.getTotalCount(select, search); // 전체 행수 21
int list_setup_count = 5;  //한페이지당 출력 행수 

if(nowPage == null || nowPage.equals("")) current_page = 1; 
else current_page = Integer.parseInt(nowPage);

total_page = total_count / list_setup_count;  // 몫 : 2
int rest =    total_count % list_setup_count;   // 나머지:1
if(rest !=0) total_page = total_page + 1;     // 3

int start = (current_page -1) * list_setup_count + 1;
int end   = current_page * list_setup_count;
/* paging 설정 end*/

ArrayList<Member_dto> dtos = dao.getList(select, search, start, end);
int headNum = total_count-((current_page-1)*list_setup_count);

%>
<%@ include file="/common_head.jsp" %> 
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="/notice/notice_list.jsp"> NOTICE</a></li>
				<li><a href="/news/news_list.jsp">NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		<div id="b_right">
			<p class="n_title">
				Admin
			</p>
			<form name="admin" method="post" action="admin_list.jsp">
			<p class="select_box">
				<select class="sel_box" name="t_select">
					<option value="name">Name</option>
					<option value="id">Id</option>
				</select>
				<input type="text" name="t_search" class="sel_text">
				<button type="submit" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>
	
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>no</th>
						<th>ID</th>
						<th>Name</th>
						<th>Area</th>
						<th>Level</th>
						<th>Reg Date</th>
					</tr>
				</thead>
				<tbody>
				<%for(int k = 0; k < dtos.size(); k++){ %>
					<tr>
						<td><a href="javascript:goView('<%=dtos.get(k).getId()%>')"><%=headNum-k %></a></td>
						<td class="t_center">
						<a href="javascript:goView('<%=dtos.get(k).getId()%>')"><%=dtos.get(k).getId()%></a></td>
						<td><%=dtos.get(k).getName() %></td>
						<td><%=dtos.get(k).getArea() %></td>
						<td><%=dtos.get(k).getLevel_gubun() %></td>
						<td><%=dtos.get(k).getReg_date() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>
			<div class="paging">
			<!--
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="" class="active">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
			!-->	
			<%
			String pageDisplay = CommonUtil.pageListPost(current_page, total_page, 2);
			out.print(pageDisplay);
			//System.out.print(pageDisplay);
			%>
				
			</div>
		</div>	
	
		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>

<form name="view">
<input name="t_id" type="hidden">
</form>

<form name="pageForm">
   <input type="hidden" name="t_nowPage">
   <input type="hidden" name="t_select" value="<%=select%>">
   <input type="hidden" name="t_search" value="<%=search%>">
</form>

<script type="text/javascript">

function goPage(pageNumber){
    pageForm.t_nowPage.value = pageNumber;
    pageForm.method="post";
    pageForm.action="admin_list.jsp";
    pageForm.submit();      
 }
 
function goView(id){
	view.t_id.value = id;
	view.action = "member_view.jsp?t_id="+id;
	view.submit();
}


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