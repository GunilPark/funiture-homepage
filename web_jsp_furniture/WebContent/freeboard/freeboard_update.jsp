<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*,dao.*,java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %>   

<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
String no = request.getParameter("t_no");
Free_dto dto = dao.getView(no);

if(sessionLevel.equals("")){
%>	
	<<script type="text/javascript">
alert("로그인 하지 않았거나 권한이 없습니다.");
location.href="notice_list.jsp"
</script>
	
<% 	}%>

	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
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
			<form name="free">
			<input type="hidden" name="t_no" value="<%=dto.getNo()%>">
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="45%">

					<col width="40%">
				</colgroup>
				
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="t_title" class="input600" value="<%=dto.getTitle()%>"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"><%=dto.getContent()%></textarea></td>
					</tr>	
				
					<tr>
						<th>Writer</th>
						<td><input name="t_id" type="text" readonly value="<%=dto.getReg_name() %>" class="input100"></td>
						<th>RegDate</th>
						<td><input name="t_reg_date" type="date" readonly value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	
				</form>
				</tbody>
			</table>
			<div class="buttonGroup">
				
				<a href="javascript:goUpdate()" class="butt">Save</a>
				<a href="freeboard_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>
<script>
function goUpdate(){
	if(checkValue(free.t_title,"제목 입력!")) return;
	if(checkValue(free.t_content,"내용 입력!")) return;
	free.method="post";
	free.action="db_freeboard_update.jsp";
	free.submit();
	
	
}

</script>





