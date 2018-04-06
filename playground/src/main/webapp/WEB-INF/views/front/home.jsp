<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/home.css"/>
<h1 style="text-align: center;">Welcome to PlayGround<BR>
<a href="here.play" class="btn-gradient green block">SHOW PLACES AROUND HERE!</a></h1>
 <div class="recent_row">
  <div class="recent">
  <h1>new places</h1>
  <table>
  <tr>
  <th>이름</th><th>장소</th><th>지역</th>
  </tr>
  <c:forEach var="place" items="${place}">
  <tr>
  <td><a href="place_view.play?p_no=${place.p_no}">${place.p_name}</a></td><td><a href="https://plus.codes/${place.p_addr}" target="_blank">${place.p_addr}</a></td><td>${place.p_area}</td>
  </tr>
  </c:forEach>
  </table>
  </div>
  <div class="recent">
  <h1>new games</h1>
  <table>
  <tr>
  <th>이름</th><th>장르</th><th>제조사</th>
  </tr>
  <c:forEach var="game" items="${game}">
  <tr>
  <td><a href="game_view.play?g_no=${game.g_no}">${game.g_name}</a></td><td>${game.g_genre}</td><td>${game.g_company}</td>
  </tr>
  </c:forEach>
  </table>
  </div>
</div> 