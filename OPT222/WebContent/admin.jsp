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
<style type="text/css">
	html {
		width: 100%;
		height: 100%;
	}

	body {
		width: 100%;
		height: 100%;
		margin: 0px;
		padding: 0px;
		border: 0px;
	}
	
	h1 {
		margin: 0px;
		padding: 0px;
	}
	
	section {
		margin: 0 atuo;
		background: lime;
	}
	
	.firstline {
		width: 350px;
		height: 350px;
		display: inline-block;
	}
	
	nav {
		float: right;
		margin-right: 160px;
	}
	
	.bar {
		display: inline-block;
		background: orange;
		margin-left: 5px;
	}
	
</style>
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
					alert(monthSales);
					d3.select("body").selectAll("d")
					.data(data)
					.enter()
					.append("div")
					.style("height",function(d) {
						return d+"px";
					})
					.style("width",function(d) {
						return "20px";
					})
					.attr("class", "bar");
				}
			</script>
			<svg></svg>
		</article>
	</section>
	<nav>
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
	</nav>
	<div id="itemCountWarning" style="display: none;">재고가 5개 이하인 상품들의 개수입니다</div>
</body>
</html>