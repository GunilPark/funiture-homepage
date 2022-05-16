<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*,java.util.*"  %>    
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();

String no = request.getParameter("t_no");
dao.setHitCount(no);

Free_dto dto = dao.getView(no);
if(dto == null){
	%>
	<script>
	alert("삭제된 글이거나 존재하지 않는 게시글입니다.")
	location.href="freeboard_list.jsp";
	</script>
	<% }%>
<%@ include file="../common_head.jsp" %>  
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.jsp">NOTICE</a></li>
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
			
			<table class="boardForm">
				<colgroup>
					<col width="20%">
					<col width="55%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="2"><%=dto.getTitle() %></td>
						<td> <i class="far fa-eye"></i> <%=dto.getHit() %></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3">
							<textarea name="t_content" readonly class="textArea_H250_noBorder" readonly><%=dto.getContent() %></textarea>
						</td>
					</tr>	
				
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_name()%></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date()%></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<%if(sessionId.equals(dto.getReg_id())||sessionLevel.equals("top")){ %>
				<a href="javascript:goDelete()" class="butt">Delete</a>
				<a href="freeboard_update.jsp?t_no=<%=dto.getNo()%>" class="butt">Update</a>
				<%} %>
				<a href="freeboard_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
<form name="free">
<input name="t_no" value="<%=no%>">
</form>

</html>


<script type="text/javascript">

function goDelete(){
	var goYesNo = confirm("정말삭제하시겠습니까?");
	if(goYesNo){
		free.method="post";
		free.action="db_freeboard_delete.jsp";
		free.submit();
	}	
}


</script>





