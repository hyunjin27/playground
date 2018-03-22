<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 관리</title>
</head>
<body>
<c:if test="${flag eq 'edit'}">
<h3>정보 변경하기</h3>
<form name="myform" action="useredit.play" method="post">
<ul>
<li>아이디 : ${dto.userid}</li>
<li>암호 : <input type="button" value="password change" onclick="location.href='pwdchg.play'"></li>
<li>이름 : <input type="text" size="20" name="name" value="${dto.name}" required="required"></li>
<li>이메일 : <input type="email" size="30" name="email" value="${dto.email}" required></li>
<li>생년월일 :  <input type="date" name="birth" value="${dto.birth}"></li>
</ul>
<input type="submit"><input type="reset">
</form>
</c:if>
<c:if test="${flag eq 'pwd'}">
<%-- 암호변경 --%>
<form name="myform" action="pwdchg.play" method="post">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/script/join.js"></script>
<h3>암호 변경하기</h3>
<ul>
<li>이전 암호 : <input type="text" name="oldpwd" id="oldpwd" size="12" required></li>
<li>새로운 암호 : <input type="text" name="pwd" id="pwd" size="12" required></li>
<li>암호 확인 : <input type="text" id="pwd2" size="12" oninput="check(this)" required></li>
</ul>
<input type="hidden" name="userid" value="${sessionScope.userid}">
<input type="submit"><input type="button" value="취소" onclick="history.back()">
</form>
</c:if>
<c:if test="${flag eq 'quit'}">
<%-- 탈퇴 --%>
<form name="myform" action="quit.play" method="post">
<h3>회원 탈퇴 하시겠습니까?</h3>
<input type="hidden" name="userid" value="${sessionScope.name}">
<input type="submit"><input type="button" value="취소" onclick="history.back()">
</form>
</c:if>
</body>
</html>