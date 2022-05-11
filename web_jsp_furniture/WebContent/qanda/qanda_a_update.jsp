<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*,dao.*,java.util.*,common.*" %>
<%@ include file="../common_head.jsp" %> 
<%
request.setCharacterEncoding("utf-8");
Qanda_dao dao = new Qanda_dao();
String no = request.getParameter("t_no");
Qanda_dto dto = dao.getView(no);



if(!sessionLevel.equals("top") && !sessionLevel.equals("maneger")){
%>
	<script type="text/javascript">
		alert("로그인 하지 않았거나 글쓰기 권한이 없습니다.");
		location.href="/index.jsp";
	</script>
<%	} %>

  
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="/notice/notice_list.jsp"> NOTICE</a></li>
				<li><a href="/news/news_list.jsp">NEWS</a></li>
				<li><a href="/qanda/qanda_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>Q & A</a></li>
				<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="/etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				Q & A
			</p>
			<form name="qanda">
			<input type="hidden" name="t_no" value="<%=dto.getNo()%>">
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><%=dto.getQ_title()%></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_a_content" class="textArea_H250"><%=dto.getA_content()%></textarea></td>
					</tr>	
					<tr>
						<th>공개여부</th>
						<td colspan="3">
						<%=dto.getIspublic() %>
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><input name="t_a_reg_id" type="text" value="<%=sessionName %>" class="input100"></td>
						<th>RegDate</th>
						<td><input name="t_a_reg_date" type="date" value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	
				</form>
				</tbody>
			</table>
			<div class="buttonGroup">
				
				<a href="javascript:goUpdate()" class="butt">Save</a>
				<a href="qanda_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>
<script>
function goUpdate(){
	if(checkValue(qanda.t_a_content,"내용 입력!")) return;
	if(checkValue(qanda.t_a_reg_date,"등록일자 입력!")) return;
	qanda.method="post";
	qanda.action="db_qanda_update.jsp";
	qanda.submit();
	
	
}

</script>





