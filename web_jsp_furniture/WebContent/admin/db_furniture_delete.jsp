<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*, dto.*,java.io.*,common.*" %>
<%
request.setCharacterEncoding("utf-8");
String no = request.getParameter("t_no");
Member_dao dao = new Member_dao();
String delete_attach = request.getParameter("t_delete_attach");
String file_dir = CommonUtil.getFile_dir_furniture();
String img_order = request.getParameter("t_img_order");
if(!delete_attach.equals("")){
	File file = new File(file_dir,delete_attach);
	file.delete();
}

//img_order 조정.
int check = dao.orderDown(img_order);

int result = dao.getDelete(no);
String msg = "삭제되었습니다.";
if(result != 1){
	msg = "삭제에 실패하였습니다.";
}
%>    
<script type="text/javascript">
alert("<%=msg%>");
location.href="furniture_list.jsp";


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