<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center><h3>CONTENT</h3></center>
	<table border="1" width="700" align="center">
		<tr>
			<td align="right" colspan="6">
				<a href="gameedit.play?num=${gameDto.num}&pageNum=${pageNum}">수정</a>
				<a href="gamedelete.do?num=${gameDto.num}&pageNum=${pageNum}">삭제</a>
				<a href="insertForm.do?num=${gameDto.num}&pageNum=${pageNum}&ref=${gameDto.ref}&re_step=${gameDto.re_step}&re_level=${gameDto.re_level}">답글</a>
				<a href="gamelist.do?pageNum=${pageNum}">목록</a>
			</td>
		</tr>
		
		<tr height="40px" align="center">
			<td width="100">NO</td>
			<td width="100">${gameDto.num}</td>
			
	
			
			<td width="100">조회수</td>
			<td width="50">${gameDto.readcount}</td>
		</tr>
		
		<tr height="40px" align="center">
			<td width="100">게임이름</td>
			<td width="100">${gameDto.gamename}</td>
		
			<td width="100">게임장르</td>
			<td colspan="3">${gameDto.gamegene}</td>
		</tr>
		
		<tr height="300px" align="center">
			<td>내용</td>
			<td colspan="5"><pre>${gameDto.gamedetail}</pre></td>
		</tr>
	</table>
</body>
</html>