<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common_head.jsp" %>
	
		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a href="member_login.jsp">LOGIN</a></li>
				<li><a href="member_info_find.jsp">ID / PASSWORD</a></li>
				<li><a href="member_join.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> CONTACK</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER JOIN
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
				  <td>
					<input name="t_id" maxlength="10" type="text" size="10" id="id" title="id입력하세요">
					<input type="button" id="check" value="ID중복검사" class="checkB">
					<input type="hidden" id="checkValue" value="" name="t_idCheck">
					<span id="idReasult"></span>
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><input name="t_name"  maxlength="10"  type="text" size="8" id="nana"></td>
				</tr>
				<tr>
				  <th>비빌번호</th>
				  <td><input name="t_password"  maxlength="10" type="password" size="13"></td>		  
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td><input name="t_password_confirm"  maxlength="10" type="password" size="13"></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
					<select name="t_area" >
						<option value="서울">서울</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>        
					</select>	  
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><input name="t_address"  maxlength="50" type="text" size="40"></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					<input name="t_tell_1" maxlength="3" type="text" size="2"> -
					<input name="t_tell_2" maxlength="4" type="text" size="3"> -
					<input name="t_tell_3" maxlength="4" type="text" size="3">
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					  <input type="radio" value="f" name="t_gender" class="middleCheck" /> 여&nbsp;&nbsp;        
					  <input type="radio" value="m" name="t_gender" class="middleCheck" /> 남        
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					  <input type="checkbox" value="y" name="t_hobby_travel" class="middleCheck" /> 여행&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_reading" class="middleCheck" /> 독서&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_sports" class="middleCheck" /> 운동
				  </td>
				</tr>
			  </tbody>
			</table>
			</form>
<div class="buttonGroup_center">
	<a href="javascript:goJoin()" class="butt">JOIN</a>
	<input type="button" onclick="goJoin()" value="회원가입">
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
var check = false;
$("#id").on("change keyup paste proportychange input",function(){
	$("#idReasult").text("");
	check = false;
})

$("#check").click(function(){
	if(checkValue(join.t_id,"ID 입력!")){ 
		return;
	}else{
		$.ajax({
            type : "POST",
            url : "member_checkId.jsp",
            data: "t_id="+join.t_id.value,
            dataType : "text",
            error : function(){
               alert('통신실패!!');
            },
            success : function(data){
               $("#idReasult").text(data);
               if($.trim(data) =="중복된 ID 사용 불가!"){
            	   $("#idReasult").css("color","red");
            	   check = false;
            	   $("#checkValue").val("");
               }else{
            	   $("#idReasult").css("color","blue");
            	   check = true;
            	   $("#checkValue").val(join.t_id.value);
               }
               
            }
         });
		
	}

})




	function checkValue(obj,msg){
		if(obj.value==""){
			alert(msg);
			obj.focus();
			return true;
		}else{
			return false;
		}
	}
	function goJoin(){
		if(checkValue(join.t_id,"ID 입력!")) return;
		if(checkValue(join.t_name,"성명 입력!")) return;

		if(checkValue(join.t_password,"비밀번호 입력!")) return;
		if(checkValue(join.t_password_confirm,"비밀번호 확인 입력!")) return;
		
		if(join.t_password.value != join.t_password_confirm.value){
			alert("비밀번호가 같지 않습니다.");
			join.t_password_confirm.select();
			return;
		}

		if(checkValue(join.t_address,"주소 입력!")) return;
		if(checkValue(join.t_tell_1,"첫번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_2,"두번째 연락처 입력!")) return;		
		if(checkValue(join.t_tell_3,"세번째 연락처 입력!")) return;		

		if(checkValue(join.t_gender,"성별을 선택하시오!")) return;
		if(check == false){
			alert("id중복체크(사용가능한 아이디 입력 바람)!");
			join.t_id.focus();
			return;
		}
		if(join.t_id.value != join.t_idCheck.value){
			alert("변경된 id중복체크(사용가능한 아이디 입력 바람)!");
			join.t_id.focus();
			return;
		}
		
		join.method="post";
		join.action="db_member_join.jsp";
		join.submit();
		
	}

</script>
<script type="text/javascript">

</script> 

