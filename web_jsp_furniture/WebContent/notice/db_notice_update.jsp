<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();

	String no       = request.getParameter("t_no");
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_date = request.getParameter("t_reg_date");

	//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
	Notice_dto dto = new Notice_dto(no,title,content,
			                        "","",reg_id,reg_date);
	int result = dao.noticeUpdate(dto);
	
	String msg = "수정 되었습니다.";
	if(result != 1) msg ="수정 실패!";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="notice_list.jsp";
</script>
</head>
<body>

</body>
</html>





