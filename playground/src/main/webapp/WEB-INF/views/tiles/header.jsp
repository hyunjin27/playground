<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width:352; height:109; margin: auto;">
<a href="<%=request.getContextPath() %>/">    
<img src="<%=request.getContextPath() %>/resources/images/pp_logo.jpg" border=0>
</a>
	<div id="loginbtn" style="position: relative; top: -70px; left: 80%;">
		<c:if test="${empty sessionScope.userid }">
			<input type="button" value="login" onclick="location.href='login.play'">
			<input type="button" value="join" onclick="location.href='join.play'">
		</c:if>
		<c:if test="${not empty sessionScope.userid }">
			<input type="button" value="logout" onclick="location.href='logout.play'">
			<input type="button" value="mypage" onclick="location.href='mypage.play'">
		</c:if>
		<input type="button" value="help" onclick="window.location.href = 'mailto:help@p1ayground.server'">
	</div>
</div>
<div style="position: relative; width:80%; height:50; top:-20px; margin:0 auto; text-align:center;">
<h4><a href="new_place.play">오락실 신규등록</a> | 메뉴 | 메뉴 | 메뉴 | 메뉴</h4>
</div>