<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	String file_dir =CommonUtil.getFile_dir_furniture();
	int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.
	
	//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
	String attachName = mpr.getFilesystemName("t_attach");
	
	String ori_attach = mpr.getParameter("t_ori_attach");
	if(attachName == null){
		attachName = ori_attach;
	}else{
		File file = new File(file_dir,ori_attach);
		file.delete();
	}
	String no       = mpr.getParameter("t_no");
	String p_name	= mpr.getParameter("t_p_name");
	String p_size	= mpr.getParameter("t_p_size");
	String img_order= mpr.getParameter("t_img_order");
	String reg_id   = (String)session.getAttribute("sessionId");
	String reg_date = mpr.getParameter("t_reg_date");
	String ori_img_order = mpr.getParameter("t_ori_img_order");

	
	//img_order 조정.
	if(Integer.parseInt(ori_img_order) > Integer.parseInt(img_order)){
		int check = dao.orderUp(ori_img_order,img_order);

	}else if(Integer.parseInt(ori_img_order) < Integer.parseInt(img_order)){
		int check = dao.orderDown(ori_img_order,img_order);

	}
	
								//no,p_name,p_size,attach,img_order,reg_id,reg_date;
	Furniture_dto dto = new Furniture_dto(no,p_name,p_size,attachName,img_order,reg_id,reg_date);
	int result = dao.furnitureUpdate(dto);
	
	String msg = "업데이트 되었습니다.";
	if(result != 1) msg ="업데이트 실패!";
	
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





