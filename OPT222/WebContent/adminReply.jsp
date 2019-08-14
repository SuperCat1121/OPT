<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
</head>
<body>
	<h1>글 작성</h1>
	<form action="service.do" method="get" role="form" novalidate
		onsubmit="postForm()">
		<input type="hidden" name="command" value="adminanswer" /> <input
			type="hidden" name="opt_no_seq" value="${ memdto.opt_no_seq}" />
			<input type="hidden" name="customer_no_seq" value="${param.customer_no_seq }" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" value="${ memdto.opt_id}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name="admin_answer_content" style="display: none;"></textarea>
					<div id="summernote"></div></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="reset" value="리셋" />
					<input type="button" value="목록" onclick="location.href='service.do?command=servicelist&page=1'">
				</td>
			</tr>
		</table>
	</form>

	<script>
		$('#summernote').summernote({
			tabsize : 1,
			height : 300
		});

		function postForm() {
			$('textarea[name="admin_answer_content"]').val(
					$('#summernote').summernote('code'));
		}
	</script>
</body>
</html>