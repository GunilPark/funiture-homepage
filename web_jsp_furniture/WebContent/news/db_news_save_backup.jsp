<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*,dao.*,common.*"%>
<%
request.setCharacterEncoding("utf-8");
News_dao dao = new News_dao();

String maxNo = dao.getMaxNo();
out.print("maxNo:" + maxNo);
String no = CommonUtil.getNewNo("N000",maxNo);
String title = request.getParameter("t_title");
String content = request.getParameter("t_content");
String reg_id = (String)session.getAttribute("sessionId");
String reg_date = request.getParameter("t_reg_date");

News_dto dto = new News_dto(no,title,content, "","",reg_id,reg_date);
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