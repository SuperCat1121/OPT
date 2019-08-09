<%@page import="com.opt.biz.OPTBizImpl"%>
<%@page import="com.opt.biz.OPTBiz"%>
<%@page import="com.opt.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
</head>
<body>
	<!-- 관리자로 로그인 해야만 접근 가능 -->
	<c:if test="${memdto.opt_role ne 'admin'}">
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			document.location.href = "index.jsp";
		</script>
	</c:if>
	<a href="index.jsp">메인</a>
	<h1>관리자</h1>
	<hr style="margin-bottom: 0px;">
	<div class="nav">
		<table border="1">
			<tr>
				<th>INDEX</th>
			</tr>
			<tr>
				<td> <a href="#" class="adminUserManager">유저관리</a> </td>
			</tr>
			<tr>
				<td> <a href="#" class="adminItemManager">상품관리</a> </td>
			</tr>
			<tr>
				<td> <a href="#">내 정보</a> </td>
			</tr>
		</table>
	</div>
	<div class="layer" style="display: none;"></div>
	<div class="content_area">
		<div class="first" style="margin-left: 65px;">
			<p>판매진행현황</p>
			<hr>
			<svg style="width: 120px; height: 120px; margin-left: -15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">배송중</text>
				<text x="40" y="85">9건</text>
			</svg>
			<svg style="width: 120px; height: 120px; margin-left: 15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">주문신청</text>
				<text x="40" y="85">14건</text>
			</svg>
			<svg style="width: 120px; height: 120px; margin-left: 15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">환불요청</text>
				<text x="40" y="85">3건</text>
			</svg>
		</div>
		<svg style="width: 3px; height: 150px; margin-left: 70px;">
				<line x1="2" y1="0" x2="2" y2="150" style="stroke:#ccc; stroke-width:3;">
		</svg>
		<div class="first" style="position: relative; left: 70px;">
			<p>판매실적/판매현황</p>
			<hr>
			<svg style="width: 120px; height: 120px; margin-left: -15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">배송중</text>
				<text x="40" y="85">9건</text>
			</svg>
			<svg style="width: 120px; height: 120px; margin-left: 15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">주문신청</text>
				<text x="40" y="85">14건</text>
			</svg>
			<svg style="width: 120px; height: 120px; margin-left: 15px;">
				<circle cx="60" cy="60" r="60" fill="#ccc" />
				<text x="40" y="60">환불요청</text>
				<text x="40" y="85">3건</text>
			</svg>
		</div>
		<div class="graph">
			<p>판매차트<p>
			<hr>
			<script src="http://d3js.org/d3.v3.min.js"></script>
			<script type="text/javascript">
				window.onload = function() {
					var monthData = [${beforeTwoMonth}, ${beforeOneMonth}, ${thisMonth}];
					var dayData = [${beforeTwoDay}, ${beforeOneDay}, ${today}];
					var day = d3.select("#day").selectAll();
					var month = d3.select("#month").selectAll();
					// 사각형 그래프 그리기 (2달전,1달전,이번달)
					month.data(monthData).enter()
					.append("rect")
					.attr("height", function(d) {
						return d*10+"px";
					})
					.attr("width", function(d) {
						return "30px";
					})
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d, i) {
						return 100-d*10;
					})
					.attr("class", "bar");
					// 그래프 데이터 출력
					month.data(monthData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35+9;
					})
					.attr("y", function(d) {
						return 90;
					})
					.style("font-size", "12pt")
					.text(function(d){
						return d;
					});
					// 그래프 레이블 출력
					month.data(monthData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d) {
						return 120;
					})
					.style("font-size", "8pt")
					.text(function(d, i) {
						return ["2달전", "1달전", "이번달"][i];
					});
					// 사각형 그래프 그리기 (2일전,1일전,오늘)
					day.data(dayData).enter()
					.append("rect")
					.attr("height",function(d) {
						return d*10+"px";
					})
					.attr("width", function(d) {
						return "30px";
					})
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d, i) {
						return 100-d*10;
					})
					.attr("class", "bar");
					// 그래프 데이터 출력
					day.data(dayData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35+9;
					})
					.attr("y", function(d) {
						return 90;
					})
					.style("font-size", "12pt")
					.text(function(d){
						return d;
					});
					// 그래프 레이블 출력
					day.data(dayData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d) {
						return 120;
					})
					.style("font-size", "8pt")
					.text(function(d, i){
						return ["2일전", "1일전", "오늘"][i];
					});
				}
				</script>
				<svg id="day" style="width:110; height:125; margin-right: 130px; margin-left: 160px;"></svg>
				<svg id="month" style="width:110; height:125;"></svg>
		</div>
		<div class="adminUserManagerPopup" style="display: none;"></div>
		<div class="adminItemManagerPopup" style="display: none;"></div>
	</div>
	<div id="itemCountWarning" style="display: none;">재고가 5개 이하인 상품들의 개수입니다</div>
</body>
</html>