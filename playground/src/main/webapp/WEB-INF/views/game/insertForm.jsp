<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>INSERT PAGE</title>
</head>
<body>
<h2>��ǰ ���</h2>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="1">
        <tr>
            <td>�����̸�</td>
            <td><input type="text" name="gamename" id="gamename"></td>
        </tr>
        <tr>
            <td>�����帣</td>
            <td><input type="text" name="gamegene" id="gamegene"></td>
        </tr>
        <tr>
            <td>���Ӻ�Ī</td>
            <td><input type="text" name="gamenick" id="gamenick"></td>
        </tr>
        <tr>
            <td>���ӳ���</td>
            <td><input type="text" name="gamedetail" id="gamedetail"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="���" id="addBtn">
                <input type="button" value="���" id="listBtn">
            </td>
        </tr>
    </table>
</form>
</body>
</html>