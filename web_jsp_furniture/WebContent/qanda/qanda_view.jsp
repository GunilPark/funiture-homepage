<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.*, dao.*, common.*,java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
Qanda_dao dao = new Qanda_dao();

String no = request.getParameter("t_no");

dao.setHitCount(no);

Qanda_dto dto = dao.getView(no);
String name = dao.getName(dto.getA_reg_id());
dto.getNo();

if (dto.getNo() == null) {
%>
<script>
	alert("<%=dto.getQ_reg_id()%>
	");
	alert("삭제된 글이거나 존재하지 않는 게시글입니다.");

	location.href = "qanda_list.jsp";
</script>
<%
	} else {
%>
<%@ include file="../common_head.jsp"%>
<%
	if (dto.getIspublic().equals("y") || (dto.getIspublic().equals("n")
		&& (sessionLevel.equals("top") || sessionLevel.equals("manager") || sessionId.equals(dto.getQ_reg_id())))) {
%>


<%
	} else {
%>
<script>
	alert("권한이 없습니다.");

	location.href = "qanda_list.jsp";
</script>
<%
	}
%>
<div id="b_left">
	<P>NOTICE & NEWS</P>
	<ul>
		<li><a href="/notice/notice_list.jsp"> NOTICE</a></li>
		<li><a href="/news/news_list.jsp">NEWS</a></li>
		<li><a href="/qanda/qanda_list.jsp"><span class="fnt"><i
					class="fas fa-apple-alt"></i></span>Q & A</a></li>
		<li><a href="/freeboard/freeboard_list.jsp">FREE BOARD</a></li>
		<li><a href="/etc/etc_list.jsp">ETC</a></li>
	</ul>
</div>

<div id="b_right">
	<p class="n_title">Q & A</p>

	<table class="boardForm">
		<colgroup>
			<col width="15%">
			<col width="20%">
			<col width="10%">
			<col width="10%">
			<%
				if (dto.getA_reg_id() != null) {
			%>
			<col width="10%">
			<col width="20%">
			<col width="10%">
			<col width="20%">
			<%
				} else {
			%>
			<col width="10%">
			<%
				}
			%>
		</colgroup>
		<tbody>
			<tr>
				<th>Title</th>
				<td colspan="2"><%=dto.getQ_title()%></td>
				<td><i class="far fa-eye"></i> <%=dto.getHit()%></td>
			</tr>
			<tr>
				<th>Content</th>
				<td colspan="3"><textarea name="t_q_content"
						class="textArea_H150_noBorder" readonly><%=dto.getQ_content()%></textarea>
				</td>
			</tr>
			<tr>
				<th>Writer</th>
				<td><%=dto.getQ_reg_id()%></td>
				<th>RegDate</th>
				<td><%=dto.getQ_reg_date()%></td>
			</tr>
			<style>
.fa-brands {
	font-size: 17px;
}
</style>

			<tr>
				<th><i class="fab fa-brands fa-replyd"></i>답변</th>
				<td colspan="3">
					<%
						if (dto.getA_reg_id() == null) {
					%> 아직 답변을 받지 못하였습니다. <%
						} else {
					%> 답변 글
					입니다.
				</td>
			<tr>
				<th>content</th>
				<td colspan="3"><textarea name="t_a_content"
						class="textArea_H150_noBorder" readonly><%=dto.getA_content()%></textarea>
				</td>
			</tr>
			<tr>
				<th>Writer</th>
				<td><%=name%></td>

				<th>RegDate</th>
				<td><%=dto.getA_reg_date()%> <%
 	}
 %></td>
			</tr>

		</tbody>
	</table>
	<div class="buttonGroup">
		<%
			if (!sessionLevel.equals("")) {
		%>
		<%
			if (dto.getA_reg_id() == null) {
		%>
		<a href="qanda_a_update.jsp?t_no=<%=dto.getNo()%>" class="butt">답글
			작성</a>
		<%
			} else {
		%>
		<a href="qanda_a_update.jsp?t_no=<%=dto.getNo()%>" class="butt">답글
			수정</a>
		<%
			}
		%>
		<a href="javascript:goDelete('<%=dto.getNo()%>')" class="butt">Delete</a>
		<%
			}
		%>


		<%
			if (sessionId.equals(dto.getQ_reg_id())) {
		%>
		<a href="qanda_update.jsp?t_no=<%=dto.getNo()%>" class="butt">Update</a>
		<%
			}
		%>
		<a href="qanda_list.jsp" class="butt">List</a>
	</div>
</div>

<%@ include file="../common_footer.jsp"%>
</div>
</div>
</body>
</html>
<form name="qanda">
	<input name="t_no" value="no">
</form>
<script type="text/javascript">
	function goDelete(no) {
		qanda.t_no.value = no;
		qanda.method = "post";
		qanda.action = "db_qanda_delete.jsp"
		qanda.submit();

	}
</script>




<%
	}
%>




