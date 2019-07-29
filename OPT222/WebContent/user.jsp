<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int pay_count = Integer.parseInt(request.getParameter("pay_count"));
	int coupon_count = Integer.parseInt(request.getParameter("coupon_count"));
%>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<script type="text/javascript">
function openNav() {
	document.getElementById('mysidenav').style.width = '250px';
}
function closeNav() {
	document.getElementById('mysidenav').style.width = '0';
}


</script>
</head>
<body>
	
	<div class="page_title">
		<h2>마이페이지</h2>
	</div>
	
	<div id="mysidenav" class="sidenav">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="#">운송장번호 조회</a>
		<a href="#">마이쪽지함</a>
		<a href="#">장바구니</a>
		<a href="#">일정관리</a>
		<a href="#">장바구니</a>
		<a href="#">내쿠폰함</a>
		<a href="#">고객센터</a>
	</div>
	<div class="openmenu_btn">
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> 마이 메뉴</span>
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
			<dd><b class="num"><%=coupon_count %></b> 장</dd>
		</dl>
		<dl class="opt_point" style="cursor: pointer;" onclick="">
			<dt>포인트</dt>
			<dd><b class="num">${memdto.opt_point }</b> 포인트</dd>
		</dl>
		<dl class="opt_pay" style="cursor: pointer;" onclick="">
			<dt>결제</dt>
			<dd><b class="num"><%=pay_count %></b> 결제건수</dd>
		</dl>
		</div>
		</div>
		
		</div>
		<div class="order_list_title">
			<h2>주문 내역</h2>
		</div>
		<div class="order_list">
			<table summary="번호 주문일자 상품명 결제금액">
				<colgroup>
					<col width="70">
					<col width="100">
					<col width="*">
					<col width="100">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="th_title">번호</div>
						</th>
						<th>
							<div class="th_title">주문일자</div>
						</th>
						<th>
							<div class="th_title">상품명</div>
						</th>
						<th>
							<div class="th_title">결제금액</div>
						</th>
					</tr>
				</thead>
				<tbody>
		<c:choose>
		<c:when test="${empty orderdto }">
			<tr>
				<td colspan="3">----------------내용이없습니다-------</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${orderdto }" var="dto">
					<tr>
						<td>${dto.r }</td>
						<td>${dto.pay_date }</td>					
						<td>${dto.name }</td>
						<td>${dto.pay_all }</td>
					</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
		</tbody>	
			</table>
		</div>
	</div>
</body>
</html>