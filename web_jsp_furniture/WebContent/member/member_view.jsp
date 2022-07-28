<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common_head.jsp" %>    
    
    
    
<%@ page import="dao.*,dto.*" %>    
<%	
	request.setCharacterEncoding("utf-8");
	Member_dao dao = new Member_dao();
	Member_dto dto = null;
	String key = "";
	if(sessionId.equals("")){
%>
		<script type="text/javascript">
			alert("로그인정보가 만료 되었거나 로그인되지 않았습니다.");
			location.href="member_login.jsp";
		</script>	
<%		
	}else {
		dto = dao.getMemberView(sessionId);
		out.print(dto.getId());
		key = sessionId;
	
%>    	
	
		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a>MY INFO</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				My Info
			</p>
			<form name="join">
			<table class="boardForm">
			  <colgroup>
				<col width="200" />
				<col width="500" />
			  </colgroup>
			  <tbody>
				<tr>
				  <th><label for="id">I D</label></th>
				  <td><%=dto.getId()%></td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><%=dto.getName()%></td>
				</tr>
				<tr>
				  <th>비빌번호</th>
				  <td><%for(int k = 0; k < dto.getPw_lenght(); k++){out.print("*");}%></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td><%=dto.getArea()%></td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><%=dto.getAddress()%></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
				  	<%=dto.getTell_1()%> -
				    <%=dto.getTell_2()%> -
				    <%=dto.getTell_3()%> 
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
				  <%
				  	if(dto.getGender().equals("m")) out.print("남");
				    else out.print("여");
				  %>
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
				  <%
				  	if(dto.getHobby_travel().equals("y")) out.print("여행&nbsp;&nbsp;");
				  	if(dto.getHobby_reading().equals("y")) out.print("독서&nbsp;&nbsp;");
				  	if(dto.getHobby_sports().equals("y")) out.print("운동");
				  %>
				  </td>
				</tr>
				<tr>
				  <th>가입일자</th>
				  <td><%=dto.getReg_date()%>
				  </td>
				</tr>
			  </tbody>
			</table>
			</form>
<div class="buttonGroup_center">
	<a href="javascript:goUpdateForm('<%=key%>')" class="butt">정보 수정</a>
	<a href="javascript:goDeleteForm('<%=key%>')" class="butt">회원 탈퇴</a>
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
<form name="update">
<input name="t_id" type="hidden" value="<%=sessionId%>">
<input name="t_pw" type="hidden" value="<%=dto.getPassword()%>">
</form>
<script type="text/javascript">
	function goUpdateForm(key){
		update.t_id.value = key;
		update.method ="post";
		update.action ="member_update.jsp";
		update.submit();
	}
	function goDeleteForm(key){
		if(confirm("정말 타퇴 하시겠습니까?")){
			var pw =prompt("비밀번호를 입력하시오!");
			if(update.t_pw.value == pw){
				update.t_id.value = key;
				update.method ="post";
				update.action ="db_member_delete.jsp";
				update.submit();
			}else{
				alert("비밀번호 입력 오류!!")
			}
		}
		
	}
	
</script>
<%}%>