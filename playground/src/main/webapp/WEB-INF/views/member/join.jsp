<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="joindo.play" method="post" id="joinform">
아이디 : <input type="text" size="12" id="userid" name="userid"  pattern=".{4,12}" required title="아이디는 4글자 이상, 12글자 미만입니다."><span id="result_id_msg"></span><br>
비밀번호 : <input type="password" size="12" id="pwd" name="pwd" required><br>
비번확인 : <input type="password" size="12" id="pwd2" oninput="check(this)" required><br>
이름 : <input type="text" size="20" name="name" required="required"><br>
이메일 : <input type="email" size="30" name="email" required><br>
생년월일 :  <input type="date" name="birth"><br>
<input type="submit"><input type="reset"><br>
</form>
