<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
String no = request.getParameter("t_no");
int result = dao.freeDelete(no);
String msg ="삭제실패";
if(result == 1){
	msg="삭제성공!";
}


%>
<script>
alert("<%=msg%>");
location.href="freeboard_list.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>