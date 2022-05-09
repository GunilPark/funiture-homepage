<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common_head.jsp" %>

		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a href="member_login.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span>LOGIN</a></li>
				<li><a href="member_info_find.jsp">ID / PASSWORD</a></li>
				<li><a href="member_join.jsp"> JOIN</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER LOGIN
			</p>
		
			<div class="login">
				<div class="member_boxL">
					<h2>LOGIN</h2>
					<div class="login_form">
						<form name="member">
							<input type="hidden" name="t_gubun" value="login">
							<div class="fl_clear"><label for="mbrId">아이디</label><input name="t_id" id="mbrId" type="text" onkeypress="inputCheck(this)"></div>
							<div class="fl_clear"><label for="scrtNo">비밀번호</label><input name="t_password" id="scrtNo" type="password" onkeypress="passwordCheck(this)"></div>
							<a class="btn_login btn_Blue" href="javascript:memberLogin()">로그인</a>
						</form>
					</div>
				   
				</div>		
			</div>

		</div>	
<%@ include file="../common_footer.jsp" %>


	</div>	
</body>
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

<script type="text/javascript">
	function inputCheck(){
		var keyValue = event.keyCode;
		if(keyValue == 13){
			if(member.t_id.value==""){
				alert("ID 입력하시오!");
				return;
			}
			member.t_password.focus();
		}
	}
	function passwordCheck(){
		var keyValue = event.keyCode;
		if(keyValue == 13){
			if(member.t_password.value==""){
				alert("비밀번호 입력!");
				return;
			}else{
				memberLogin();
			}
		}
	}
	function memberLogin(){
		if(checkValue(member.t_id,"ID 입력하시오!")) return;
		if(checkValue(member.t_password,"비밀번호 입력하시오!")) return;
		member.method="post";
		member.action="db_member_login.jsp";
		member.submit();
	}
</script>
