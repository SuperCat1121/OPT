<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function commenMessageFn() {
		$("#messageFrm").submit();
		self.close();

	}
</script>
</head>
<body>
	<h1>내 쪽지함</h1>
	<hr>
	<form id="messageFrm" action="postbox.do" method="post">
		<input type="hidden" name="command" value="sendPostRes" />
		<table border="1">
			<tr>
				<th>아 이 디</th>
				<td><input type="text" name="user" value="${id }"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" required="required"
					maxlength="20" /></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="60" name="content"
						required="required" maxlength="200" style="resize: none;"></textarea></td>
			</tr>
		</table>
		<br /> <input id="commenMessage" type="button" value="답장하기"
			onclick="commenMessageFn()" />&nbsp; <input type="button"
			value="목록으로" onclick="self.close();">
	</form>
</body>
</html>