<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*" %>    
<%
request.setCharacterEncoding("utf-8");
Etc_dao dao = new Etc_dao();
String maxNo = dao.getMaxNo();
String no = CommonUtil.getNewNo("E000",maxNo);
String title = request.getParameter("t_title");
String content = request.getParameter("t_content");
String reg_name = (String)session.getAttribute("sessionName");
String reg_id = (String)session.getAttribute("sessionId");
String reg_date = request.getParameter("t_reg_date");

Etc_dto dto = new Etc_dto(no,title,content,reg_id,reg_name,reg_date);
int result = dao.etcSave(dto);
String msg = "등록실패";
if(result == 1){
	msg = "등록 완료";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<script>
alert("<%=msg%>");
location.href="etc_list.jsp";

</script>