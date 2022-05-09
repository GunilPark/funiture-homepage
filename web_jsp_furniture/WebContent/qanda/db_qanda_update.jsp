<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Qanda_dao dao = new Qanda_dao();

	String no       = request.getParameter("t_no");
	String a_content 	= request.getParameter("t_a_content");
	String a_reg_id   = (String)session.getAttribute("sessionId");
	String a_reg_date = request.getParameter("t_a_reg_date");
	 
	int result = dao.insertA(no,a_content,a_reg_id,a_reg_date);
	
	String msg = "수정 되었습니다.";
	if(result != 1) msg ="수정 실패!";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="qanda_list.jsp";
</script>
</head>
<body>

</body>
</html>





