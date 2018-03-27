<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.userid}">
	<script>
	alert('로그인 후 접근바랍니다.');
	location.href='login.play';
	</script>
</c:if>
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
<li>오락실 명 : <input type="text" size="50" name="p_name" required="required"></li>
<li>오락실 위치코드 : <input id="code" type="text" size="20" name="p_addr" required="required"><input type="button" value="위치코드 찾기" onclick="openChild()"><input type="button" value="해당위치 지도로 보기" onclick="viewmap()"></li>
<li>설명 : <textarea name="p_detail" cols="20" rows="5"></textarea></li>
<li><input type="submit"></li>
</ul>
<input type="hidden" name="reguser" value="${sessionScope.userid}">
</form>
</div>
