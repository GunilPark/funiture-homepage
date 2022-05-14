<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/sub_c.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>
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
</head>
<body>
	<div id="container">

		<div id="b_top_menu">
			<ul class="top_menu">
				<li><a href="../member/member_join.html">Contack</a></li>
				<li><a href="../member/member_login.html">LogIn</a></li>
				<li><a href="../index.html"><i class="fa fa-home"></i>Home</a></li>
			</ul>
		</div>	

		<div id="b_top">
			<ul class="main_menu">
				<li><a href="">Office</a>
					<div>
						<ul>
							<li><a href="">Bells</a></li>
							<li><a href="">Camping</a></li>
							<li><a href="">Embrocation</a></li>
							<li><a href="">Fenders</a></li>
							<li><a href="">Kickstands</a></li>
							<li><a href="">Horns</a></li>
						</ul>
					</div>
				</li>
				<li><a href="">Wooden</a>
					<div>
						<ul>
							<li><a href="">BMX</a></li>
							<li><a href="">Cyclocross</a></li>
							<li><a href="">Forks</a></li>
							<li><a href="">Frames</a></li>
						</ul>
					</div>
				
				</li>
				<li><a href="">Sofa</a>
					<div class="div3">
						<ul>
							<li><a href="">3sub menu 1</a></li>
							<li><a href="">3sub menu 2</a></li>
							<li><a href="">3sub menu 3</a></li>
						</ul>
					</div>				
				</li>
				<li><a href="">kKtchen</a>
					<div class="div4">
						<ul>
							<li><a href="">4sub menu 1</a></li>
							<li><a href="">4sub menu 2</a></li>
							<li><a href="">4sub menu 3</a></li>
							<li><a href="">4sub menu 4</a></li>
							<li><a href="">4sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="">Chiffonier</a>
					<div class="div5">
						<ul>
							<li><a href="">5sub menu 1</a></li>
							<li><a href="">5sub menu 2</a></li>
							<li><a href="">5sub menu 3</a></li>
							<li><a href="">5sub menu 4</a></li>
							<li><a href="">5sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="">Chair</a>
					<div class="div6">
						<ul>
							<li><a href="">6sub menu 1</a></li>
							<li><a href="">6sub menu 2</a></li>
							<li><a href="">6sub menu 3</a></li>
							<li><a href="">6sub menu 4</a></li>
							<li><a href="">6sub menu 5</a></li>
						</ul>
					</div>					
				</li>
				<li><a href="">Notice & News</a>
					<div class="div7">
						<ul>
							<li><a href="notice_list.html">NOTICE</a></li>
							<li><a href="">NEWS</a></li>
							<li><a href="">Q AND A</a></li>
							<li><a href="">FREE BOARD</a></li>
							<li><a href="">ETC</a></li>
						</ul>
					</div>					
				</li>
			</ul>		
		</div>	
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.jsp"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
				<li><a href="">NEWS</a></li>
				<li><a href="">Q & A</a></li>
				<li><a href="">FREE BOARD</a></li>
				<li><a href="">ETC</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				NOTICE
			</p>
			
			<table class="boardForm">
				<colgroup>
					<col width="15%">
					<col width="55%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th>Title</th>
						<td colspan="2">구매 절차 과정 안내 드립니다.</td>
						<td> <i class="far fa-eye"></i> 152</td>
					</tr>	
					<tr>
						<th>Content</th>
						<td colspan="3">
							<textarea class="textArea_H250_noBorder" readonly>구매 절차 과정 안내 드립니다.구매 절차 과정 안내 드립니다.구매 절차 과정 안내 드립니다.</textarea>
						</td>
					</tr>	
					<tr>
						<th>Attach</th>
						<td colspan="3">구매안내.hwp</td>
					</tr>	
					<tr>
						<th>Writer</th>
						<td>관리자</td>
						<th>RegDate</th>
						<td>2020-09-01</td>
					</tr>	

				</tbody>
			</table>
			<div class="buttonGroup">
				<a href="" class="butt">Delete</a>
				<a href="notice_update.html" class="butt">Update</a>
				<a href="notice_list.html" class="butt">List</a>
			</div>	
		</div>	

		<div id="b_bottom">
			<div class="b_bottom_left">
				<img src="../images/footer_logo_4.jpg">
			</div>
			<div class="b_bottom_center">
				<p>개인정보처리방침  | 개인정보보호정책 | 이용약관 | 협회소개</p>
				우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
				TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
				COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED		
			</div>
			<div class="b_bottom_right">
				서울사무소: (02) 4545- 8545<br>
				대전사무소: (042) 5417- 8842<br>
				광주사무소: (052) 4545- 2214<br>
				부산사무소: (048) 4545- 7546
			</div>		
		</div>	
	</div>	
</body>
</html>






