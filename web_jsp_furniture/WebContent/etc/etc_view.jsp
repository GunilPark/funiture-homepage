<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*"  %>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>
<%
request.setCharacterEncoding("utf-8");
Etc_dao dao = new Etc_dao();
String no = request.getParameter("t_no");
int up = dao.hitUp(no);
Etc_dto dto = dao.etcView(no);

%>
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
					<col width="65%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="2"><%=dto.getTitle() %></td>
						<td> <i class="far fa-eye"></i><%=dto.getHit() %></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3">
							<textarea class="textArea_H250_noBorder" readonly><%=dto.getContent() %></textarea>
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=dto.getReg_name() %></td>
						<th>RegDate</th>
						<td><%=dto.getReg_date() %></td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<a href="" class="butt">Delete</a>
				<a href="notice_update.html" class="butt">Update</a>
				<a href="notice_list.html" class="butt">List</a>
			</div>	
		</div>	
<%@ include file="/common_footer.jsp" %>
		</div>	
	</div>	
</body>
</html>






