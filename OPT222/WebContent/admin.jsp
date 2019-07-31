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
<script type="text/javascript">
	$(function() {
		$("span").hover(function() {
			$("#itemCountWarning").toggle();
		},function() {
			$("#itemCountWarning").toggle();
		});
	});
	
</script>
</head>
<body>
	<!--
	<c:if test="${memdto.opt_role ne 'admin'}">
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		document.location.href = "index.jsp";
		</script>
	</c:if>
	-->
	<h1>admin님 환영합니다</h1>
	
	<hr>
	
	<div class="nav">
		<table border="1">
			<tr>
				<th>INDEX</th>
			</tr>
			<tr>
				<td><a href="#">유저관리</a></td>
			</tr>
			<tr>
				<td><a href="#">상품관리</a></td>
			</tr>
			<tr>
				<td><a href="#">내 정보</a></td>
			</tr>
		</table>
	</div>
	<div class="content_area">
		<div class="">
			판매진행현황
			<table border="1">
				<tr>
					<th>유저리스트</th>
					<c:forEach items="${userList}" var="MemberDto">
						<td><c:out value="${MemberDto.opt_name}"/></td>
					</c:forEach>
				</tr>
				<tr>
					<th>상품리스트</th>
					<c:forEach items="${itemList}" var="ItemDto">
						<td><c:out value="${ItemDto.item_name}"/></td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<div class="">
			판매실적/판매현황
			<table border="1">
				<tr>
					<td>
						TODAY<br>
						<c:out value="${todaySales}건"></c:out>
						<img src="#">
					</td>
					<td>
						MONTH<br>
						<c:out value="${monthSales}건"></c:out>
						<img src="#">
					</td>
					<td>
						<span>재고부족</span><br>
						<c:out value="${alertItemCount}건"></c:out>
						<img src="#">
					</td>
				</tr>
			</table>
		</div>
		<div class="">
		판매차트<br>
		<script src="http://d3js.org/d3.v3.min.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				var dayData = [${twoDaySales}, ${oneDaySales}, ${todaySales}];
				var monthData = [${twoMonthSales}, ${oneMonthSales}, ${monthSales}];
				var day = d3.select("#day").selectAll();
				var month = d3.select("#month").selectAll();
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
			}
		</script>
		</div>
		<div id="itemCountWarning" style="display: none;">재고가 5개 이하인 상품들의 개수입니다</div>
		<div id="graph">
			<svg id="day" style="width:110; height:125;"></svg>
			<svg id="month" style="width:110; height:125;"></svg>
		</div>
		
	</div>
</body>
</html>