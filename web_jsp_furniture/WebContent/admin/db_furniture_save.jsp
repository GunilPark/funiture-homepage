<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	String file_dir =CommonUtil.getFile_dir_furniture();
	int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.
	
	//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
	String attachName = mpr.getFilesystemName("t_attach");
	if(attachName == null){
		attachName = "";
	}
	String maxNo    = dao.getMaxNo(); // N000
	String no       = CommonUtil.getNewNo("F000", maxNo);
	String p_name	= mpr.getParameter("t_p_name");
	String p_size	= mpr.getParameter("t_p_size");
	String img_order= mpr.getParameter("t_img_order");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_date = mpr.getParameter("t_reg_date");

	//이미 존재하느 img_order를 한칸씩 밀기.
	int check = dao.orderZero(img_order);
	
								//no,p_name,p_size,attach,img_order,reg_id,reg_date;
	Furniture_dto dto = new Furniture_dto(no,p_name,p_size,attachName,img_order,reg_id,reg_date);
	int result = dao.furnitureSave(dto);
	
	String msg = "등록 되었습니다.";
	if(result != 1) msg ="등록 실패!";
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="furniture_list.jsp";
</script>
</head>
<body>

</body>
</html>





