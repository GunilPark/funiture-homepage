<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Member_dao dao  = new Member_dao();
	String id 		= request.getParameter("t_id");
	String password = dao.encryptSHA256(request.getParameter("t_password"));
	
	//String loginName = dao.checkLogin(id, password);
	ArrayList<String> info = dao.checkLogin(id, password);
	String msg="";
	String url="";
	if(info.size() == 0){
		msg ="ID나 비밀번호가 맞지 않습니다.";
		url ="member_login.jsp";
	}else{
		String loginName  = info.get(0);
		String loginLevel = info.get(1);
		msg =loginName+"님 환영합니다.";
		url ="../index.jsp";
		
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", loginName);
		session.setAttribute("sessionLevel", loginLevel);
		session.setMaxInactiveInterval(60 * 30);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>

