<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table border=0 style="width:100%; min-width:700px; border-collapse: collapse;">
	<tr>
	
	<td align="left">
	 <a href="/tilesboard/list.do" style="text-decoration: none;">
	   홈으로
	 </a>
	</td>
	
  <td align="right">
   <a href="/tilesboard/list.do">게시판</a>&nbsp;&nbsp;
   <% if(session.getAttribute("userid")==null ||session.getAttribute("userid")==""){
	   
	   out.println("<a href=\"/tilesboard/insertForm.do\">회원가입</a>&nbsp;&nbsp;");
   	   out.println("<a href=\"/tilesboard/login.do\">로그인</a>&nbsp;&nbsp;");
   }
   	   else{
   		out.println("<a href=\"/tilesboard/editForm.do\">회원수정</a>&nbsp;&nbsp;");
    	out.println("<a href=\"/tilesboard/logOut.do\">로그아웃</a>&nbsp;&nbsp;");
   	   }
   	%>
   	
  </td>
	
  </tr>

</table>