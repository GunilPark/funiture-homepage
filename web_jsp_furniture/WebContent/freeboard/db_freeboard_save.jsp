<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
String maxNo    = dao.getMaxNo(); // N000
String no       = CommonUtil.getNewNo("F000", maxNo);
String title 	= request.getParameter("t_title");
String content 	= request.getParameter("t_content");
String reg_id   = (String)session.getAttribute("sessionId");
String reg_name   = (String)session.getAttribute("sessionName");
String reg_date = request.getParameter("t_reg_date");

//dto 순서: no,title,content,hit,reg_id,reg_name,reg_date
Free_dto dto = new Free_dto(no,title,content,"",reg_id,reg_name,reg_date);
int result = dao.freeSave(dto);

String msg = "등록 되었습니다.";
if(result != 1) msg ="등록 실패!";

%>
<script>
alert("<%=msg%>");
location.href="freeboard_list.jsp";

</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
