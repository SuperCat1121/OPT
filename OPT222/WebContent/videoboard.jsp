<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<h1>동영상 게시판</h1>
	<table style="border: none; margin-top: 20px; margin-bottom: 20px;">
		<tr>
			<td><select name="searchoption">
					<option value="VIDEO_NO_SEQ">비디오 번호</option>
					<option value="OPT_NO_SEQ">작성자</option>
					<option value="VIDEO_TITLE">제목</option>
			</select></td>
			<td><input type="text" name="searchtext"> <input
				type="submit" value="검색하기"></td>
		</tr>
	</table>
	<table>
		<c:choose>
			<c:when test="${empty list }">
						------등록된 상품이 없습니다------
				</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="videoDto">
					<tr>
						<td><iframe width="426" height="245"
								src=${videoDto.video_url }></iframe></td>
						<td style="padding-left: 20px; padding-bottom: 130px;"
							onclick="location.href='video.do?command=videoDetail&no=${videoDto.video_no_seq}&page=${page }'"><h4>${videoDto.video_title }${videoDto.video_no_seq}</h4>
							조회수 : ${videoDto.video_views_no }<br /> 등록시간 :
							${videoDto.video_regdate }<br /> ${videoDto.video_content }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<table>
		<tr>
			<td><c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
				<c:choose>
					<c:when test="${prevPage >0}">
						<a href="video.do?command=video&page=${prevPage }">◀</a>
					</c:when>
					<c:otherwise>
						<a href="video.do?command=video&page=1">◀</a>
					</c:otherwise>
				</c:choose> <c:forEach begin="${absolutePage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<a href="video.do?command=video&page=${i}"><strong>[${ i }]</strong></a>
						</c:when>
						<c:otherwise>
							<a href="video.do?command=video&page=${i}">[${ i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
				<c:choose>
					<c:when test="${nextPage < totalPage}">
						<a href="video.do?command=video&page=${nextPage }">▶</a>
					</c:when>
					<c:otherwise>
						<a href="video.do?command=video&page=${totalPage}">▶</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
</body>
</html>