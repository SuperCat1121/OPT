<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".itemUpdate").click(function() {
			var item_num_seq = $(this).parent().siblings().eq(0).text();
			var item_name = $(this).parent().siblings().eq(1).text();
			var item_price = $(this).parent().siblings().eq(2).text();
			var item_content = $(this).parent().siblings().eq(3).text();
			window.open("admin.do?command=adminItemUpdate&item_num_seq="+item_num_seq+"&item_name="+item_name+"&item_price="
					      +item_price+"&item_content="+item_content,"", "width=500,height=600,top=300,left=600");
		});
		
		$("#itemManagerPopupClose").click(function() {
			$(".adminItemManagerPopup").fadeToggle(400);
			$(".layer").toggle();
		});
	});
</script>
</head>
<body>
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
</body>
</html>