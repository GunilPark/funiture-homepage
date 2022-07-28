<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %> 

<%

	if(sessionLevel.equals("")){
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
						<td colspan="3"><input name="t_q_title" type="text" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_q_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>공개여부</th>
						<td><input name="t_ispublic" type="radio" value="y" class="">공개</td>
						<td><input name="t_ispublic" type="radio" value="n" class="">비공개</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input name="t_q_reg_date" type="date" name="" value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	

				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="qanda_list.jsp" class="butt">List</a>
			</div>	
		</div>	
		

		<%@ include file="../common_footer.jsp" %>			
		</div>	
	</div>	
</body>
</html>


<script type="text/javascript">
	function goSave() {
		if(checkValue(qanda.t_q_title,"제목입력!")){
			return;
		}	
		if(checkValue(qanda.t_q_content,"내용입력!")){
			return;
		}
		if(checkValue(qanda.t_ispublic,"공개여부선택!")){
			return;
		}	
		if(checkValue(qanda.t_q_reg_date,"날짜입력!")){
			return;
		}	
		qanda.method="post";
		qanda.action="db_qanda_save.jsp";
		qanda.submit();
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



