<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/openlocationcode/latest/openlocationcode.js"></script>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<div id="content_wrapper" style="display: flex;">
<div id="content_main" style="float: left; width: 30%; flex: 50%;">
<a href="<%=request.getContextPath() %>/resources/images/no_photo.JPG" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/no_photo.JPG" border="0" style="border-style: inset; border-color: black; border-width: 3px; margin-left:15%; max-width: 35%; height: auto;"></a>
<ul>
<li>상점명 : ${dto.p_name}</li>
<li>지역 : ${dto.p_area}</li>
<li>상세 설명<BR><% pageContext.setAttribute("newLineChar", "\n"); %>${fn:replace(dto.p_detail, newLineChar, "<br/>")}
</li>
</ul>
</div>
<div id="content_map" style="width: 70%;">
<ul>
<li>CODE : ${dto.p_addr}</li>
<li>ADDRESS : <span id="address"></span></li>
</ul>
<div id="map" style="width:100%; height:300px;">Position to map</div>
</div>
</div>

<script>
function myMap() {
	var area = OpenLocationCode.decode('${dto.p_addr}');
	var place = {lat: area.latitudeCenter, lng: area.longitudeCenter};
    var mapCanvas = document.getElementById("map");
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: place
      });
    var marker = new google.maps.Marker({
        position: place,
        map: map
      });
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'latLng': place
      }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[0]) {
        	  $("#address").html(results[0].formatted_address);
          }
        }
      });
} 
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvT5BQVpORuQR-AHY9bpZcnxZzpnkH9G0&callback=myMap"></script>