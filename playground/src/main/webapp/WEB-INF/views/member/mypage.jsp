<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>MYPAGE</h1>
<h1>welcome home, ${sessionScope.name}</h1>
<input type="button" class="btn-gradient cyan small" value="정보수정" onclick="location.href='useredit.play?userid=${sessionScope.userid}'">
<input type="button" class="btn-gradient red small" value="탈퇴" onclick="location.href='quit.play'">
<input type="button" class="btn-gradient purple small" value="로그아웃" onclick="location.href='logout.play'">
