<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="common.*" %>


	<%@ include file="../common_head.jsp" %>

<%
	if(!sessionLevel.equals("top")){
%>
		<script type="text/javascript">
			alert("로그인 하지 않았거나 글쓰기 권한이 없습니다.");
			location.href="../index.jsp";
		</script>
<%	} %>
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
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
			
			<form name="notice">
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
						<td colspan="3"><input type="text" name="t_title" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><input name="t_attach" type="file" class="input600"></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input type="date" name="t_reg_date" value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	
				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="notice_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>

<script type="text/javascript">
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

<script>
	function goSave(){
		if(checkValue(notice.t_title,"제목 입력!")) return;
		if(checkValue(notice.t_content,"내용 입력!")) return;
		if(checkValue(notice.t_reg_date,"등록일자 입력!")) return;
		notice.method="post";
		notice.action="db_notice_save.jsp";
		notice.submit();
	}
</script>




