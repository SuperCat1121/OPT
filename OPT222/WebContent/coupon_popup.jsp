<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/coupon_popup.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="coupon_title">
	<h3>쿠폰함</h3>
	</div>
	<div class="coupon_list">
			<table summary="쿠폰번호 쿠폰이름 쿠폰내용 유효기간 할인가격">
				<colgroup>
					<col width="70">
					<col width="100">
					<col width="*">
					<col width="100">
					<col width="70">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="th_title">쿠폰번호</div>
						</th>
						<th>
							<div class="th_title">쿠폰이름</div>
						</th>
						<th>
							<div class="th_title">쿠폰내용</div>
						</th>
						<th>
							<div class="th_title">유효기간</div>
						</th>
						<th>
							<div class="th_title">할인가격</div>
						</th>
					</tr>
				</thead>
	 			<tbody>
		<c:choose>
		<c:when test="${empty coupondto }">
			<tr>
				<td colspan="5">----------------내용이없습니다-------</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${coupondto }" var="dto">
					<tr>
						<td><div class="td_content">${dto.coupon_no }</div></td>
						<td><div class="td_content">${dto.coupon_name }</div></td>					
						<td><div class="td_content">${dto.coupon_content }</div></td>
						<td><div class="td_content">${dto.coupon_date }</div></td>
						<td><div class="td_content"><fmt:formatNumber value="${dto.coupon_sale }" pattern="#,##0" />원</div></td>
					</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
		</tbody>	 
			</table>
		</div>
</body>
</html>