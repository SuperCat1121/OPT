<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<h1>검색 게시판</h1>
	<form action="video.do">
		<input type="hidden" name="command" value="searchVideo" /> <input
			type="hidden" name="page" value="1" />

		<table style="border: none; margin-top: 20px; margin-bottom: 20px;">
			<tr>
				<td><select name="searchoption">
						<option value="opt_id">아이디</option>
						<option value="video_title">제목</option>
						<option value="video_content">내용</option>
				</select></td>
				<td><input type="text" name="searchtext"> <input
					type="submit" value="검색하기"></td>
				<!-- 						<a href="videoupload.jsp">비디오 업로드</a> -->
			</tr>
		</table>
	</form>
	<table>
		<c:choose>
			<c:when test="${empty list }">
						------등록된 상품이 없습니다------
				</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="videoDto">
					<tr>
						<c:set var="videourl" value="${videoDto.video_url }" />
						<td><c:choose>
								<c:when test="${fn:startsWith(videourl, 'h')}">
									<iframe width="426" height="245" src=${videoDto.video_url }></iframe>
								</c:when>
								<c:otherwise>
									<video width="426" height="245"
										src="./video/${videoDto.video_url }" controls="controls"></video>
								</c:otherwise>
							</c:choose></td>
						<td style="padding-left: 20px; padding-bottom: 130px;"
							onclick="location.href='video.do?command=videoDetail&no=${videoDto.video_no_seq}&page=${page }'">
							<h4>${videoDto.video_title }${videoDto.video_no_seq}</h4> 조회수 :
							${videoDto.video_views_no } <br /> 등록시간 : <fmt:formatDate
								value="${videoDto.video_regdate }" pattern="yyyy-MM-dd HH:mm" />
							<br />
							<h1>1111${videoDto.opt_id}</h1> <br /> ${videoDto.video_content }
						</td>
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
						<a
							href="video.do?command=searchVideo&page=${prevPage }&videoarea=main">◀</a>
					</c:when>
					<c:otherwise>
						<a href="video.do?command=searchVideo&page=1&videoarea=main">◀</a>
					</c:otherwise>
				</c:choose> <c:forEach begin="${absolutePage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<a href="video.do?command=searchVideo&page=${i}&videoarea=main"><strong>[${ i }]</strong></a>
						</c:when>
						<c:otherwise>
							<a href="video.do?command=searchVideo&page=${i}&videoarea=main">[${ i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
				<c:choose>
					<c:when test="${nextPage < totalPage}">
						<a
							href="video.do?command=searchVideo&page=${nextPage }&videoarea=main">▶</a>
					</c:when>
					<c:otherwise>
						<a
							href="video.do?command=searchVideo&page=${totalPage}&videoarea=main">▶</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
</body>
</html>