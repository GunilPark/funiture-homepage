<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*, dto.*,java.io.*,common.*" %>
<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("t_no");
News_dao dao = new News_dao();
String delete_attach = request.getParameter("t_delete_attach");
String file_dir = CommonUtil.getFile_dir_news();
if(!delete_attach.equals("")){
	File file = new File(file_dir,delete_attach);
	file.delete();
}


int result = dao.getDelete(no);
String msg = "삭제되었습니다.";
if(result != 1){
	msg = "삭제에 실패하였습니다.";
}
%>    
<script type="text/javascript">
alert("<%=msg%>");
location.href="news_list.jsp";


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