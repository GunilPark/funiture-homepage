<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common_head.jsp" %>
<%@page import="dto.*,dao.*,common.*,java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Free_dao dao = new Free_dao();
	String select = request.getParameter("t_select");
	String search = request.getParameter("t_search");
	if(select == null){
		select = "title";
	}
	
	if(search == null){
		search = "";
	}

   /* paging 설정 start*/
	String nowPage = request.getParameter("t_nowPage");
	int current_page = 0; // 현재페이지 번호
	int total_page = 0;    // 전체 페이지 수
	int total_count = dao.getTotalCount(select, search); // 전체 행수 21
	int list_setup_count = 3;  //한페이지당 출력 행수 
	
	if(nowPage == null || nowPage.equals("")) current_page = 1; 
	else current_page = Integer.parseInt(nowPage);
	
	total_page = total_count / list_setup_count;  // 몫 : 2
	int rest =    total_count % list_setup_count;   // 나머지:1
	if(rest !=0) total_page = total_page + 1;     // 3
	
	int start = (current_page -1) * list_setup_count + 1;
	int end   = current_page * list_setup_count;
	/* paging 설정 end*/
	int headNum = total_count-((current_page-1)*list_setup_count);
	ArrayList<Free_dto> dtos = dao.getList(select, search, start, end);

%>
		<div id="b_left">
			<P>FREE BOARD</P>
			<ul>
				<li><a href="../notice/notice_list.jsp"> NOTICE</a></li>
				<li><a href="../news/news_list.jsp">NEWS</a></li>
				<li><a href="../qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="../freeboard/freeboard_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>FREE BOARD</a></li>
				<li><a href="../etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				FREE BOARD
			</p>
			<form name="free" method="post" action="freeboard_list.jsp">
			<p class="select_box">
				<select name="t_select" class="sel_box">
					<option value="title" <%if(select.equals("title"))out.print("selected"); %>>Title</option>
					<option value="content" <%if(select.equals("content"))out.print("selected"); %>>Content</option>
				</select>
				<input name="t_search" type="text" class="sel_text">

				<button type="submit" class="sel_button"><i class="fa fa-search"></i>SEARCH</button>
			</p>
			</form>
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="5%">
					<col width="10%">
					<col width="15%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Attach</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
					<% for(int k =0; k<dtos.size(); k++){%>
					<tr>
						<th><a href="freeboard_view.jsp?t_no=<%=dtos.get(k).getNo()%>"><%=headNum-k %></a></th>
						<th><a href="javascript:goView('<%=dtos.get(k).getNo()%>')"><%=dtos.get(k).getTitle() %></a></th>
						<th>
						<%if(dtos.get(k).getAttach() != null){ %>
						<img src="../images/clip.png">
						<%}%>
						</th>
						<th><%=dtos.get(k).getReg_name() %></th>
						<th><%=dtos.get(k).getReg_date() %></th>
						<th><%=dtos.get(k).getHit() %></th>
					</tr>
				<%} %>	
				</tbody>
			</table>
			
			<div class="paging">
			<%
			out.print(CommonUtil.pageListPost(current_page, total_page, 2));
			%>
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
<form name="pageForm">
   <input type="hidden" name="t_nowPage">
   <input type="hidden" name="t_select" value="<%=select%>">
   <input type="hidden" name="t_search" value="<%=search%>">
</form>
<form name="view">
<input type="hidden" name="t_no">
</form>


<script type="text/javascript">
function goPage(pageNumber){
    pageForm.t_nowPage.value = pageNumber;
    pageForm.method="post";
    pageForm.action="freeboard_list.jsp";
    pageForm.submit();      
 }

function goView(no){
	view.t_no.value = no;
	view.action = "freeboard_view.jsp?t_no="+no;
	view.submit();
}
</script> 




