<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();
	String file_dir =CommonUtil.getFile_dir_notice();
	int sizeLimit = 1024 * 1024 * 1; //10메가 바이트.
	
	//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
	String attachName = mpr.getFilesystemName("t_attach");
	if(attachName == null){
		attachName = "";
	}
	String maxNo    = dao.getMaxNo(); // N000
	String no       = CommonUtil.getNewNo("N000", maxNo);
	String title	= mpr.getParameter("t_title");
	String content	= mpr.getParameter("t_content");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_date = mpr.getParameter("t_reg_date");


	Notice_dto dto = new Notice_dto(no,title,content,attachName,"",reg_id,reg_date);
	int result = dao.noticeSave(dto);
	
	String msg = "등록 되었습니다.";
	if(result != 1) msg ="등록 실패!";
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="notice_list.jsp";
</script>
</head>
<body>

</body>
</html>





