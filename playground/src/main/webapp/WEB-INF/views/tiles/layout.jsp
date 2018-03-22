<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout</title>
</head>
<body>
<table border=1 style="width: 100%; min-width: 700px; border-collapse: collapse;">
<tr>
<td colspan="2" height="60" bgcolor="cyan">
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
</td>
</tr>
<tr height="500">
<td width="150">
TEST
</td>
<td>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
</td>
</tr>
<tr>
<td colspan="2" height="60" bgcolor="cyan">
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</td>
</tr>
</table>
</body>
</html>