<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>Online Personal Training</title>
	<link rel="stylesheet" type="text/css" href="css/full-page-scroll.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link rel="icon" type="image/png" sizes="32x32" href="image/favicon-32x32.png">
	<style type="text/css">
.Menu { /*상단 메뉴바 전체부분의  div*/
	width: 100%;
    height: 80px;
    position: fixed;
    z-index: 70;
/*     border-bottom: 1px solid #e6e6e6; */
}
.topmenu li {
	list-style-type: none;
	margin: 3px;
	position: relative;
	font-size: 10px;
	top: 6px;
}
.innerMenu { /*상단 메뉴바 안에 들어가는 컨텐츠 부분의 div*/
	z-index: 70;
	width: 1200px; /*가운데정렬을 위해 고정으로 길이줌*/
	height: 80px;
	position: fixed;
	
	/* 전체 가운데 정렬, fixed일 경우는 이렇게 가운데 정렬*/
    left: 50%;
    transform: translate(-50%);
}

.menulogo{ /*로고부분 (따로뺌)*/
	float : left;
	margin-right: 25px;
}
.menulist { /*메뉴 리스트 a링크들 / 로고와 구분하려고 따로 줌 */
	float: left;
    text-decoration: none;
    font-weight: bold;
    color: #fff;
    width: 120px;
    margin-left: 27px;
    margin-right: 11px;
    font-size: 24px;
    display: block;
    text-align: center;
    text-shadow: -1px 0 #545252, 0 1px #545252, 1px 0 #545252, 0 -1px #545252;
}
	

	.section1 {
		background: url("main_image/exercise.png");
		background-size: cover;
	}

	.section2 {
		background: url("main_image/running.png");
		background-size: cover;
	}

	.section3 {
	
		background: url(main_image/veg.png);
		background-size: cover;
	}

	.section4 {
		background: url("main_image/cabbage.png"); 
		background-size: cover;
	}

	.section5 {
		background: url("main_image/sal3.png");
		background-size: cover;
	}
			
	section .section_title {
	font-family: 'Open Sans';
    font-style: normal;
    text-align: center;
    position: absolute;
    width: 100%;
    height: 100%;
    margin-top: -60px;
    /* top: 50%; */
    transform: translateY(-50%);
	}

	span {
		font-size: 5em;
		font-style: normal;
		color: #fff;
	}
	p{
	position: relative;
    font-style: normal;
    color: #fff;
    font-size: 25px;
    top: 32px;
	}
	.section_background{
   	 width: 100%;
   	 height: 100%;
   	 background-color: black;
   	 opacity: 0.2;
	}

	</style>	
</head>
<body>
	<header class="header">
		<div class="Menu">
			<div class ="innerMenu">
				<ul class="topmenu">
					<li>
						<a class = "menulogo" href="#" title="OPT 메인으로 이동">
							<img alt="main" src="image/logo2_w.png" width=120px;>
						</a> 
						<a class = "menulist" href="video.do?command=videoList&page=1&videoarea=main">OPT</a>
					</li>
					<li>
						<a class = "menulist" href="">PT받기</a>
						<a class = "menulist" href="item.do?command=itemlist&page=1">FOOD</a>
					</li>
					<li>
						<a class = "menulist" href="">고객지원</a>
					</li> 
					<li>
						<c:out value="${memdto.opt_id}"/>
					<% if(session.getAttribute("memdto") == null) { %>
							<a class="menulist" href="login.jsp?Flag=0">로그인</a>
					<% } else {%>
							<a class="menulist" href="login.do?command=logout">로그아웃</a>
					<% } %>
					<a class="menulist" href="opt.do?command=mypage">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	
	<div id="main" class="scroll-container">
		<section class="section1">
			<div class="section_background"></div>
			<div class="section_title">
				<span>어디서나 함께하는</span>
				<p>
					<strong>운동 친구</strong>
				</p>					
			</div>
		</section>
		<section class="section2">
			<div class="section_background"></div>
			<div class="section_title">
				<span>미쳐라</span>
				<p>
					<strong>It`s only crazy until you do it</strong>
				</p>				
			</div>
		</section>
		<section class="section3">
			<div class="section_background"></div>
			<div class="section_title">
				<span>철저한</span>
				<p>
					<strong>식단 관리</strong>
				</p>					
			</div>
		</section>
		<section class="section4">
			<div class="section_background"></div>
			<div class="section_title">
				<span>맛있게 드세요</span>
				<p>
					<strong>저희가 준비한 걸로</strong>
				</p>					
			</div>
		</section>
		<section class="section5">
			<div class="section_background"></div>
			<div class="section_title">
				<span>OPT가</span>
				<p>
					<strong>여러분의 건강을 책임집니다.</strong>
				</p>				
			</div>
		</section>
	</div>
	<script src="js/full-page-scroll.js"></script>
	<script type="text/javascript">
		new fullScroll({
			displayDots: true,
			dotsPosition: 'left',
			animateTime: 0.7,
			animateFunction: 'ease'
		});
	</script>

</body>
</html>