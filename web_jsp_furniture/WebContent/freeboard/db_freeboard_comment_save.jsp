<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*,common.*" %>
<%
request.setCharacterEncoding("utf-8");
Free_dao dao = new Free_dao();
String no = request.getParameter("t_no");
String reg_id = (String)session.getAttribute("sessionId");
String maxNo = dao.getMaxNo2(no,reg_id);
String no_order = CommonUtil.getNewNo("C000", maxNo);
String content = request.getParameter("t_comment");
String reg_date = CommonUtil.getToday();
//dto순서: no,reg_order,content,reg_id,reg_date
Comment_dto dto = new Comment_dto(no,no_order,content,reg_id,reg_date);


if((String)session.getAttribute("sessionId") == null){%>
<script>
	 alert("로그인 하지 않았습니다.");
	 location.href="freeboard_view.jsp?t_no=<%=no%>";
</script>
<% }else{

String msg = "한 아이디당 한개의 댓글만 작성 하실 수 있습니다.";
int result = dao.commentSave(dto); 
if(result == 1){
	msg="댓글 작성 완료";
}
%>
<!DOCTYPE html>
<script>
alert("<%=msg%>");
location.href="freeboard_view.jsp?t_no=<%=no%>";

</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%}%>