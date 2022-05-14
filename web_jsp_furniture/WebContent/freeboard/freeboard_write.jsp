<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common_head.jsp" %>
<%@ page import="common.*" %>
<%
if(sessionLevel.equals("")){
%>
	<script type="text/javascript">
		alert("로그인 하지 않았거나 글쓰기 권한이 없습니다.");
		location.href="/index.jsp";
	</script>
<%	} %>

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
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">
				</colgroup>
				<form name="free">
				
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input name="t_title" type="text" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><input type="text" name="t_name" readonly value="<%=sessionName%>" class="input100"></td>
						<th>RegDate</th>
						<td><input type="date" name="t_reg_date" readonly value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	

				</tbody>
				</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="freeboard_list.jsp" class="butt">List</a>
			</div>	
		</div>	

	<%@ include file="../common_footer.jsp" %>	
		</div>	
	</div>	
</body>
</html>
<script type="text/javascript">
function goSave(){
	if(checkValue(free.t_title,"제목 입력!")) return;
	if(checkValue(free.t_content,"내용 입력!")) return;
	if(checkValue(free.t_reg_date,"등록일자 선택!")) return;
	free.method="post";
	free.action="db_freeboard_save.jsp";
	free.submit();
	
}


</script>





