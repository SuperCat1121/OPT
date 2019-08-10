<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/postList.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#postbox").change(function() {
			if ($("#postbox option:selected").val() == "받은 쪽지함") {
				location.href = "postbox.do?command=recivePostbox&page=1";
			} else {
				location.href = "postbox.do?command=sendPostbox&page=1";
			}
		});

	});

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

	var stripe = function() {
		var tables = document.getElementsByTagName("table");

		for (var x = 0; x != tables.length; x++) {
			var table = tables[x];
			if (!table) {
				return;
			}

			var tbodies = table.getElementsByTagName("tbody");

			for (var h = 0; h < tbodies.length; h++) {
				var even = true;
				var trs = tbodies[h].getElementsByTagName("tr");

				for (var i = 0; i < trs.length; i++) {
					trs[i].onmouseover = function() {
						this.className += " ruled";
						return false
					}
					trs[i].onmouseout = function() {
						this.className = this.className.replace("ruled", "");
						return false
					}

					if (even)
						trs[i].className += " even";

					even = !even;
				}
			}
		}
	}

	window.onload = stripe;
</script>

</head>
<body>
	<h1>내 쪽지함</h1>
	<hr>
	<div class="content_area">
		<form action="postbox.do" method="post" id="muldelform">
			<div>
				<div class="dropdown">
					<select id="postbox" name="one" class="dropdown-select">
						<option>받은 쪽지함</option>
						<option selected>보낸 쪽지함</option>
					</select>
				</div>
				<input class="btn" type="submit" value="삭제" /> <input class="btn"
					type="button" value="쪽지보내기"
					onclick="location.href='postbox.do?command=writePost&type=sendPostbox&page=${page }'" />&nbsp;

			</div>
			<br /> <input type="hidden" name="command" value="multiDel" /> <input
				type="hidden" name="type" value="sendPostbox" /> <input
				type="hidden" name="page" value="${page }" />
			<table style="margin-top: -10px;">
				<col width="120" />
				<col width="300" />
				<col width="150" />
				<col width="150" />
				<col width="50" />
				<thead>
					<tr>
						<td>받은사람</td>
						<td>제목</td>
						<td>받은시간</td>
						<td>읽은시간</td>
						<td><input type="checkbox" name="all"
							onclick="allChk(this.checked);" /></td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5">----------보낸 쪽지가 없습니다----------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<tr>
									<td>${dto.post_recive_id }</td>
									<td><a
										href="postbox.do?command=sendPostdetail&post_no=${dto.post_no_seq }&page=${page }&type=sendPostbox">${dto.post_title }</a></td>
									<td>${dto.post_send_date }</td>
									<td><c:choose>
											<c:when test="${dto.post_recive_read eq 'N'}">
												<c:out value="읽지않음"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${dto.post_read_date }"></c:out>
											</c:otherwise>
										</c:choose></td>
									<td><input type="checkbox" name="chk"
										value="${dto.post_no_seq }" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</form>


		<div class="pagination">
			<div class="pagepoint">
				<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
				<c:choose>
					<c:when test="${prevPage >0}">
						<a href="postbox.do?command=sendPostbox&page=${prevPage }"
							class="page gradient">◀</a>
					</c:when>
					<c:otherwise>
						<a href="postbox.do?command=sendPostbox&page=1"
							class="page gradient">◀</a>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${absolutePage }" end="${endPage }" var="i">
					<c:choose>
						<c:when test="${i eq page}">
							<a href="postbox.do?command=sendPostbox&page=${i}"><span
								class="page active">${i}</span></a>
						</c:when>
						<c:otherwise>
							<a href="postbox.do?command=sendPostbox&page=${i}"
								class="page gradient">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
				<c:choose>
					<c:when test="${nextPage < totalPage}">
						<a href="postbox.do?command=sendPostbox&page=${nextPage }"
							class="page gradient">▶</a>
					</c:when>
					<c:otherwise>
						<a href="postbox.do?command=sendPostbox&page=${totalPage}"
							class="page gradient">▶</a>
					</c:otherwise>
				</c:choose>
			</div>
			<h3>전체 보낸 쪽지 [${allCount}]개</h3>

		</div>
	</div>

</body>
</html>