<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
request.setCharacterEncoding("utf-8");
Qanda_dao dao = new Qanda_dao();

String maxNo = dao.getMaxNo();
out.print("maxNo:" + maxNo);
String no = CommonUtil.getNewNo("Q000",maxNo);
String q_title = request.getParameter("t_q_title");
String q_content = request.getParameter("t_q_content");
String q_reg_id = (String)session.getAttribute("sessionId");
String q_reg_date = request.getParameter("t_q_reg_date");
String ispublic = request.getParameter("t_ispublic");
System.out.print(no);
System.out.print(q_title);
System.out.print(q_content);
System.out.print(q_reg_id);
System.out.print(q_reg_date);
System.out.print(ispublic);

//dto순서: no,q_title,q_content,q_reg_id,q_reg_date,hit,ispublic,a_content, a_reg_id, a_reg_date;
Qanda_dto dto = new Qanda_dto(no,q_title,q_content,q_reg_id,q_reg_date,"",ispublic,"", "", "");
int result = dao.qandaSave(dto);

String msg = "등록 되었습니다.";
if(result != 1){
	msg ="등록 실패!";
}

%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="qanda_list.jsp";

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