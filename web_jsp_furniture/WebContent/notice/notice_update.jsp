<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*,dao.*,java.util.*,common.*" %>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ include file="../common_head.jsp" %>   

<%
request.setCharacterEncoding("utf-8");
Notice_dao dao = new Notice_dao();
String no = request.getParameter("t_no");
Notice_dto dto = dao.getView(no);

if(!sessionLevel.equals("top")){
%>	
	<<script type="text/javascript">
alert("로그인 하지 않았거나 권한이 없습니다.");
location.href="notice_list.jsp"
</script>
	
<% 	
}

%>

	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="../news/news_list.jsp">NEWS</a></li>
				<li><a href="../qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="../freeboard/freeboard_list.jsp">FREE BOARD</a></li>
				<li><a href="../etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			<form name="notice" enctype="multipart/form-data">
			<input type="hidden" name="t_no" value="<%=dto.getNo()%>">
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input type="text" name="t_title" class="input600" value="<%=dto.getTitle()%>"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"><%=dto.getContent()%></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><%=dto.getAttach()%> [첨부파일 지우기<input id="del" name="t_del_attach" value="<%=dto.getAttach()%>" type="checkbox">]
							<input id="atch" name="t_attach" value="<%=dto.getAttach()%>" type="file" class="input600">
							<input type="hidden" name="t_ori_attach" value="<%=CommonUtil.checkNull(dto.getAttach())%>">
						</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><input name="t_id" type="text" readonly value="<%=dto.getReg_id() %>" class="input100"></td>
						<th>RegDate</th>
						<td><input name="t_reg_date" readonly type="date" value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	
				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				<a href="javascript:goUpdate()" class="butt">Save</a>
				<a href="notice_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	
</body>
</html>
<script>
function goUpdate(){
	var fileName = notice.t_attach.value;
	if(fileName !=""){
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
//		if(extension != "jpg" && extension != "gif" && extension != "png"){
		if(extension != "pdf" && extension != "hwp"){
			alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
			return;
		}		
	}
		
	//첨부 용량 체크	
	var file = notice.t_attach;
	var fileMaxSize  = 5; // 첨부 최대 용량 설정
	if(file.value !=""){
		// 사이즈체크
		var maxSize  = 1024 * 1024 * fileMaxSize;  
		var fileSize = 0;

		// 브라우저 확인
		var browser=navigator.appName;
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer"){
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}else {
		// 익스플로러가 아닐경우
			fileSize = file.files[0].size;
		}
		//alert("파일사이즈 : "+ fileSize);

		if(fileSize > maxSize){
			alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
			return;
		}	
	}		
	
	if(checkValue(notice.t_title,"제목 입력!")) return;
	if(checkValue(notice.t_content,"내용 입력!")) return;
	if(checkValue(notice.t_reg_date,"등록일자 입력!")) return;
	notice.method="post";
	notice.action="db_notice_update.jsp";
	notice.submit();	
}

//$("#atch").hide();

//$("#del").on("click",function(){
//	$(this).attr("","checkbox");	
//})

</script>





