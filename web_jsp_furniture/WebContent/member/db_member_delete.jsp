<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*" %>
<%
request.setCharacterEncoding("utf-8");
Member_dao dao = new Member_dao();
String id = request.getParameter("t_id");
String exit_date = CommonUtil.getToday();

int result = dao.getDeleteMember(id,exit_date);
String msg = result==1 ? "삭제 완료!!":"삭제 실패!";
if(result == 1){
	session.invalidate();
}




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("<%=msg%>");
	location.href="/index.jsp";


</script>
</body>
</html>