<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%--AIzaSyAvT5BQVpORuQR-AHY9bpZcnxZzpnkH9G0&region=KR--%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/openlocationcode/latest/openlocationcode.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript">
function setParentText(){
    opener.document.getElementById("code").value = document.getElementById("pluscode").value;
    window.close();
}
function getCode(lat, lng){
    var code = OpenLocationCode.encode(lat, lng, OpenLocationCode.CODE_PRECISION_EXTRA);
    return code;
}
</script>
<title>주소 찾기</title>
</head>
<body>
<div style="margin: 0 auto;">CLICK ON THE MAP to CHOOSE a PLACE</div>
<div id="googleMap" style="width:100%;height:400px;"></div>

<script>
function myMap() {
	
var mapProp= {
    center:new google.maps.LatLng(37.555744, 126.970431),
    zoom:15,
};
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
if (navigator.geolocation) {
    // Use method getCurrentPosition to get coordinates
    navigator.geolocation.getCurrentPosition(function (position) {
        // Access them accordingly
    	var lat = position.coords.latitude;
    	var lng = position.coords.longitude;
    	map.setCenter(new google.maps.LatLng(lat, lng));
    });
}
google.maps.event.addListener(map, 'click', function(event) {
var geocoder = new google.maps.Geocoder();
document.getElementById("pluscode").value = getCode(event.latLng.lat(), event.latLng.lng());
geocoder.geocode({
    'latLng': event.latLng
  }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[0]) {
    	  document.getElementById("address").value = results[0].formatted_address;
      }
    }
  });
});

}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvT5BQVpORuQR-AHY9bpZcnxZzpnkH9G0&callback=myMap"></script>
<ul>
<li>코드 : <input class="field" size="18" id="pluscode" readonly="readonly"></li>
<li>주소 : <input class="field" size="50" id="address" readonly="readonly"></li>
<li><input type="button" value="input" onclick="setParentText()"></li>
<li><input type="button" value="창닫기" onclick="window.close()"></li> 
</ul>
</body>
</html>