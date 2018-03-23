<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width:300; height:65; margin:0 auto;">
<a href="<%=request.getContextPath() %>/">    
<img src="https://www.playground-games.com/wp-content/uploads/2016/07/logo_4_RGB.png" width="250" height="62">
</a>
	<div id="loginbtn" style="position: relative; top: -75px; left: 150%;">
		<c:if test="${empty sessionScope.userid }">
			<input type="button" value="login" onclick="location.href='login.play'">
			<input type="button" value="join" onclick="location.href='join.play'">
		</c:if>
		<c:if test="${not empty sessionScope.userid }">
			<input type="button" value="logout" onclick="location.href='logout.play'">
			<input type="button" value="mypage" onclick="location.href='mypage.play'">
		</c:if>
		<input type="button" value="help">
	</div>
</div>
<div style="width:800; height:50; margin:0 auto; text-align:center;">
<h4>메뉴 | 메뉴 | 메뉴 | 메뉴 | 메뉴</h4>
</div>