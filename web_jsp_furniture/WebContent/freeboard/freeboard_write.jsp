<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common_head.jsp" %>
<%@ page import="common.*" %>
<%
if(sessionLevel.equals("")){
%>
	<script type="text/javascript">
		alert("로그인 하지 않았거나 글쓰기 권한이 없습니다.");
		location.href="/index.jsp";
	</script>
<%	} %>

		<div id="b_left">
			<P>FREE BOARD</P>
			<ul>
				<li><a href="../notice/notice_list.jsp"> NOTICE</a></li>
				<li><a href="../news/news_list.jsp">NEWS</a></li>
				<li><a href="../qanda/qanda_list.jsp">Q & A</a></li>
				<li><a href="../freeboard/freeboard_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>FREE BOARD</a></li>
				<li><a href="../etc/etc_list.jsp">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				FREE BOARD
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="20%">
					<col width="40%">
					<col width="40%">
				</colgroup>
				<form name="free" enctype="multipart/form-data">
				
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="3"><input name="t_title" type="text" class="input600"></td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3"><textarea name="t_content" class="textArea_H250"></textarea></td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><input name="t_attach" type="file" class="input600"></td>
					</tr>
					<tr>
						<th>Writer</th>
						<td><input type="text" readonly name="t_name" readonly value="<%=sessionName%>" class="input100"></td>
						<th>RegDate</th>
						<td><input type="date" readonly name="t_reg_date" readonly value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	

				</tbody>
				</form>
			</table>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="freeboard_list.jsp" class="butt">List</a>
			</div>	
		</div>	

	<%@ include file="../common_footer.jsp" %>	
		</div>	
	</div>	
</body>
</html>
<script type="text/javascript">
function goSave(){
	
	//첨부파일 검사
	//확장자 검사
		
	var fileName = free.t_attach.value;
	if(fileName !=""){
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
		if(extension != "jpg" && extension != "gif" && extension != "png"){
//		if(extension != "pdf" && extension != "hwp"){
			alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
			return;
		}		
	}
		
	//첨부 용량 체크	
	var file = free.t_attach;
	var fileMaxSize  = 1; // 첨부 최대 용량 설정
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
	
	if(checkValue(free.t_title,"제목 입력!")) return;
	if(checkValue(free.t_content,"내용 입력!")) return;
	if(checkValue(free.t_reg_date,"등록일자 선택!")) return;
	free.method="post";
	free.action="db_freeboard_save.jsp";
	free.submit();
	
}


</script>





