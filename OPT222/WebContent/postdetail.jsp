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
	<table border="1">		
		<tr>
			<th>보낸사람</th>
			<td>${postDto.opt_id }</td>	
		</tr>
		<tr>
			<th>보낸시간</th>
			<td>${postDto.post_send_date }</td>
		</tr>
		<tr>
			<th>제     목</th>
			<td>${postDto.post_title }</td>
		</tr>
		<tr>
			<th>내     용</th>
			<td><textarea rows="10" cols="40" readonly="readonly" style="resize: none;">${postDto.post_content }</textarea></td>
		</tr>
	</table>
	<br/>
	<input type="button" value="답장" onclick="location.href='postbox.do?command=sendPostForm&user=${postDto.opt_id }&type=${type }&page=${page }'" />&nbsp;
	<input type="button" value="쪽지목록" onclick="location.href='postbox.do?command=${type }&page=${page }'"/>&nbsp;
	<input type="button" value="삭제" onclick="location.href='postbox.do?command=delPost&post_no=${postDto.post_no_seq }&type=${type }&page=${page }'"/>
		

	

</body>
</html>