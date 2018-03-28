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
function del(p_no){
	var inputString = confirm('항목을 삭제하시겠습니까?\n삭제후에는 돌이킬 수 없습니다.');
	
		if (inputString==false){
			return false;
		}else{
			document.myform.p_no.value = p_no;
			document.myform.action = "place_del.play";
			document.myform.submit();
		}
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
<form name="myform" method="post">
<input type="hidden" name="p_no">
</form>
<table id="place" class="display" cellspacing="0" width="100%">
<thead>
<tr>
<td>번호</td><td>이름</td><td>코드</td><td>지역</td><td>설명</td><td>등록일</td><td>등록자</td><td>수정</td><td>삭제</td>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td>${item.p_no}</td><td>${item.p_name}</td><td><a href="https://plus.codes/${item.p_addr}" target="_blank">${item.p_addr}</a></td><td>${item.p_area}</td>
<c:choose>
<c:when test="${fn:length(item.p_detail) > 10}">
<td><c:out value="${fn:substring(item.p_detail,0,9)}"/>...</td>
</c:when>
<c:otherwise>
<td><c:out value="${item.p_detail}"/></td>
</c:otherwise>
</c:choose> 
<td><fmt:formatDate value="${item.regdate}" pattern="yy-MM-dd kk:mm"/></td><td>${item.reguser}</td><td><a href="place_mod.play?p_no=${item.p_no}">수정</a></td><td><a href="#" onclick="del('${item.p_no}')">삭제</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>