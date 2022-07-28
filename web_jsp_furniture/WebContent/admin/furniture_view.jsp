<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>    
<!DOCTYPE html>
<%@ include file="../common_head.jsp" %>
<%
Member_dao dao = new Member_dao();
String no = request.getParameter("t_no");
Furniture_dto dto =  dao.getFurniture(no);


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
				Furniture
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
						<th>제품명</th>
						<td colspan="3"><%=dto.getP_name() %></td>
					</tr>	
					<tr>
						<th>제품 이미지</th>
						<td colspan="3">
							<img src="/attach/furniture/<%=dto.getAttach()%>">
						</td>
					</tr>
						<%if(sessionLevel.equals("top")){ %>
					<tr>
						<th>IMG_ORDER NO</th>
						<td colspan="3"><%=dto.getImg_order()%></td>
					</tr>
						<%} %>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_id()%></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date()%></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<%if(sessionLevel.equals("top")){ %>
				<a href="javascript:goDelete()" class="butt">Delete</a>
				<a href="furniture_update.jsp?t_no=<%=dto.getNo()%>" class="butt">Update</a>
				<%} %>
				<a href="furniture_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
	</div>	
</body>
<form name=furni>
<input name="t_no" value="<%=no%>">
<input name="t_delete_attach" value="<%=dto.getAttach()%>">
<input name="t_img_order" value="<%=dto.getImg_order()%>">
</form>

<script>
function goDelete(){
	var goYesNo = confirm("정말삭제하시겠습니까?");
	if(goYesNo){
		furni.method="post";
		furni.action="db_furniture_delete.jsp";
		furni.submit();
	}	
}


</script>