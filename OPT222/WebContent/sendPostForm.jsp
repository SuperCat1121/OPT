<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
</head>
<body>

	<h1>내 쪽지함</h1>
	<hr>	
	<form action="postbox.do" method="post">
	<input type="hidden" name="command" value="sendPostRes" />	
	<table border="1">
		<tr>
			<th>아 이 디</th>
			<td><input type="text" name="user" value="${user }" readonly="readonly"/></td>			
		</tr>
		<tr>
			<th>제     목</th>
			<td><input type="text" name="title" required="required" maxlength="20"/></td>
		</tr>
		<tr>
			<th>내     용</th>
			<td><textarea rows="10" cols="60" name="content" required="required" maxlength="200" style="resize: none;"></textarea></td>
		</tr>	
	</table>
	<br/>
	<input type="submit" value="답장하기" />&nbsp;
	<input type="button" value="목록으로" onclick="location.href='postbox.do?command=${type }&page=${page }'">
	</form>

</body>
</html>