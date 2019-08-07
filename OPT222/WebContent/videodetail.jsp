<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function insertComment(){
		if(${empty memdto.opt_no_seq}){
			alert("로그인 부터 해주세요");
		}else{
			var sessionId = ${memdto.opt_no_seq};
			location.href="video.do?command=addComment&videoNo=${VideoDto.opt_no_seq }&id="+ sessionId;
		}	
	}
	function deleteComment(commenter) {
		if(${empty memdto.opt_no_seq}){
			alert("로그인 부터 해주세요");
		}else{
			var sessionId = ${memdto.opt_no_seq};
			if(commenter === sessionId){
				location.href="video.do?command=deleteComment&videoNo=${VideoDto.opt_no_seq }&id="+ sessionId;
			}else{
				alert("본인 댓글만 삭제 가능합니다.");
			}
		}	
	}
	function updateComment() {
		if(${empty memdto.opt_no_seq}){
			alert("로그인 부터 해주세요");
		}else{
			var sessionId = ${memdto.opt_no_seq};
			if(commenter === sessionId){
				location.href="video.do?command=updateComment&videoNo=${VideoDto.opt_no_seq }&id="+ sessionId;
			}else{
				alert("본인 댓글만 수정 가능합니다.");
			}
		}	
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>비디오 디테일</h1>
	<iframe width="960" height="500" src=${VideoDto.video_url }></iframe>
	<br /> ${VideoDto.video_title } 조회수 : ${VideoDto.video_views_no } 등록시간
	: ${VideoDto.video_regdate } ${VideoDto.video_content }
	<input type="button" value="댓글달기" onclick="insertComment()" />
	<table>
		<c:choose>
			<c:when test="${empty list }">
						------등록된 상품이 없습니다------
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="VideoComment">
					<tr>
						<td>비디오 코멘트 순번<c:out
								value="${VideoComment.video_comment_seq }" /></td>
						<td>비디오 코멘드 내용<c:out value="${VideoComment.video_reple }" /></td>
						<td>코멘트 작성일자<c:out
								value="${VideoComment.video_comment_date }" /></td>
						<td><input type="button" value="삭제"
							onclick="deleteComment(${VideoComment.opt_no_seq })"></td>
						<td><input type="button" value="수정"
							onclick="updateComment(${VideoComment.opt_no_seq })"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr></tr>
	</table>

</body>
</html>