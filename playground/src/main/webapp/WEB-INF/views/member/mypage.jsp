<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
</head>
<body>
<h2>welcome home, ${sessionScope.name}</h2>
<input type="button" value="정보수정" onclick="location.href='useredit.bob?userid=${sessionScope.userid}'">
<input type="button" value="탈퇴" onclick="location.href='quit.bob'">
<input type="button" value="로그아웃" onclick="location.href='logout.bob'">
</body>
</html>