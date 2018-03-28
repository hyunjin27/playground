<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
/* 오른쪽으로 나오는 사이드바 */
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}
.sidenav a{
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}
.sidenav div{
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}
.sidenav a:hover {
    color: #f1f1f1;
}
.sidenav div:hover {
    color: #f1f1f1;
}
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
/* 딱하나 있는 테이블  */
.table_layout{width:80%;}
table{width:80%; height:60%; margin-left:8%; margin-right:8%;
}
</style>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div>
<img src="https://www.playground-games.com/wp-content/uploads/2016/07/logo_4_RGB.png"
style="width:220; height:70;">
</div>

<div>
    오락실 이름:<br>
  <input type="text" name="firstname">

</div>
<div>
    게임이름:<br>
  <input type="text" name="lastname">
</div>
<div>
  별칭(ex:야구맨):<br>
  <input type="text" name="lastname">
</div>
<div>
	몇명까지 알아 보셨어요?	
	<br>
	<input type=radio name=type id=type value=f_travel checked=checked>1인
	<input type=radio name=type id=type value=f_airplane>2인
	<input type=radio name=type id=type value=f_hotel>4인
</div>
<div>
	장르
	<br>
	<input type=radio name=type id=type value=f_hotel>고전게임
	<input type=radio name=type id=type value=f_hotel>격투게임
	<br>
	<input type=radio name=type id=type value=f_hotel>레이싱게임
	<input type=radio name=type id=type value=f_hotel>리듬게임
	<br>
	<input type=radio name=type id=type value=f_hotel>발판게임
	<input type=radio name=type id=type value=f_hotel>건슈팅게임
	<br>
	<input type=radio name=type id=type value=f_hotel>종스크롤슈팅게임(비행기)
</div>
<div>
<input type=submit value=검색하기><!-- 아이콘을 넣어보자 -->

</div>
</div>



<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>


<div style="position:relative">

<div class="mySlides">
  <img src="https://vignette.wikia.nocookie.net/overwatch152/images/1/1b/%ED%83%90%EC%82%AC_%EA%B8%B0%EC%A7%80_%EB%82%A8%EA%B7%B9_%EC%95%84%EC%9D%B4%EC%BD%98.png/revision/20161206024609?path-prefix=ko"
  style="width:100%; height:60%;" >
  <div style="position:absolute; top:50%;left:50%; transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%); 
  font-size:18px; color:white; text-align:center;">
   <h1> 어머님, 책상을 이제 당신은 있습니다</h1>
   <p>Example. Use ato mark up a photo in a documen</p>
    <br>
	<br>
<span style="color:white; border:2px solid red; border-radius:15px; padding:8px;
background-color:red; cursor:pointer;" onclick="openNav()">빠른검색</span>

   
  </div>
  
</div>

<div class="mySlides">
  <img src="https://images.samsung.com/is/image/samsung/sec-feature-curved-cfg73-lc27fg73fqkxkr-65739041?$FB_TYPE_A_JPG$" 
  style="width:100%; height:60%;">
  <div style="position:absolute; top:50%;left:50%; transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%); 
  font-size:18px; color:white; text-align:center;">
    <h1>무엇인지 내 같이 프랑시스 당신은 이름과,</h1>
    	<p> 아니하고는 체포 또는 구속을 당하지 아니한다</p> 
   <br>
	<br>
<span style="color:white; border:2px solid red; border-radius:15px; padding:8px;
background-color:red; cursor:pointer;" onclick="openNav()">빠른검색</span>
  </div>

</div>

<div class="mySlides">
  <img src="https://vignette.wikia.nocookie.net/overwatch152/images/1/1b/%ED%83%90%EC%82%AC_%EA%B8%B0%EC%A7%80_%EB%82%A8%EA%B7%B9_%EC%95%84%EC%9D%B4%EC%BD%98.png/revision/20161206024609?path-prefix=ko"
  style="width:100%; height:60%;" >
  <div style="position:absolute; top:50%;left:50%; transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%); 
  font-size:18px; color:black; text-align:center;">
    프랑시스 당신은 이름과, 까닭입니다. 그리워 가슴속에 
   <br>
	<br>
<span style="color:white; border:2px solid red; border-radius:15px; padding:8px;
background-color:red; cursor:pointer;" onclick="openNav()">빠른검색</span>

  </div>
</div>

<div class="mySlides">
  <img src="https://images.samsung.com/is/image/samsung/sec-feature-curved-cfg73-lc27fg73fqkxkr-65739041?$FB_TYPE_A_JPG$" 
  style="width:100%; height:60%;">
  <div style="position:absolute; top:50%;left:50%; transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%); 
  font-size:18px; color:black; text-align:center;">
    추억과 이런 이국 패, 별이 벌써 아침이 오면 있습니다.
    <br>
	<br>
<span style="color:white; border:2px solid red; border-radius:15px; padding:8px;
background-color:red; cursor:pointer;" onclick="openNav()">빠른검색</span>
  </div>
</div>

