<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>
<c:import url="${ url }/common/jsp/external_file.jsp" />
<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=042002ddcd780d12879f52794d673109"></script>

<script type="text/javascript">
var map;
$(function() {
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.499317, 127.0332123), // 지도의 중심의 좌표
		level : 3
	};

	map = new kakao.maps.Map(container, options);
	
	setMarker(37.499317, 127.0332123);
});//ready

function setCenter(lat, lng) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function setMarker(lat, lng) {
	setCenter(lat, lng); // 지도의 위치를 가운데로 이동
	// 마커 표현
	// 마커가 표시될 위치입니다 
	// 위도 : 37.499317
	// 경도 : 127.0332123
	var markerPosition = new kakao.maps.LatLng(lat, lng);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);


// 인포윈도우 띄우기
var iwContent = `<div style="padding:5px;">안냥
<br>
<a href="#void" style="color:blue" target="_blank">인사메시지보기</a></div>`; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다.
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker);

}
$(function() {
	$("#btn").click(function() {
		setMarker(37.4981894, 127.0315992);
	});
});

</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="${ url }/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">

			<div id="map" style="width: 600px; height: 400px;"></div>

			<input type="button" value="제주은희네 강남점" class="btn btn-info" id="btn" />

		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="${ url }/common/jsp/footer.jsp" />
	</footer>


</body>
</html>