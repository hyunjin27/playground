<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/script/join.js"></script>
<h1>JOIN to PlayGround</h1>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/form.css"/>
<form action="joindo.play" method="post" id="joinform">
<ul class="form">
<li>아이디 : <input type="text" size="12" id="userid" name="userid"  pattern=".{4,12}" required title="아이디는 4글자 이상, 12글자 미만입니다."><span id="result_id_msg"></span></li>
<li>비밀번호 : <input type="password" size="12" id="pwd" name="pwd" required></li>
<li>비번확인 : <input type="password" size="12" id="pwd2" oninput="check(this)" required></li>
<li>이름 : <input type="text" size="20" name="name" required="required"></li>
<li>이메일 : <input type="email" size="30" name="email" required></li>
<li>생년월일 : <input type="date" name="birth"></li>
</ul>
<input type="submit" class="btn-gradient red small"><input type="reset" class="btn-gradient blue small"><br>
</form>
