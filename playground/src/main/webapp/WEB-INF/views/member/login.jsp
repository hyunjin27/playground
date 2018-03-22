<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
	<c:if test="${result eq 'ok'}">
	<c:set var="userid" value="${userid}" scope="session" />
	<c:set var="name" value="${name}" scope="session" />
	<c:redirect url = "mypage.play"/>
	</c:if>
	<c:if test="${result eq 'fail'}">
	<script>
	alert('아이디나 암호가 다릅니다.\n다시 입력해 주십시오.');
	</script>
	</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
</head>
<body>
<form id="login" name="login" method="post" action="login.play">
아이디 : <input type="text" size="12" id="userid" name="userid"  pattern=".{4,12}" required title="아이디는 4글자 이상, 12글자 미만입니다."><span id="result_id_msg"></span><br>
비밀번호 : <input type="password" size="12" id="pwd" name="pwd" required><br>
<input type="submit"><input type="reset"><input type="button" value="회원 가입" onclick="location.href='join.play'"><br>
</form>
</body>
</html>