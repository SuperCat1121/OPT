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
	

});

$(function(){
	$("img").click(function(){
		$(this).next().slideToggle().end()
		.parent().siblings().find("ul").toggle();
			//$(".sub_menu2").toggle();
		});
	});



</script>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	border: 0;
	color: #888;
	font-style: normal;
	font-size: 16px;
	font-weight: 400;
	line-height: 1;
	letter-spacing: -1px;
	height: 100%;
}

ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

setion {
	display: block;
}

.video_area {
	margin: 0 auto;
	padding-top: 10px;
	width: 1600px;
	height: 1400px;
	padding-left: 100px;
}

a {
	text-decoration: none;
}

.side_nav_video {
	width: 500px;
	height: 1280px;
	position: relative;
	top: -1187px;
	left: 1100px;
}
/*다하고 css 파일로 옮기기  */
#answer text {
	cursor: text;
}

hr {
	width: 1000px;
	margin-left: 0px;
}

#video_reple {
	margin: 50px;
	size: 100px;
	width: 800px;
	margin-right: 10px;
	margin-left: 10px;
	height: 20px;
}

#opt_id {
	font-weight: bold;
}

.sub_menu1 {
	cursor: pointer;
}

.sub_menu2 {
	display: none;
	cursor: default;
}

#video_submit {
	width: 60px;
	height: 30px;
	background-color: purple;
	color: white;
	border: none;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="video_area">
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
			<h3>${videoDto.video_title }</h3>
		</div>
		<div>조회수 ${videoDto.video_views_no }</div>
		<hr>
		<div>11111${videoDto.opt_id}222</div>
		<div>${videoDto.video_content }</div>
		<div>
			<span> 게시일 : <fmt:formatDate
					value="${videoDto.video_regdate }" pattern="yyyy-MM-dd HH:mm" /><br>
			</span>
		</div>
		<hr>
		<!-- 댓글 작성 -->
				<form action="video.do" method="get" id="commentFrm">
					<input type="hidden" name="command" value="videoAnswerinsert">
					<input type="hidden" name="no" value="${videoDto.video_no_seq }">
					<table>

						<tr>
							<th>${memdto.opt_id }</th>
							<th><textarea rows="50" cols="20"id="video_reple" name="video_reple"></textarea></th>
							<th><input type="submit" id="video_submit" value="댓글 "></th>
						</tr>
					</table>
				</form>
		
		<hr>
		<!--댓글 목록  -->
		<table>

			<c:choose>
				<c:when test="${empty list }">
						------댓글이 없습니다------
			</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="videoComment">

						<tr style="height: 50px">
							<td id="opt_id"><c:out value="${videoComment.opt_id }" /></td>
							<td><fmt:formatDate
									value="${videoComment.video_comment_date }"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
						<tr  style="height: 50px; width:1000px;">
							<td style="width: 850px;"><c:out value="${videoComment.video_reple }" /></td>

							<c:choose>
								<c:when test="${memdto.opt_no_seq == videoComment.opt_no_seq }">
									<td><ul class="main_menu">


											<li class="sub_menu1"><img alt="" src="image/answer.png"
												width="30" height="30">
												<ul class="sub_menu2">
													<li><a
														href="video.do?command=DeletevideoAnswer&commentseq=${videoComment.video_comment_seq }&videoseq=${videoDto.video_no_seq}&page=1">삭제</a></li>
													<li><a
														href="video.do?command=videoAnswerUpdate&commentseq=${videoComment.video_comment_seq }&videoseq=${videoDto.video_no_seq}&page=1">수정</a></li>

												</ul></li>
										</ul></td>

								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<div class="side_nav_video">
			<table>
				<c:choose>
					<c:when test="${empty videoList }">
						-------등록된 동영상이 없습니다-------
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
		</div>
	</div>
	<div class="foot_wrap">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
