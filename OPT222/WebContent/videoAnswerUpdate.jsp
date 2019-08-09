<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="commentFrm" action="video.do" method="get">
		<input type="hidden" name="command" value="videoAnswerUpdateres">
		<input type="hidden" name="videoseq" value="${videoseq }"> <input
			type="hidden" name="video_comment_seq"
			value="${videoComment.video_comment_seq }">
		<table border="1">
			<tr>
				<th>사용자</th>
				<th>댓글</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td><input name="opt_id" value="${videoComment.opt_id }" /></td>
				<td><input name="video_reple"
					value="${videoComment.video_reple }" /></td>
				<td><input value="${videoComment.video_comment_date }" /></td>
			</tr>
		</table>
		<input type="submit" value="변경" >
	</form>
</body>
</html>