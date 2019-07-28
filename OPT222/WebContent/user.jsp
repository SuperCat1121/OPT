<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div class="page_title">
		<h2>마이페이지</h2>
	</div>
	
	<div class="mypage_content">
		<div class="mypage_welcome">
		<div class="welcom_box">
		<dl class="welcom_hello">
		<dt class="welcom_name">
		안녕하세요 <span>${memdto.opt_name }</span>&nbsp;님 환영합니다
		</dt>
		
		<dd>
		<p></p>
			<a href="" class="link">개인정보 수정</a>
			<a href="" class="link">일정관리</a>
		</dd>	
		</dl>
		<div class="coupon_box">
		<dl class="coupon" style="cursor: pointer;" onclick="">
			<dt>쿠폰</dt>
			<dd><b class="num">1</b> 장</dd>
		</dl>
		<dl class="opt_point" style="cursor: pointer;" onclick="">
			<dt>포인트</dt>
			<dd><b class="num">${memdto.opt_point }</b> 포인트</dd>
		</dl>
		</div>
		</div>
		</div>
	</div>
</body>
</html>