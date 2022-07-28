<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*"%>
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
	
	//첨부파일이 입력되었을때
	if(!attachName.equals("")){
		//원래 있던 파일이 존재하면
		if(!ori_file.equals("")){
			//그 파일 삭제
			File file = new File(file_dir,ori_file);
			file.delete();
		}
		//새로 입력된 파일을 dto에저장
		db_attach_name = attachName;
	}else{
		//원래있던 파일명 저장! or 체크삭제 선택시 원래있던 파일명이 공백이 됨..ㅋ(공백 저장)
		db_attach_name = ori_file;
	}
	
	//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
	News_dto dto = new News_dto(no,title,content, db_attach_name,"",reg_id,reg_date);
	int result = dao.newsUpdate(dto);
	
	String msg = "수정 되었습니다.";
	if(result != 1) msg ="수정 실패!";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="news_list.jsp";
</script>
</head>
<body>

</body>
</html>





