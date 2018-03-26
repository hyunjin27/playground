<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/openlocationcode/latest/openlocationcode.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/qunit@2.5.1/qunit/qunit.min.js"></script>
<script type="text/javascript">
var placeSearch, autocomplete;
function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete = new google.maps.places.Autocomplete(
                                      (document.getElementById('autocomplete')),{types: ['geocode']});
  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', fillInAddress);
}
function fillInAddress() {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();
    document.getElementById("lat").value=place.geometry.location.lat();
    document.getElementById("lng").value=place.geometry.location.lng();
    var code = OpenLocationCode.encode(place.geometry.location.lat(), place.geometry.location.lng(), OpenLocationCode.CODE_PRECISION_EXTRA);
    document.getElementById("pluscode").value=code;
}
function setParentText(){
    opener.document.getElementById("code").value = document.getElementById("pluscode").value;
    window.close();
}
</script>

<title>주소 찾기</title>
</head>
<body>
<div id="locationField">
  <input id="autocomplete" placeholder="Enter your address" type="text">
</div>
 
<input class="field" id="lat" />
<input class="field" id="lng" />
<div><input id="pluscode" class="field"><br>
<input type="button" value="input" onclick="setParentText()">
<input type="button" value="창닫기" onclick="window.close()">
</div>
<!-- Replace the value of the key parameter with your own API key. -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvT5BQVpORuQR-AHY9bpZcnxZzpnkH9G0&libraries=places&callback=initAutocomplete" async defer></script>
</body>
</html>