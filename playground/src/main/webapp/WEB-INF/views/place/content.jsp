<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/openlocationcode/latest/openlocationcode.js"></script>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<div id="content_wrapper" style="display: flex;">
<div id="content_main" style="float: left; width: 50%; flex: 50%;">
<ul>
<li>상점명 : ${dto.p_name}</li>
<li>지역 : ${dto.p_area}</li>
<li>이미지 : <img src="<%=request.getContextPath() %>/resources/images/no_photo.JPG" border="0" height="80" width="76"></li>
</ul>
</div>
<div id="content_map" style="width: 50%;">
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