<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	if(sessionId == null){
%>
		<script type="text/javascript">
			alert("로그인정보가 만료 되었거나 로그인되지 않았습니다.");
			location.href="member_login.jsp";
		</script>	
<%			
	} else {

	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	String  id            = request.getParameter("t_id");
	String  name          = request.getParameter("t_name");
	String  password      = request.getParameter("t_password");
	String  area          = request.getParameter("t_area");
	String  address       = request.getParameter("t_address");
	String  tell_1        = request.getParameter("t_tell_1");
	String  tell_2        = request.getParameter("t_tell_2");
	String  tell_3        = request.getParameter("t_tell_3");
	String  gender        = request.getParameter("t_gender");
	String  hobby_travel  = request.getParameter("t_hobby_travel");
	String  hobby_reading = request.getParameter("t_hobby_reading");
	String  hobby_sports  = request.getParameter("t_hobby_sports");
	String  level_gubun	  = request.getParameter("t_level_gubun");

	if(hobby_travel == null) hobby_travel ="n";
	if(hobby_reading == null) hobby_reading ="n";
	if(hobby_sports == null) hobby_sports ="n";
	
	Member_dto dto = 
		new Member_dto(id,name,password,area,address,tell_1,tell_2,tell_3,
				gender,hobby_travel,hobby_reading,hobby_sports,
				"",level_gubun,"","");	
	
	int result = dao.memberUpdate(dto);
	String msg ="정보수정 실패하였습니다. 관리자에게 문의바랍니다.";
	if(result == 1) msg =name+"님 회원정보 수정 되었습니다.";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="../index.jsp";
</script>
</head>
<body>
</body>
</html>
<% } %>









