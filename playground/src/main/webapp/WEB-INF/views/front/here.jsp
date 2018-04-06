<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/openlocationcode/latest/openlocationcode.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvT5BQVpORuQR-AHY9bpZcnxZzpnkH9G0"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/home.css"/>
<h1 style="text-align: center;">Here You Are!</h1>
<div class="recent_row">
<div class="recent" id="map" style="width: 100%; height: 400px;">
</div>
<div class="recent" id="area" style="width: 100%; height: 100px; margin-top: 1.2em; border-top: 1px dotted black;">
현재지역 : 전체<BR>
지역별 찾기<BR>
(개발중...)<BR>
</div>
</div>

<script type="text/javascript">
    var locations = [
   	<c:forEach var="item" items="${place}">['<a href="place_view.play?p_no=${item.p_no}">${item.p_name}</a>', ${item.lat}, ${item.lng}, ${item.num}],
   	</c:forEach>
   	[]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    
    if (navigator.geolocation) {
        // Use method getCurrentPosition to get coordinates
        navigator.geolocation.getCurrentPosition(function (position) {
            // Access them accordingly
        	var lat = position.coords.latitude;
        	var lng = position.coords.longitude;
        	map.setCenter(new google.maps.LatLng(lat, lng));
        });
    }

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) { 
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
</script>