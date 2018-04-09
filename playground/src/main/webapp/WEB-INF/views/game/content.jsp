<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.12';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<div id="content_wrapper" style="display: flex;">
<div id="content_main" style="float: left; width: 30%; flex: 50%;">
<c:choose>
    <c:when test="${dto.g_photo eq ''}">
    	<c:set var="photo_url" value="${pageContext.request.contextPath}/resources/images/no_photo.JPG" />
    </c:when>
    <c:when test="${dto.g_photo eq null}">
    	<c:set var="photo_url" value="${pageContext.request.contextPath}/resources/images/no_photo.JPG" />
    </c:when>
    <c:otherwise>
        <c:set var="photo_url" value="${dto.g_photo}" />
    </c:otherwise>
</c:choose>    
<a href="${photo_url}" target="_blank"><img src="${photo_url}" border="0" style="border-style: inset; border-color: black; border-width: 3px; margin-left:5%; max-width: 25%; height: auto;"></a>
<ul>
<li>게임명 : ${dto.g_name}</li>
<li>장르 : ${dto.g_genre} (${genre_name})</li>
<li>제조사 : ${dto.g_company}</li>
<li>발매일 : ${dto.g_release}</li>
<li>상세 설명<BR><% pageContext.setAttribute("newLineChar", "\n"); %>${fn:replace(dto.g_detail, newLineChar, "<br/>")}
</li>
<li><input type="button" value="go back" onclick="history.back()"></li>
</ul>
	<div style="display:block; height: 50px;" class="fb-like"
		data-href="${pageContext.request.requestURL}"
		data-layout="button" data-action="like" data-size="small"
		data-show-faces="true" data-share="true">
	</div>
<c:if test="${not empty list}">
<h3 style="font-family: 'Nanum Pen Script', cursive;">해당 게임 보유 영업장 목록</h3>
<textarea rows="5" cols="40" readonly="readonly" style="font-size: 12px; overflow-y: scroll; border: 2px solid red; border-radius: 4px;">
<c:forEach var="item" items="${list}">
- [${item.p_area}] ${item.p_name} / ${item.gnp_price} 원 @ ${item.gnp_credit} 플레이
</c:forEach>
</textarea>
</c:if>
</div>
</div>