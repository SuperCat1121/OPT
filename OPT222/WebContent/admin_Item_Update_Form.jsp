<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="admin.do" method="post">
		<input type="hidden" name="command" value="adminItemUpdateRes">
		<input type="hidden" name="item_num_seq" value="${item_num_seq}">
		<table>
			<tr>
				<th>상품이름</th>
				<td><input type="text" name="item_name" value="${item_name}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="item_price" value="${item_price}"></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td><textarea rows="6" cols="8" name="item_content"><c:out value="${item_content}"/></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>