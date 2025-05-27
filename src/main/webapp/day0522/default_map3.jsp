<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../common/site_config.jsp" %>     --%>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0522/map_marker.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 
</style>







<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=042002ddcd780d12879f52794d673109"></script>
<script>
var map ;
$(function(){
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.499317, 127.0332123), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
map = new kakao.maps.Map(mapContainer, mapOption);

setMaker(37.499317, 127.0332123);
//마커 표현
// marker.setMap(null);    

}); //ready

function setCenter(lat, lng) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat , lng);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function setMaker( lat, lng ){
	setCenter(lat, lng);//지도의 위치를 가운데로 이동
	// 마커가 표시될 위치입니다 
	// 위도(latitude) : 37.499317
	// 경도(longitude) : 127.0332123
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	//인포윈도우 띄우기
	var iwContent = `<div style="padding:5px;">안녕하세요.! 
	<br>
	<a href="#void" style="color:blue" target="_blank">인사메시지보기</a></div>`,
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
	
	
} 


</script>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		//37.498189!4d127.0315992
		
		setMaker(37.498189, 127.0315992);
	});
});//ready


</script>





</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">subTitle</span></div><hr>
<div id="container">

	<div id="map" style="width:1200px;height:600px;"></div>
	<input type="button" value="제쥬은희네 강남점" class="btn btn-danger" id="btn"/>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>