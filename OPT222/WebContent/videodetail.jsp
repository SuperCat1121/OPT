<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script>
$(function(){
	if(${empty memdto }){
		$("#commentFrm").attr("style","display:none");
	}
	

})

</script>
</head>
<body>
	<div
		style="display: inline-block; position: inherit; margin: 10px 155px;">
		<h1>비디오 디테일${sessionScope.memdto.opt_no_seq}</h1>
		<div>
			<c:set var="videourl" value="${videoDto.video_url }" />
			<c:choose>
				<c:when test="${fn:startsWith(videourl, 'h')}">
					<iframe width="900" height="506" src=${videoDto.video_url }></iframe>
				</c:when>
				<c:otherwise>
					<video width="900" height="506"
						src="./video/${videoDto.video_url }" controls="controls"></video>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<h2>${videoDto.video_title }</h2>
		</div>
		<div>${videoDto.video_content }</div>
		<div>조회수 ${videoDto.video_views_no }</div>
		<div>게시일 ${videoDto.video_regdate }</div>
		<form action="video.do" method="get" id="commentFrm">
			<input type="hidden" name="command" value="videoAnswerinsert">
			<input type="hidden" name="no" value="${videoDto.video_no_seq }">
			<table border="1">
				<tr>
					<th width="200">사용자</th>
					<th width="200">댓글 쓰기</th>
				</tr>
				<tr>
					<td>${memdto.opt_id }</td>
					<td><input type="text" name="video_reple"></td>
					<td><input type="submit" value="댓글 작성"></td>
				</tr>
			</table>
		</form>
		<table border="1">
			<tr>
				<th>사용자</th>
				<th>댓글</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
						------댓글이 없습니다------
			</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="videoComment">
						<tr>
							<td><c:out value="${videoComment.opt_id }" /></td>
							<td><c:out value="${videoComment.video_reple }" /></td>
							<td><c:out value="${videoComment.video_comment_date }" /></td>
							<c:choose>
								<c:when test="${memdto.opt_no_seq == videoComment.opt_no_seq }">
									<td><input type="button" value="삭제"
										onclick="location.href='video.do?command=DeletevideoAnswer&commentseq=${videoComment.video_comment_seq }&videoseq=${videoDto.video_no_seq}&page=1'"></td>
									<td><input type="button" value="수정"
										onclick="location.href='video.do?command=videoAnswerUpdate&commentseq=${videoComment.video_comment_seq }&videoseq=${videoDto.video_no_seq}&page=1'"></td>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<table
		style="display: inline-block; position: absolute; margin: 85px 100px;">
		<c:choose>
			<c:when test="${empty videoList }">
						------등록된 동영상이 없습니다------
				</c:when>
			<c:otherwise>
				<c:forEach items="${videoList }" var="videoDto">
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
							onclick="location.href='video.do?command=videoDetail&videoseq=${videoDto.video_no_seq}&page=${page }'">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>





</body>
</html>
