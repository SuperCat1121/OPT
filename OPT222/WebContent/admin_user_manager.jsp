<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<link href="css/admin_user_manager.css" rel="stylesheet" type="text/css">
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
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="#" class="userPage"><c:out value="${i}"/></a>
		&nbsp;
	</c:forEach>
</table>