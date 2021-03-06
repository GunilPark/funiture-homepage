<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*,java.util.*"  %>    
<%
request.setCharacterEncoding("utf-8");
Notice_dao dao = new Notice_dao();

String no = request.getParameter("t_no");
System.out.print(no);

dao.setHitCount(no);

Notice_dto dto = dao.getView(no);
if(dto == null){
	%>
	<script>
	alert("삭제된 글이거나 존재하지 않는 게시글입니다.")
	location.href="notice_list.jsp";
	</script>
	<% 

	
}else{

%>
<%@ include file="../common_head.jsp" %>  
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="../notice/notice_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="../news/news_list.jsp">NEWS</a></li>
				<li><a href="../qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="../freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="../etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="55%">
					<col width="10%">
					<col width="20%">
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
							<textarea name="t_content" class="textArea_H250_noBorder" readonly><%=dto.getContent() %></textarea>
						</td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3">
						<%if(dto.getAttach() != null){ %>
						<a href="/common/filedown.jsp?t_fileDir=notice&t_file=<%=dto.getAttach()%>"><%=dto.getAttach() %></a>
						<%} %>
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_id() %></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date() %></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<%if(sessionLevel.equals("top")){ %>
				<a href="javascript:goDelete()" class="butt">Delete</a>
				<a href="notice_update.jsp?t_no=<%=dto.getNo()%>" class="butt">Update</a>
				<%} %>
				<a href="notice_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
	</div>	
</body>
<form name=noti>
<input name="t_no" value="<%=no%>">
<input name="t_delete_attach" value="<%=CommonUtil.checkNull(dto.getAttach())%>">
</form>
<form name="attach">
<input type="hidden" name="t_fileDir" value="notice">
<input type="hidden" name="t_file" value="">
</form>
</html>


<script type="text/javascript">

function goDelete(){
	var goYesNo = confirm("정말삭제하시겠습니까?");
	if(goYesNo){
		noti.method="post";
		noti.action="db_notice_delete.jsp";
		noti.submit();
	}	
}

function getAttach(attach){
	
	alert(attach);
	attach.t_file.value=attach;
	alert("진행2");
	attach.action="/common/filedown.jsp?t_fileDir=notice&t_file"+attach;
	alert("진행3");
	attach.submit();
}

</script>


<%} %>




