<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*, java.util.*" %>
<%@ include file="../common_head.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	String line = request.getParameter("t_line");
	if(line == null){
		line = "10";
	}

	/* paging 설정 start*/
	String nowPage = request.getParameter("t_nowPage");
	int current_page = 0; // 현재페이지 번호
	int total_page = 0;    // 전체 페이지 수
	int total_count = dao.getTotalCount(); // 전체 행수 21
	int list_setup_count = Integer.parseInt(line);  //한페이지당 출력 행수 

	if(nowPage == null || nowPage.equals("")) current_page = 1; 
	else current_page = Integer.parseInt(nowPage);

	total_page = total_count / list_setup_count;  // 몫 : 2
	int rest =    total_count % list_setup_count;   // 나머지:1
	if(rest !=0) total_page = total_page + 1;     // 3

	int start = (current_page -1) * list_setup_count + 1;
	int end   = current_page * list_setup_count;
	/* paging 설정 end*/
	
	
	ArrayList<Furniture_dto> dtos = dao.getFurnitureList(start, end);

%>


<div id="b_left">
			<P>Furniture</P>
			<ul>
				<li><a href="/admin/admin_list.jsp"> admin</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> furniture</a></li>
					
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				FURNITURE
			<select id="select" style="float:right;" name="t_line">
				<option <%if(line.equals("3")){out.print("selected");} %> value="3">3줄씩 보기</option>
				<option <%if(line.equals("6")){out.print("selected");} %> value="6">6줄씩 보기</option>
				<option <%if(line.equals("10")){out.print("selected");} %> value="10">10줄씩 보기</option>
				<option <%if(line.equals("15")){out.print("selected");} %> value="15">15줄씩 보기</option>
				<option <%if(line.equals("20")){out.print("selected");} %> value="20">20줄씩 보기</option>
			</select>
			</p>
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="30%">
					<col width="30%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Image</th>
						<th>Product Name</th>
						<th>Order</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
					</tr>
				</thead>				
				<tbody>
				<%for(int k = 0; k < dtos.size(); k++){ %>
					<tr>
						<td><%=dtos.get(k).getNo()%></td>
						<td style="width:; height:100px;"><a href="furniture_view.jsp?t_no=<%=dtos.get(k).getNo()%>"><img src="/attach/furniture/<%=dtos.get(k).getAttach()%>" style="width:100px;"></a></td>
						<td><a href="furniture_view.jsp?t_no=<%=dtos.get(k).getNo()%>"><%=dtos.get(k).getP_name()%></a></td>
						<td><%=dtos.get(k).getImg_order()%></td>
						<td><%=dtos.get(k).getReg_id()%></td>
						<td><%=dtos.get(k).getReg_date()%></td>
					</tr>	
				<%} %>
				</tbody>
			</table>
			<div class="paging">
				
			<%
			String pageDisplay = CommonUtil.pageListPost(current_page, total_page, 2);
			out.print(pageDisplay);
			//System.out.print(pageDisplay);
			%>
			

			<% if(sessionLevel.equals("top")){ %>
					<a href="furniture_write.jsp" class="write">글쓰기</a>
			<% } %>
				</div>
		</div>	
		
	
		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>

<form name="view">
<input type="hidden" name="t_no" value="">
</form>

<form name="pageForm">
   <input type="hidden" name="t_nowPage">
</form>
<form name="lineChange">
	<input type="hidden" name="t_line" value="">
</form>

<script type="text/javascript">
$("#select").on("change",function(){
	lineChange.t_line.value = $(this).val();
	lineChange.method="post";
	lineChange.action="furniture_list.jsp";
	lineChange.submit(); 
})


function goPage(pageNumber){
    pageForm.t_nowPage.value = pageNumber;
    pageForm.method="post";
    pageForm.action="furniture_list.jsp";
    pageForm.submit();      
 }
function goView(no){
	view.t_no.value = no;
	view.action = "notice_view.jsp?t_no="+no;
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