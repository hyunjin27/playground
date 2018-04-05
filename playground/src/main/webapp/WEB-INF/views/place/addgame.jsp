<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userid}">
	<script>
	alert('로그인 후 접근바랍니다.');
	location.href='login.play';
	</script>
</c:if>
<c:if test="${not empty sessionScope.userid}">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
function add(g_no){
	document.myform.g_no.value = g_no;
}
    $(document).ready(function() {
        $('#place').DataTable( {
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Korean.json"
            },
            "order": [[ 0, 'desc']]
        } );
    } );
</script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<table id="place" class="display" cellspacing="0" width="100%">
<thead>
<tr>
<td>번호</td><td>이름</td><td>장르</td><td>제조사</td><td>발매일</td><td>사진</td><td>설명</td><td>추가</td>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td>${item.g_no}</td><td><a href="game_view.play?g_no=${item.g_no}">${item.g_name}</a></td><td>${item.g_genre}</td><td>${item.g_company}</td>
<td><fmt:formatDate value="${item.g_release}" pattern="yy-MM-dd kk:mm"/></td>
<td><a href="${item.g_photo}" target="_blank">사진</a></td>
<c:choose>
<c:when test="${fn:length(item.g_detail) > 10}">
<td><c:out value="${fn:substring(item.g_detail,0,9)}"/>...</td>
</c:when>
<c:otherwise>
<td><c:out value="${item.g_detail}"/></td>
</c:otherwise>
</c:choose> 
<td><input type="button" value="select" onclick="add('${item.g_no}')"></td>
</tr>
</c:forEach>
</tbody>
</table>
<form name="myform" method="post" action="add_game2pos.play">
<input type="hidden" name="p_no" value="${p_no}">
<ul>
<li>게임 : <input type="text" id="g_no" name="g_no" size="5" required="required" readonly="readonly"></li>
<li>가격 : <input type="text" name="gnp_price" size="8" required="required">원</li>
<li>크레딧 : <input type="text" name="gnp_credit" size="8" required="required">회</li>
<li>설명 : <textarea name="gnp_detail" cols="20" rows="5"></textarea></li>
<li><input type="submit"></li>
</ul>
</form>
</c:if>