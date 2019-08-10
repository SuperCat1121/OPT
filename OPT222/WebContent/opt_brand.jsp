<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<h3>Online Personal Trainning</h3>
		
		

	<div id="map" style="width:500px; height: 400px;"></div>
	<p>
		<button onclick="setCenter()">지도 중심 좌표 이동시키기</button>
		<button onclick="panTo()">지도 중심 좌표 부드럽게 이동시키기</button>
	
		<button onclick="zoomIn()">지도레벨 -1</button>
		<button onclick="zoomOut()">지도레벨 +1</button>
		<span id="maplevel"></span> 
	</p>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=166c35471279ee679a666dea66875cae"></script>
<script type="text/javascript">

	var container = document.getElementById("map");  //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.498981, 127.032908),//지도의 중심좌표(위도 , 경도순),!반드시 필요
			level:1 //지도의 레벨 확대 축소
			 
	};
	
	var map = new kakao.maps.Map(container,options); //지도 생성및 객체 리턴
	
	function setCenter(){
		//이동할 위도 경도 위치 생성
		var moveLatLon = new kakao.maps.LatLng(33.452613,126.570888);
		
		//지도 중심 이동
		map.setCenter(moveLatLon);
		
	}
	function panTo() {
		//이동할 위도 경도 위치 생성
		var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
		
		//지도 중심을 부드럽게 이동
		//만약 이동할 거리가 지도화면보다 크면 부드러운 효과없이 이동
		map.panTo(moveLatLon);
		
	}
	function zoomIn(){
		//현재 지도의 레벨을 얻어옴
		var level = map.getLevel();
		
		//지도를 1레벨 내림(지도가 확대됨)
		map.setLevel(level -3);
		
		//지도 레벨 표시
		displayLevel();
	}
	
	function zoomOut(){
		//현재 지도의 레벨을 얻어옴
		var level = map.getLevel();
		
		//지도를 1레벨 올림(지도가 축소됨)
		map.setLevel(level + 1);
		
		//지도 레벨 표시
		displayLevel();
	}
	
	function displayLevel(){
		var levelEl = document.getElementById("maplevel");
		levelEl.innerHTML = "현재 지도 레벨은" + map.getLevel() + "레벨입니다";
	}
	
</script>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
		
</body>
</html>