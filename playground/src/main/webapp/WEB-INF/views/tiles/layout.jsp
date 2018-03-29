<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/layout.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8"> <!-- 문자셋 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Pen+Script" rel="stylesheet"><!-- 폰트 -->
<title>Welcome, this is playground</title>
</head>
<body>
	<div id="header" class="layout_bar" style="margin-top: 25px;">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	<div class="se_line"></div>
	<div id="content" class="layout_bar">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
	<div class="se_line"></div>
	<div id="footer" class="layout_bar">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>