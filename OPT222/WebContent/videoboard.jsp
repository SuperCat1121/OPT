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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	if(${empty memdto} == true){
		$(".myvedioBtn").attr("style","display:none");
		}
})
	function videouploada(){
		var opt_no = 0 + 0${memdto.opt_no_seq };
		if(opt_no == 0){
			location.href="login.jsp?Flag=1";
		}else{
			location.href="videoupload.jsp";
		}
	}
	function videoMessage(id) {
		console.log(id);
 		window.open("videoMessage.jsp?id="+id, "", "width=600px; height=480px;");
 	}

</script>
<style type="text/css">
.pageHeader {
	text-align: center
}

.videoSearch {
	margin-left: 37%;
	margin-bottom: 30px;
}

.videoList {
	margin-left: 24%;
}

.videoContent {
	padding-left: 40px;
	position: absolute;
	width: 533px;
	height: 243px;
	overflow: hidden;
}

.videoPaging {
	margin-left: 50%
}
</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<h1 class="pageHeader">동영상 게시판</h1>
	<form class="videoSearch" action="video.do">
		<input type="hidden" name="command" value="searchVideo" /> <input
			type="hidden" name="page" value="1" />
		<table style="border: none; margin-top: 20px; margin-bottom: 20px;">
			<tr>
				<td><select name="searchoption"
					style="width: 92px; height: 36px;">
						<option value="opt_id">아이디</option>
						<option value="video_title">제목</option>
						<option value="video_content">내용</option>
				</select></td>
				<td><input type="text" name="searchtext"
					style="width: 300px; height: 30px; font-weight: bold"> <input
					type="submit" value="검 색"
					style="height: 36px; width: 76px; background: rgb(105, 1, 143); color: white; font-weight: bold;"></td>
				<td class="myvedioBtn"><input type="button" value="나의 동영상"
					onclick="location.href='video.do?command=videoList&page=1&videoarea=my'">
					<input type="button" value="업로드"
					onclick="location.href='videoupload.jsp'"></td>
			</tr>
		</table>
	</form>
	<table class="videoList">
		<c:choose>
			<c:when test="${empty list }">
						------등록된 동영상이 없습니다------
				</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="videoDto">
					<tr>
						<c:set var="videourl" value="${videoDto.video_url }" />
						<td style="padding-bottom: 15px;"><c:choose>
								<c:when test="${fn:startsWith(videourl, 'h')}">
									<iframe width="426" height="245" src=${videoDto.video_url }></iframe>
								</c:when>
								<c:otherwise>
									<video width="426" height="245"
										src="./video/${videoDto.video_url }" controls="controls"></video>
								</c:otherwise>
							</c:choose></td>
						<td class="videoContent">
							<h4 style="font-size: 1.5em; margin-top: 1px;"
								onclick="location.href='video.do?command=videoDetail&videoseq=${videoDto.video_no_seq}&page=${page }'">${videoDto.video_title }</h4>
							<span onclick="videoMessage('${videoDto.opt_id}')">${videoDto.opt_id}</span>
							<span>조회수 : ${videoDto.video_views_no }</span> <span> 등록시간
								: <fmt:formatDate value="${videoDto.video_regdate }"
									pattern="yyyy-MM-dd HH:mm" /><br>
						</span> <br /> ${videoDto.video_content }
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<table class="videoPaging">
		<tr>
			<td><c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
				<c:choose>
					<c:when test="${prevPage >0}">
						<a
							href="video.do?command=videoList&page=${prevPage }&videoarea=main">◀</a>
					</c:when>
					<c:otherwise>
						<a href="video.do?command=videoList&page=1&videoarea=main">◀</a>
					</c:otherwise>
				</c:choose> <c:forEach begin="${absolutePage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<a href="video.do?command=videoList&page=${i}&videoarea=main"><strong>[${ i }]</strong></a>
						</c:when>
						<c:otherwise>
							<a href="video.do?command=videoList&page=${i}&videoarea=main">[${ i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
				<c:choose>
					<c:when test="${nextPage < totalPage}">
						<a
							href="video.do?command=videoList&page=${nextPage }&videoarea=main">▶</a>
					</c:when>
					<c:otherwise>
						<a
							href="video.do?command=videoList&page=${totalPage}&videoarea=main">▶</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>

</html>