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
		$("#myvedioBtn").attr("style","display:none");
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
 		window.open("videoMessage.jsp?id="+id, "", "width=300px; height=300px;");
 	}

</script>
</head>
<body>
	<h1>동영상 게시판</h1>
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
					type="submit" value="검색하기"> <input type="button"
					value="업로드" onclick="videouploada()"></td>
			</tr>
			<tr>
				<td><input id="myvedioBtn" type="button" value="내가 올린 동영상 목록"
					onclick="location.href='video.do?command=videoList&page=1&videoarea=my'"></td>
			</tr>
		</table>
	</form>
	<table>
		<c:choose>
			<c:when test="${empty list }">
						------등록된 동영상이 없습니다------
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
						<td style="padding-left: 20px; padding-bottom: 130px;">
							<h4
								onclick="location.href='video.do?command=videoDetail&videoseq=${videoDto.video_no_seq}&page=${page }'">타이틀
								: ${videoDto.video_title }</h4>
							<h4>비디오 번호 : ${videoDto.video_no_seq}</h4>
							<h4>조회수 : ${videoDto.video_views_no }</h4>
							<h4>
								등록시간 :
								<fmt:formatDate value="${videoDto.video_regdate }"
									pattern="yyyy-MM-dd HH:mm" />
							</h4>
							
							<h4 onclick="videoMessage('${videoDto.opt_id}')">${videoDto.opt_id}</h4> <br />
							${videoDto.video_content }
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
</body>

</html>