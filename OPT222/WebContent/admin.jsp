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
		width : 100%;
		height : 100%;
	}

	body {
		width : 100%;
		height : 100%;
		margin : 0px;
		padding : 0px;
		border : 0px;
	}
	
	section {
		margin : 0 atuo;
	}
	
	.firstline {
		width : 400px;
		display : inline-block;
	}
	
</style>
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
				<tr>
					<td>
						<input type="button" value="입금확인중">
						<input type="button" value="주문점수">
						<input type="button" value="발주확인">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="출고처리">
						<input type="button" value="출고지연">
						<input type="button" value="출고완료">
					</td>
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
						재고부족<br>
						<c:out value="${alertItemCount}건"></c:out>
						<img src="#">
					</td>
				</tr>
			</table>
		</article>
		<article>
			판매차트
		</article>
	</section>
	<nav>
		<a href="#">유저관리</a>
		<a href="#">상품관리</a>
		<a href="#">내 정보</a>
	</nav>
</body>
</html>