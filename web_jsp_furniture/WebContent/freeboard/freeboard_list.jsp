<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common_head.jsp" %>
	
		<div id="b_left">
			<P>NOTICE & NEWS</P>
			<ul>
				<li><a href="notice_list.html"><span class="fnt"><i class="fas fa-apple-alt"></i></span> NOTICE</a></li>
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
			<p class="select_box">
				<select class="sel_box">
					<option>Title</option>
					<option>Content</option>
				</select>
				<input type="text" class="sel_text">

				<button type="submit" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="5%">
					<col width="10%">
					<col width="14%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Attach</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>9</td>
						<td class="t_center"><a href="notice_view.html">구매 절차 과정 안내 드립니다.</a></td>
						<td><img src="../images/clip.png"></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>8</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>7</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td><img src="../images/clip.png"></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>6</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td><img src="../images/clip.png"></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>5</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>4</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>3</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>2</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>1</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
					<tr>
						<td>0</td>
						<td class="t_center">구매 절차 과정 안내 드립니다.</td>
						<td></td>
						<td>관리자</td>
						<td>2020-07-28</td>
						<td>412</td>
					</tr>	
				</tbody>
			</table>
			
			<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="" class="active">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				<a href="notice_write.html" class="write">글쓰기</a>
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




