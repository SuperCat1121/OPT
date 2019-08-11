<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 참고사이트 ssgblog.com/5 -->
 <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    .footer_wrap_area{
    	position: relative;
    	top: 50px;
    }
</style>
<link href="css/opt_brand.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content_wrap">
	<div class="opt_title">
		<h2>Online Personal Trainning</h2>
	</div>	

	<div id="map" style="width:600px;height:350px;"></div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=166c35471279ee679a666dea66875cae&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.498980, 127.032865), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
 map: map, 
 position: new kakao.maps.LatLng(37.498980, 127.032865)
});

//커스텀 오버레이에 표시할 컨텐츠 입니다
//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
//별도의 이벤트 메소드를 제공하지 않습니다 
var content = '<div class="wrap">' + 
         '    <div class="info">' + 
         '        <div class="title">' + 
         '            OPT' + 
         '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
         '        </div>' + 
         '        <div class="body">' + 
         '            <div class="img">' +
         '                <img src="main_image/logo2.png" width="72" height="72">' +
         '           </div>' + 
         '            <div class="desc">' + 
         '                <div class="ellipsis">서울특별시 강남구 역삼동</div>' + 
         '                <div class="jibun ellipsis">강남구 테헤란로 14길 6</div>' + 
         '                <div><a href="index.jsp" target="_blank" class="link">홈페이지</a></div>' + 
         '            </div>' + 
         '        </div>' + 
         '    </div>' +    
         '</div>';

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
 content: content,
 map: map,
 position: marker.getPosition()       
});

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
 overlay.setMap(map);
});

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
 overlay.setMap(null);     
}
</script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script> -->
		
		<div class="footer_wrap_area">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
		
</body>
</html>