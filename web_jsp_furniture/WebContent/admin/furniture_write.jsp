<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="common.*" %>
<%@ include file="../common_head.jsp" %>

<%
	if(!sessionLevel.equals("top")){
%>
		<script type="text/javascript">
			alert("로그인 하지 않았거나 글쓰기 권한이 없습니다.");
			location.href="../index.jsp";
		</script>
<%	} %>

		<div id="b_left">
		<P>Furniture</P>
			<ul>
				<li><a href="/admin/admin_list.jsp"> admin</a></li>
				<li><a href="/admin/furniture_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> furniture</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<form name="furniture" enctype="multipart/form-data">
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>제품명</th>
						<td colspan="3"><input type="text" name="t_p_name" style="width:400px;" class="input600"></td>
					</tr>	
					<tr>
						<th>사이즈</th>
						<td colspan="3"><input type="text" name="t_p_size" style="width:400px;" class="input600"></td>
					</tr>	
					<tr>
						<th>정렬순서</th>
						<td colspan="3">
						<select name="t_img_order">
							<option value="7">없음</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
						</td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3"><input name="t_attach" type="file" class="input600"></td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td><%=sessionName%></td>
						<th>RegDate</th>
						<td><input type="date" name="t_reg_date" readonly value="<%=CommonUtil.getToday()%>" class="input130"></td>
					</tr>	
				</tbody>
			</table>
			</form>
			<div class="buttonGroup">
				<a href="javascript:goSave()" class="butt">Save</a>
				<a href="furniture_list.jsp" class="butt">List</a>
			</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>		
		</div>	
	</div>	

</html>

<script type="text/javascript">
    //<![CDATA[
    $(function(){
    	$(".main_menu > li > a").mouseover(function(){
			$(".main_menu li div").hide();
			$(this).next().slideDown(500);
    	});    
    	$(".main_menu").mouseleave(function(){
			$(".main_menu li div").stop().slideUp(500);
		}) 
    });     
    //]]>
</script> 

<script>
function goSave(){

//첨부파일 검사
//확장자 검사
var fileName = furniture.t_attach.value;
if(fileName !=""){
	var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
	var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
	//파일명.확장자
	if(extension != "jpg" && extension != "gif" && extension != "png"){
//	if(extension != "pdf" && extension != "hwp"){
		alert(extension +" 형식 파일은 업로드 안됩니다. 한글, jpg,gif,png 파일만 가능!");
		return;
	}		
}
//첨부 용량 체크	
var file = furniture.t_attach;
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
		if(checkValue(furniture.t_p_name,"제품명 입력!")) return;
		if(checkValue(furniture.t_p_size,"내제품 사이즈 입력!")) return;
		if(checkValue(furniture.t_img_order,"등록 순서 입력!")) return;
		if(checkValue(furniture.t_attach,"이미지 파일 입력!")) return;
		furniture.method="post";
		furniture.action="db_furniture_save.jsp";
		furniture.submit();
	}
</script>




