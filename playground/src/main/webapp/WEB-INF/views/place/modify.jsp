<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.userid}">
	<script>
	alert('로그인 후 접근바랍니다.');
	location.href='login.play';
	</script>
</c:if>
<c:if test="${not empty sessionScope.userid}">
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
<h3>오락실 수정</h3>
<div id="form">
<form id="parentForm" action="place_mod_do.play" method="post">
<ul>
<li>오락실 명 : <input type="text" size="50" name="p_name" required="required" value="${dto.p_name}"></li>
<li>오락실 위치코드 : <input id="code" type="text" size="20" name="p_addr" required="required" value="${dto.p_addr}"><input type="button" value="위치코드 찾기" onclick="openChild()"><input type="button" value="해당위치 지도로 보기" onclick="viewmap()"></li>
<li>오락실 지역 : <input id="p_area" type="text" size="20" name="p_area" readonly="readonly" value="${dto.p_area}"></li>
<li>설명 : <textarea name="p_detail" cols="20" rows="5">${dto.p_detail}</textarea></li>
<li><input type="submit"></li>
</ul>
<input type="hidden" name="reguser" value="${sessionScope.userid}">
<input type="hidden" name="p_no" value="${p_no}">
</form>
</div>
</c:if>