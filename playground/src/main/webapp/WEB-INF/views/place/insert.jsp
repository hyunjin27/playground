<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript">
 
     var openWin;
 
     function openChild()
     {
         window.name = "parentForm";
         openWin = window.open("search.play",
                 "childForm", "width=800, height=600, resizable = no, scrollbars = no");    
     }
	
     function viewmap(){
    	 var url = "https://plus.codes/";
	   	 var url2 = document.getElementById('code').value;
    	 //alert(url+url2);
    	 window.open(url+url2,"plusmap","width=800, height=600, resizable = no, scrollbars = no");
     }
</script>
<h3>오락실 등록</h3>
<div id="form">
<form id="parentForm" action="insert.play" method="post">
<ul>
<li>오락실 명 : <input type="text" size="50" name="name"></li>
<li>오락실 위치코드 : <input id="code" type="text" size="20" name="addr"><input type="button" value="위치코드 찾기" onclick="openChild()"><input type="button" value="해당위치 지도로 보기" onclick="viewmap()"></li>
<li>설명 : <textarea name="detail" cols="20" rows="5"></textarea></li>
<li><input type="submit"></li>
</ul>
</form>
</div>


