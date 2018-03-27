<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>welcome home, ${sessionScope.name}</h2>
<input type="button" value="정보수정" onclick="location.href='useredit.play?userid=${sessionScope.userid}'">
<input type="button" value="탈퇴" onclick="location.href='quit.play'">
<input type="button" value="로그아웃" onclick="location.href='logout.play'">
