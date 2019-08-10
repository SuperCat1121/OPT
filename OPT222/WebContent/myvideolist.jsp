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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function allChk(bool) {
		if (bool == true) {
			$("input[name=chk]").prop("checked", true);
		} else {
			$("input[name=chk]").prop("checked", false);
		}
	}
	$(function() {
		$("input[name=chk]")
				.click(
						function() {
							if ($("input[name=chk]:checked").length == $("input[name=chk]").length) {
								$("input[name=all]").prop("checked", true);
							} else {
								$("input[name=all]").prop("checked", false);
							}
						});
	});

	$(function() {
		$("#muldelform").submit(function() {
			if ($("#muldelform input:checked").length == 0) {
				alert("하나 이상 체크해 주세요!!");
				return false;
			}
		});
	});
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
					value="업로드" onclick="location.href='videoupload.jsp'"> <input
					type="button" value="목록"
					onclick="location.href='video.do?command=videoList&page=1&videoarea=main'"></td>
			</tr>
		</table>
	</form>
	<form action="video.do" method="get" id="muldelform">
		<input type="hidden" name="command" value="multiDel" />
		<table>
			<tr>

				<td><input type="checkbox" name="all"
					onclick="allChk(this.checked);" /> <input type="submit"
					value="전체삭제"></td>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
						------등록된 상품이 없습니다------
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="videoDto">
						<c:if test="${videoDto.opt_no_seq == memdto.opt_no_seq }">
							<tr>
								<td><input type="checkbox" name="chk"
									value="${videoDto.video_no_seq }" /></td>
								<c:set var="videourl" value="${videoDto.video_url }" />
								<td><c:choose>
										<c:when test="${fn:startsWith(videourl, 'h')}">
											<iframe width="426" height="245" src="${videoDto.video_url }"></iframe>
										</c:when>
										<c:otherwise>
											<video width="426" height="245"
												src="./video/${videoDto.video_url }" autoplay=""
												controls="controls"></video>
										</c:otherwise>
									</c:choose></td>
								<td style="padding-left: 20px; padding-bottom: 130px;"
									onclick=""><h4>${videoDto.video_title }${videoDto.video_no_seq}</h4>
									조회수 : ${videoDto.video_views_no }<br /> 등록시간 :
									${videoDto.video_regdate }<br />
									<h1>1111${videoDto.opt_id}</h1> <br />
									${videoDto.video_content }</td>
								<td><input type="button" value="수정"
									onclick="location.href='video.do?command=updatevideo&videoseq=${videoDto.video_no_seq }'">
									<input type="button" value="삭제"
									onclick="location.href='video.do?command=deletevideo&videoseq=${videoDto.video_no_seq }'">
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	<table>
		<tr>
			<td><c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
				<c:choose>
					<c:when test="${prevPage >0}">
						<a
							href="video.do?command=videoList&page=${prevPage }&videoarea=my">◀</a>
					</c:when>
					<c:otherwise>
						<a href="video.do?command=videoList&page=1&videoarea=my">◀</a>
					</c:otherwise>
				</c:choose> <c:forEach begin="${absolutePage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<a href="video.do?command=videoList&page=${i}&videoarea=my"><strong>[${ i }]</strong></a>
						</c:when>
						<c:otherwise>
							<a href="video.do?command=videoList&page=${i}&videoarea=my">[${ i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
				<c:choose>
					<c:when test="${nextPage < totalPage}">
						<a
							href="video.do?command=videoList&page=${nextPage }&videoarea=my">▶</a>
					</c:when>
					<c:otherwise>
						<a
							href="video.do?command=videoList&page=${totalPage}&videoarea=my">▶</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
</body>

</html>