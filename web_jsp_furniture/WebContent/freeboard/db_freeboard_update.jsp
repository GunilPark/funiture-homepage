<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Free_dao dao = new Free_dao();

	String no       = request.getParameter("t_no");
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_name = (String)session.getAttribute("sessionName");
	String reg_date = request.getParameter("t_reg_date");

	//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
	Free_dto dto = new Free_dto(no,title,content,"",reg_id,reg_name,reg_date);
	int result = dao.freeUpdate(dto);
	
	String msg = "수정 되었습니다.";
	if(result != 1) msg ="수정 실패!";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="freeboard_list.jsp";
</script>
</head>
<body>

</body>
</html>





