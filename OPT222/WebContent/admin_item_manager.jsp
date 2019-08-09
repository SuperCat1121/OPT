<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<link href="css/admin_item_manager.css" rel="stylesheet" type="text/css">
<h3>상품관리</h3>
<a href="#" id="itemManagerPopupClose">x</a>
<hr>
<table border="1">
	<tr>
		<th>상품번호</th>
		<th>상품이름</th>
		<th>가격</th>
		<th>상품설명</th>
	</tr>
	<c:forEach items="${itemList}" var="ItemDto">
	<tr>
			<td>${ItemDto.item_num_seq}</td>
			<td>${ItemDto.item_name}</td>
			<td>${ItemDto.item_price}</td>
			<td>${ItemDto.item_content}</td>
			<td><input type="button" class="itemUpdate" value="수정"></td>
		</tr>
	</c:forEach>
</table>
<div class="itemPageNum">
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="#" class="itemPage"><c:out value="${i}"/></a>
		&nbsp;
	</c:forEach>
</div>















