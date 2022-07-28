<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();
	
	String maxNo    = dao.getMaxNo(); // N000
	String no       = CommonUtil.getNewNo("N000", maxNo);
	String title 	= request.getParameter("t_title");
	String content 	= request.getParameter("t_content");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_date = request.getParameter("t_reg_date");

	Notice_dto dto = new Notice_dto(no,title,content,
			                        "","",reg_id,reg_date);
	int result = dao.noticeSave(dto);
	
	String msg = "등록 되었습니다.";
	if(result != 1) msg ="등록 실패!";
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





