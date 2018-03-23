<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
	<title>Home</title>
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





</style>
	
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<div>검색 길게길게길게조건</div>
<div>메뉴?</div>
<div>뭘로채움?</div>
<div>우선채움</div>
</div>



<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "700px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>


<div style="position:relative">

<div class="mySlides">
  <img src="https://vignette.wikia.nocookie.net/overwatch152/images/1/1b/%ED%83%90%EC%82%AC_%EA%B8%B0%EC%A7%80_%EB%82%A8%EA%B7%B9_%EC%95%84%EC%9D%B4%EC%BD%98.png/revision/20161206024609?path-prefix=ko"
  style=width:100%;>
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
  style="width:100%">
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
  <img src="main3.jpg" style="width:100%">
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
  <img src="main1.jpg" style="width:100%">
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
  <img src="main2.jpg" style="width:100%">
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

<div style="font-size:50px; text-align:center; padding:2%">
Playground Location service
<br>
___________
</div>


<div style="font-size:30px; text-align:center; padding:1%">
플레이그라운드에서 제공하는 위치서비스입니다
</div>









</body>
</html>
