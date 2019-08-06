<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".userUpdate").click(function() {
			var id = $(this).parent().siblings().eq(0).text();
			var enabled = $(this).parent().siblings().eq(3).children().val();
			var role = $(this).parent().siblings().eq(5).children().val();
			//$(location).attr("href","admin.do?command=adminUserManagerRes&id="+id+"&enabled="+enabled+"&role="+role);
			$.ajax({
				url : "admin.do?command=adminUserUpdate",
				type : "POST",
				data : {"id" : id, "enabled" : enabled, "role" : role},
				dataType : "html",
				success : function(data) {
					alert(data);
				},
				error : function(request, status, error) {
					alert(request.status);
					alert(request.responseText);
					alert(status);
					alert(error);
				}
			});
		});
		$("#userManagerPopupClose").click(function() {
			$(".adminUserManagerPopup").fadeToggle(400);
			$(".layer").toggle();
		});
		$.ajax(function() {
			url : "admin.do?command=adminUserManagerRes";
			
		});
	});
</script>
<link href="css/adminUserManager.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:if test="${res}"></c:if>
	<h3>유저관리</h3>
	<a href="#" id="userManagerPopupClose">x</a>
	<hr>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>계정상태</th>
			<th>성별</th>
			<th>권한</th>
			<th>가입일자</th>
			<th></th>
		</tr>
		<c:forEach items="${memberList}" var="MemberDto">
			<tr>
				<td>${MemberDto.opt_id}</td>
				<td>${MemberDto.opt_name}</td>
				<td>${MemberDto.opt_email}</td>
				<td>
					<select>
						<!-- 계정상태가 Y면 Y를 기본값으로 선택 -->
						<c:if test="${MemberDto.opt_enabled eq 'Y'}">
							<option value="Y" selected="selected">Y</option>
							<option value="N">N</option>
						</c:if>
						<!-- 계정상태가 N면 N를 기본값으로 선택 -->
						<c:if test="${MemberDto.opt_enabled eq 'N'}">
							<option value="Y">Y</option>
							<option value="N" selected="selected">N</option>
						</c:if>
					</select>
				</td>
				<td>${MemberDto.opt_gender}</td>
				<td>
					<select>
						<c:if test="${MemberDto.opt_role eq 'admin'}">
							<option value="admin" selected="selected">admin</option>
							<option value="user">user</option>
						</c:if>
						<c:if test="${MemberDto.opt_role eq 'user'}">
							<option value="admin">admin</option>
							<option value="user" selected="selected">user</option>
						</c:if>
					</select>
				</td>
				<td>${MemberDto.opt_regdate}</td>
				<td><input type="button" class="userUpdate" value="수정"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>