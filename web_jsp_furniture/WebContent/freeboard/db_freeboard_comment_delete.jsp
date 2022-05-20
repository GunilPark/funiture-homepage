<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();

String no = request.getParameter("t_no");
String no_order = request.getParameter("t_no_order");
String msg = "삭제 실패!";
int k = dao.deleteComment(no, no_order);
if(k == 1){
	msg="삭제완료";
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
location.href="freeboard_view.jsp?t_no=<%=no%>";

</script> 
 
</body>
</html>