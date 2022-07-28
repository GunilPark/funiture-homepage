<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>
<%if(sessionLevel.equals("top")||sessionLevel.equals("manager")){
}else{ %>
<script>

	alert("권한이 없습니다.");
	location.href="/index.jsp";
	
</script>	
<% }%>
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="../notice/notice_list.jsp">NOTICE</a></li>
				<li><a href="../news/news_list.jsp">NEWS</a></li>
				<li><a href="../qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="../freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="../etc/etc_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				ETC
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">
				</colgroup>
				<form name="etc">
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input name="t_title" type="text" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea class="textArea_H250" name="t_content"></textarea></td>
					</tr>		
					<tr>
						<th>Writer</th>
						<td><input name="t_name" type="text" value="<%=sessionName%>" readonly class="input100"></td>
						<th>RegDate</th>
						<td><input name="t_reg_date" type="date" value="<%=CommonUtil.getToday()%>" readonly class="input130"></td>
					</tr>	
				</tbody>
				</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="etc_list.jsp" class="butt">List</a>
			</div>	
		</div>	
<%@ include file="/common_footer.jsp" %>
		</div>	
	</div>	
</body>
</html>
<script>
function goSave(){
	if(etc.t_title.value == ""){
		alert("제목을 입력해주세요!");
		return;
	}
	if(etc.t_content.value == ""){
		alert("내용을 입력해주세요!");
		return;
	}
	etc.method="post";
	etc.action="db_etc_save.jsp";
	etc.submit();
}
</script>






