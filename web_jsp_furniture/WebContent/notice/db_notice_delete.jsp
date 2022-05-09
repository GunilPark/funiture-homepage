<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*, dto.*" %>
<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("t_no");
Notice_dao dao = new Notice_dao();


int result = dao.getDelete(no);
String msg = "삭제되었습니다.";
if(result != 1){
	msg = "삭제에 실패하였습니다.";
}
%>    
<script type="text/javascript">
alert("<%=msg%>");
location.href="notice_list.jsp";


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