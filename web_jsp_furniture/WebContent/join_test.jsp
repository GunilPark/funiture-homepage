<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/sub_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>

</head>
<body>
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
					<input name="t_id" type="text" size="10" id="id" title="id입력하세요">
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
				  <td><input name="t_pw"  maxlength="10" type="password" size="13"></td>		  
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td><input name="t_pw_check"  maxlength="10" type="password" size="13"></td>
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
			<div class="buttonGroup_center">
				<a href="javascript:goJoin()" class="butt">회원가입</a>
				<a href="javascript:goReset()" class="butt">초기화</a>
			</div>
			</form>
				
</body>
</html>
<script type="text/javascript">
	
function goJoin(){
	var id = join.t_id.value;
	if(id.length > 10 ){
		alert("id는 10자리 이내입니다.");
		join.t_id.focus();
		return;
	}else if(id.length == 0){
		alert("id를 입력바랍니다.");
		join.t_id.focus();
		return;
	}
	if(join.t_name.value == ""){
		alert("회원성명을 입력하세요.");
		join.t_name.focus();
		return;
	}
	if(join.t_pw.value == ""){
		alert("비밀번호를 입력하세요.");
		join.t_pw.focus();
		return;
	}
	if(join.t_pw_check.value != join.t_pw.value){
		alert("비밀번호를 확인하세요.");
		join.t_pw_check.focus();
		return;
	}
	if(join.t_area.value == ""){
		alert("지역을 입력하세요.");
		join.t_area.focus();
		return;
	}
	if(join.t_address.value == ""){
		alert("주소를 입력하세요.");
		join.t_address.focus();
		return;
	}
	if(join.t_gender.value == ""){
		alert("남여구분을 선택하세요.");
		return;
	}
	if(!join.t_hobby_travel.checked  && !join.t_hobby_reading.checked && !join.t_hobby_sports.checked ) {
		alert("취미는 최소 하나 이상입니다.");
		return;
	}
	alert("정상적으로 등록 되었습니다.");
}

function goReset(){
	var check = confirm("모든 정보를 지우고 다시 시작합니다.");
	if(check == true){
		join.reset();
		join.t_id.focus();
	}
}
	


</script>
