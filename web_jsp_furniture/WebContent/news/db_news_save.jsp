<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%
request.setCharacterEncoding("utf-8");
News_dao dao = new News_dao();
String file_dir =CommonUtil.getFile_dir_news();
int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.

//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
String attachName = mpr.getFilesystemName("t_attach");
if(attachName == null){
	attachName = "";
}
String maxNo = dao.getMaxNo();
out.print("maxNo:" + maxNo);
String no = CommonUtil.getNewNo("N000",maxNo);
String title = mpr.getParameter("t_title");
String content = mpr.getParameter("t_content");
String reg_id = (String)session.getAttribute("sessionId");
String reg_date = mpr.getParameter("t_reg_date");
							//no,title,content,attach,hit,reg_id,reg_date
News_dto dto = new News_dto(no,title,content, attachName,"",reg_id,reg_date);
int result = dao.newsSave(dto);

String msg = "등록 되었습니다.";
if(result != 1){
	msg ="등록 실패!";
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