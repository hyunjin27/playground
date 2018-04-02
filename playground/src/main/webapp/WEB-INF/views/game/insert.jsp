<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.userid}">
	<script>
	alert('로그인 후 접근바랍니다.');
	location.href='login.play';
	</script>
</c:if>
<c:if test="${not empty sessionScope.userid}">
<h3>게임 등록</h3>
<div id="form">
<form id="parentForm" action="game_insert.play" method="post">
<ul>
<li>게임명 : <input type="text" size="50" name="g_name" required="required"></li>
<li>장르 :
<select name="g_genre"> 
<c:forEach var="item" items="${g_map}"><option value="${item.key}">${item.value}</option></c:forEach>
</select>
</li>
<li>개발사 : <input type="text" size="50" name="g_company" required="required"></li>
<li>발매일 : <input type="date" name="g_release"> (Arcade Version)</li>
<li>사진 : <input type="text" size="50" name="g_photo"> (URL ONLY)</li>
<li>설명 : <textarea name="g_detail" cols="20" rows="5"></textarea></li>
<li><input type="submit"></li>
</ul>
<input type="hidden" name="g_no" value="0">
<input type="hidden" name="reguser" value="${sessionScope.userid}">
</form>
</div>
</c:if>