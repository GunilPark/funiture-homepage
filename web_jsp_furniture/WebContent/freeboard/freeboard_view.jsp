<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*,java.util.*"  %>    
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();

String no = request.getParameter("t_no");
dao.setHitCount(no);

ArrayList<Comment_dto> dtos = dao.getComments(no);

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
					<col width="45%">
					<col width="25%">
					<col width="10%">
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
					
					<tr>
						<th>댓글</th>
						<td colspan="2">
							<form name="comment">
							<input type="hidden" name="t_no" value="<%=dto.getNo()%>">
							<input name="t_comment" type="text" class="input500">
							</form>	
						</td>
						<td>
						<a href="javascript:goComment()" class="butt">댓글입력</a>
						</td>
					</tr>
					<%for(int k = 0; k<dtos.size(); k++){ %>	
					<tr>
						<th>[<%=dao.getName(dtos.get(k).getReg_id()) %>]</th>
						
						<td id="fix" colspan="1">
							<h4><%=dtos.get(k).getContent()%></h4>
							<form name="save">
							<input name="t_no" type="hidden" value="<%=dtos.get(k).getNo()%>">
							<input name="t_no_order" type="hidden" value="<%=dtos.get(k).getNo_order()%>">
							<input name="t_content" id="fixx" type="text" class="input500" value="<%=dtos.get(k).getContent()%>">
							</form>
						</td>
						<th>[<%=dtos.get(k).getReg_date()%>]</th>
						<%if(sessionId.equals(dtos.get(k).getReg_id())){ %>
						<td id="all">
						<a href="javascript:commentDelete('<%=dtos.get(k).getNo_order()%>')">[삭제]</a>  
						<a href="javascript:commentUpdate('<%=dtos.get(k).getNo_order()%>','<%=k%>')">[수정]</a>
						<a id="a_<%=k%>" href="javascript:commentSave()">[저장]</a>
						</td>
						<%} %>
					</tr>	
					<%} %>

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
<form name="sex">
<input type="hidden" name="t_no" value="<%=no%>">
<input type="hidden" name="t_no_order" value="">

</form>

</html>


<script type="text/javascript">

$("#fixx").hide();
$("#a_2").hide();


function goDelete(){
	var goYesNo = confirm("정말삭제하시겠습니까?");
	if(goYesNo){
		free.method="post";
		free.action="db_freeboard_delete.jsp";
		free.submit();
	}	

}
	
	
function goComment(){
	
	if(comment.t_comment.value == ""){
		alert("댓글을 입력해주세요!")
		return;
	}
	comment.method="post";
	comment.action="db_freeboard_comment_save.jsp";
	comment.submit();

}

function commentDelete(no_order){
	sex.t_no_order.value = no_order;
	sex.method="post";
	sex.action="db_freeboard_comment_delete.jsp";
	sex.submit();
}

function commentUpdate(no_order,k){
	$("#fix h4").css("display","none");
	$("#fixx").show();
	$("#all a").hide();
	$("#a_"+k).show();
}

function commentSave(){
	save.method="post";
	save.action="db_freeboard_comment_update.jsp";
	save.submit();
}


</script>





