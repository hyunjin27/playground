<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${result eq 'ok'}">
	<c:set var="userid" value="${userid}" scope="session" />
	<c:set var="name" value="${name}" scope="session" />
	<script>
	location.href='mypage.play';
	</script>
	</c:if>
	<c:if test="${result eq 'fail'}">
	<script>
	alert('아이디나 암호가 다릅니다.\n다시 입력해 주십시오.');
	</script>
	</c:if>

<c:if test="${not empty sessionScope.userid }">
	<script>
	location.href='mypage.play';
	</script>
</c:if>
<h1>LOGIN to PlayGround</h1>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/form.css"/>
<form id="login" name="login" method="post" action="login.play">
<ul class="form">
<li>아이디 : <input type="text" size="12" id="userid" name="userid"  pattern=".{4,12}" required title="아이디는 4글자 이상, 12글자 미만입니다."><span id="result_id_msg"></span></li>
<li>비밀번호 : <input type="password" size="12" id="pwd" name="pwd" required></li>
<li><input type="submit" class="btn-gradient red small"><input type="reset" class="btn-gradient blue small"><input type="button" class="btn-gradient green small" value="회원 가입" onclick="location.href='join.play'"></li>
</ul>
</form>
