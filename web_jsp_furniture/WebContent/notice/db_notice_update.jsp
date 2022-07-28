<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Notice_dao dao = new Notice_dao();
	String file_dir =CommonUtil.getFile_dir_notice();
	int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.
	
	//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
	String attachName = mpr.getFilesystemName("t_attach");
	if(attachName == null){
		attachName = "";
	}
	String delete_attach	= mpr.getParameter("t_del_attach");
	String no       		= mpr.getParameter("t_no");
	String title 			= mpr.getParameter("t_title");
	String content 			= mpr.getParameter("t_content");
	String reg_id   		= (String)session.getAttribute("sessionId");
	String reg_date 		= mpr.getParameter("t_reg_date");
	String ori_file			= mpr.getParameter("t_ori_attach");
	String db_attach_name	= "";
	
	//첨부파일 체크박스 삭제 체크했으면.
	if(delete_attach != null){
		File file = new File(file_dir,delete_attach);
		ori_file = "";
		file.delete();
	}
	
	if(!attachName.equals("")){
		if(!ori_file.equals("")){
			File file = new File(file_dir,ori_file);
			file.delete();
		}
		db_attach_name = attachName;
	}else{
		db_attach_name = ori_file;
	}
	
	//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
	Notice_dto dto = new Notice_dto(no,title,content,db_attach_name,"",reg_id,reg_date);
	int result = dao.noticeUpdate(dto);
	
	String msg = "수정 되었습니다.";
	if(result != 1) msg ="수정 실패!";
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





