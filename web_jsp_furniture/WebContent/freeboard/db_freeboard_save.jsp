<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
String file_dir =CommonUtil.getFile_dir_freeboard();
int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.

//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
String attachName = mpr.getFilesystemName("t_attach");
if(attachName == null){
	attachName = "";
}
String maxNo    = dao.getMaxNo(); // N000
String no       = CommonUtil.getNewNo("F000", maxNo);
String title 	= mpr.getParameter("t_title");
String content 	= mpr.getParameter("t_content");
String reg_id   = (String)session.getAttribute("sessionId");
String reg_name = (String)session.getAttribute("sessionName");
String reg_date = mpr.getParameter("t_reg_date");

//dto 순서: no,title,content,hit,reg_id,reg_name,reg_date
Free_dto dto = new Free_dto(no,title,content,"",reg_id,reg_name,reg_date,attachName);
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
