<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="dao.*,dto.*"%><%
request.setCharacterEncoding("utf-8");
Member_dao dao = new Member_dao();    
String id = request.getParameter("t_id");

int result = dao.getIdCheck(id);
String msg = "사용가능";
if(result==1){
	msg="중복된 ID 사용 불가!";
}
%><%=msg%>