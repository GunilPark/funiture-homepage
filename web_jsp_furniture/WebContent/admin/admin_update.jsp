<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>    
<%@ include file="../common_head.jsp" %>
<%

	Member_dao dao = new Member_dao();
	Member_dto dto = null;
	String id = request.getParameter("t_id");
	if(sessionId.equals("")){
%>
		<script type="text/javascript">
			alert("로그인정보가 만료 되었거나 로그인되지 않았습니다.");
			location.href="member_login.jsp";
		</script>	
<%		
	}else if(sessionLevel.equals("top")){
		dto = dao.getMemberView(id);
	}else {
		dto = dao.getMemberView(sessionId);
	}
%>   
<html>
<head>
<link href="../css/sub_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
	
		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a>MY INFO</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER UPDATE
			</p>
			<form name="join">
			<input type="hidden" name="t_id" value="<%=dto.getId()%>">
			
			<table class="boardForm">
			  <colgroup>
				<col width="200" />
				<col width="500" />
			  </colgroup>
			  <tbody>
				<tr>
				  <th><label for="id">I D</label></th>
				  <td><%=dto.getId()%>
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><input name="t_name" value="<%=dto.getName()%>" maxlength="10"  type="text" size="8" id="nana"></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
					<select name="t_area" >
						<option value="서울" <%if(dto.getArea().equals("서울")) out.print("selected");%>>서울</option>
						<option value="대전" <%if(dto.getArea().equals("대전")) out.print("selected");%>>대전</option>
						<option value="부산" <%if(dto.getArea().equals("부산")) out.print("selected");%>>부산</option>
						<option value="대구" <%if(dto.getArea().equals("대구")) out.print("selected");%>>대구</option>        
					</select>	  
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><input name="t_address" value="<%=dto.getAddress()%>" maxlength="50" type="text" size="40"></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					<input name="t_tell_1" value="<%=dto.getTell_1()%>" maxlength="3" type="text" size="2"> -
					<input name="t_tell_2" value="<%=dto.getTell_2()%>" maxlength="4" type="text" size="3"> -
					<input name="t_tell_3" value="<%=dto.getTell_3()%>" maxlength="4" type="text" size="3">
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					  <input type="radio" value="f" <%if(dto.getGender().equals("f"))out.print("checked");%> name="t_gender" class="middleCheck" /> 여&nbsp;&nbsp;        
					  <input type="radio" value="m" <%if(dto.getGender().equals("m"))out.print("checked");%> name="t_gender" class="middleCheck" /> 남        
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					  <input type="checkbox" value="y" <%if(dto.getHobby_travel().equals("y"))out.print("checked");%> name="t_hobby_travel" class="middleCheck" /> 여행&nbsp;&nbsp; 
					  <input type="checkbox" value="y" <%if(dto.getHobby_reading().equals("y"))out.print("checked");%> name="t_hobby_reading" class="middleCheck" /> 독서&nbsp;&nbsp; 
					  <input type="checkbox" value="y" <%if(dto.getHobby_sports().equals("y"))out.print("checked");%> name="t_hobby_sports" class="middleCheck" /> 운동
				  </td>
				</tr>
				
				<%if(sessionLevel.equals("top")){ %>
				<tr>
				  <th>권한</th>
				  <td>
					<select name="t_level_gubun" >
						<option value="top" <%if(dto.getLevel_gubun().equals("top")) out.print("selected");%>>top</option>
						<option value="manager" <%if(dto.getLevel_gubun().equals("manager")) out.print("selected");%>>manager</option>
						<option value="member" <%if(dto.getLevel_gubun().equals("member")) out.print("selected");%>>member</option>    
					</select>	
					<input type="hidden" name="t_password" value="<%=dto.getPassword()%>">  
				  </td>
				</tr>
				<% }else{ %>
				<tr>
				  <th>비밀번호확인</th>
				  <td>
				 	<input name="t_level_gubun" type="hidden" value="<%=sessionLevel%>">
				  	<input type="hidden" name="t_password" value="<%=dto.getPassword()%>">
				  	<input name="t_password_confirm"  maxlength="10" type="password" size="13">
				  </td>
				</tr>
				<% } %>
			  </tbody>
			</table>
			</form>
<div class="buttonGroup_center">

<%if(sessionLevel.equals("top")){ %>
	<a href="javascript:goUpdate2()" class="butt">수정 저장</a>
<%}else{ %>
	<a href="javascript:goUpdate()" class="butt">수정 저장</a>
<%} %>
<!--  	
	<a href="member_login.jsp" class="butt">로그인</a>
	<input type="button" onclick="goJoin()" value="회원가입">
	<input type="button" onclick="location.href='member_login.jsp'" value="로그인">
-->
</div>	
		</div>	

		<%@ include file="../common_footer.jsp" %>
		</div>
</body>
</html>


<script type="text/javascript">

	function goUpdate(){
		if(checkValue(join.t_name,"성명 입력!")) return;

		if(checkValue(join.t_address,"주소 입력!")) return;
		if(checkValue(join.t_tell_1,"첫번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_2,"두번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_3,"세번째 연락처 입력!")) return;		

		if(checkValue(join.t_password_confirm,"비밀번호 확인 입력!")) return;
		if(join.t_password.value != join.t_password_confirm.value){
			alert("비밀번호가 맞지 않습니다.");
			join.t_password_confirm.select();
			return;
		}
		
		join.method="post";
		join.action="db_member_update.jsp";
		join.submit();
	}
	function goUpdate2(){
		if(checkValue(join.t_name,"성명 입력!")) return;

		if(checkValue(join.t_address,"주소 입력!")) return;
		if(checkValue(join.t_tell_1,"첫번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_2,"두번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_3,"세번째 연락처 입력!")) return;		
		
		join.method="post";
		join.action="db_member_update.jsp";
		join.submit();
	}

</script>
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












