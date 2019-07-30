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
	<section>
		<article class="firstline">
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
		</article>
		<article class="firstline">
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
		</article>
		<article>
			판매차트<br>
			<% int[] arr = {1, 2}; %>
			<script src="http://d3js.org/d3.v3.min.js"></script>
			<script type="text/javascript">
				window.onload = function() {
					var monthData = [${month}-2, ${month}-1, ${month}];
					var dayData = [${day}-2, ${day}-1, ${day}];
					var Data = [10, 50, 100, 150];
					var rect = d3.select("#month").selectAll();
					var rect2 = d3.select("#day").selectAll();
					
					rect.data(Data).enter()
					.append("rect")
					.attr("height",function(d) {
						return d+"px";
					})
					.attr("width", function(d) {
						return "25px";
					})
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d, i) {
						return 300-d;
					})
					.attr("class", "bar");
					
					rect2.data(monthData).enter()
					.append("rect")
					.attr("height", function(d) {
						return d*12+"px";
					})
					.attr("width", function(d) {
						return "25px";
					})
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d, i) {
						return 600-d*12;
					})
					.attr("class", "bar");
					// 글자 출력
					rect2.data(monthData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35+10;
					})
					.attr("y", function(d) {
						return 600-d;
					})
					.style("font-size", "12pt")
					.text(function(d){
						return d;
					});
					
					
					rect2.data(monthData).enter()
					.append("text")
					.attr("x", function(d, i) {
						return i*35;
					})
					.attr("y", function(d) {
						return 610;
					})
					.style("font-size", "8pt")
					.text(function(d, i) {
						return ["2달전", "1달전", "이번달"][i];
					});
				}
			</script>
			<svg></svg>
		</article>
		
	</section>
	<div id="itemCountWarning" style="display: none;">재고가 5개 이하인 상품들의 개수입니다</div>
	<svg id="month" style="width:300; height:300;"></svg>
	<svg id="day" style="width:700; height:700;"></svg>
	</div>
</body>
</html>