<div class="mySlides">
  <img src="https://vignette.wikia.nocookie.net/overwatch152/images/1/1b/%ED%83%90%EC%82%AC_%EA%B8%B0%EC%A7%80_%EB%82%A8%EA%B7%B9_%EC%95%84%EC%9D%B4%EC%BD%98.png/revision/20161206024609?path-prefix=ko"
  style="width:100%; height:60%;" >
  <div style="position:absolute; top:50%;left:50%; transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%); 
  font-size:18px; color:black; text-align:center;">
	라이너 남은 거외다. 소녀들의 멀듯이, 불러 벌레는 있습니다.
<br>
	<br>
<span style="color:white; border:2px solid red; border-radius:15px; padding:8px;
background-color:red; cursor:pointer;" onclick="openNav()">빠른검색</span>
  </div>
  
  
</div>

<button style="border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:white;background-color:black;text-align:center;cursor:pointer;white-space:nowrap;
position:absolute;top:50%;left:0%;transform:translate(0%,-50%);-ms-transform:translate(-0%,-50%);"
onclick="plusDivs(-1)">&#10094;</button>
<button style="border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:white;background-color:black;text-align:center;cursor:pointer;white-space:nowrap;
position:absolute;top:50%;right:0%;transform:translate(0%,-50%);-ms-transform:translate(0%,-50%)"

onclick="plusDivs(1)">&#10095;</button>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);
function plusDivs(n) {
  showDivs(slideIndex += n);
}
function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
<!-- 사진움직이는버튼까지 -->

<div style="font-family: 'Nanum Pen Script', cursive; font-size:50px; text-align:center; padding:2%">
Playground Recommend service
<br>
___________
</div>
<div style="text-align:center; padding:2%; font-size:20px;">
<p>플레이그라운드웹사이트에서 제공하는 추천 오락실입니다</p>
</div>
<div class="table_layuout">
	<table style="border-spacing:20px;">
		<colgroup>
			<col width="40%"/>
			<col width="40%"/>
		</colgroup>
<tr>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-aac8bb1f681c6c5e71da918b7048f00c.png"
	style="width:60; height:60; align:left;"></a>
	확 달라진 오락실 남녀구분 없이 모두 즐길 거리가 잔뜩! 
	땀 흘리며 춤을 출수도 감미롭게 노래를 부를수도 있어요
	
	</td>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-94779de2944e9a72fd16dac1ab01b3aa-joystick.png"
	style="width:60; height:60; align:left;"></a>
	구경하기만 해도 눈이 돌아가고 입이 떡 벌어지는 리듬 게임의 세계
	보고 있으면 한번 쯤은 꼭 해보게 됩니다 
	</td>
</tr>
<tr>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-d49fa7141745c105ee5f3a8a8e7cf8c0.png"
	style="width:60; height:60; align:left;"></a>
	추억속에 학창시절을 떠올릴 수도 있고 협동해가며 스테이지를 넘어갈 때 마다 
	우정업! 시간가는 줄 모를 거예요
	</td>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-94779de2944e9a72fd16dac1ab01b3aa-joystick.png"
	style="width:60; height:60; align:left;"></a>
	귀는 봄날의 내려온 희망의 것이다. 노년에게서 관현악이며, 곳이 크고 주는 있는가? 
	쓸쓸한 따뜻한 그들은 보는 커다란 크고 때문이다. 
	
	</td>
</tr>
<tr>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-d49fa7141745c105ee5f3a8a8e7cf8c0.png"
	style="width:60; height:60; align:left;"></a>
	귀는 봄날의 내려온 희망의 것이다. 노년에게서 관현악이며, 곳이 크고 주는 있는가? 
	쓸쓸한 따뜻한 그들은 보는 커다란 크고 때문이다. 
	</td>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-94779de2944e9a72fd16dac1ab01b3aa-joystick.png"
	style="width:60; height:60; align:left;"></a>
	귀는 봄날의 내려온 희망의 것이다. 노년에게서 관현악이며, 곳이 크고 주는 있는가? 
	쓸쓸한 따뜻한 그들은 보는 커다란 크고 때문이다. 
	</td>
</tr>
<tr>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-0b03c8d3718feed37ce95f47aaf819b1.png"
	style="width:60; height:60; align:left;"></a>
	귀는 봄날의 내려온 희망의 것이다. 노년에게서 관현악이며, 곳이 크고 주는 있는가? 
	쓸쓸한 따뜻한 그들은 보는 커다란 크고 때문이다. 
	</td>
	<td style="background-color:rgb(240,240,240); text-align:center;">
	<h3>
	고전게임특정추천
	
	</h3>
	<a href="";>
	<img src="http://www.myiconfinder.com/uploads/iconsets/256-256-94779de2944e9a72fd16dac1ab01b3aa-joystick.png"
	style="width:60; height:60; align:left;"></a>
	귀는 봄날의 내려온 희망의 것이다. 노년에게서 관현악이며, 곳이 크고 주는 있는가? 
	쓸쓸한 따뜻한 그들은 보는 커다란 크고 때문이다.
	</td>
</tr>
		
	</table>

</div>
