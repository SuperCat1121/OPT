<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/item_list.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		$("#postbox").change(function(){
			if($("#postbox option:selected").val() == "보낸 쪽지함"){
				location.href="postbox.do?command=sendPostbox&page=1";
			}else{
				location.href="postbox.do?command=recivePostbox&page=1";				
			}
		});
	
	});
	

</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h1>내 쪽지함</h1>
	<hr>
	<h3>전체 받은 쪽지 [${allCount}]개</h3>
	<select id="postbox">
		<option selected>받은 쪽지함</option>
		<option>보낸 쪽지함</option>
	</select>
	
	<table border="1" style="text-align: center;">
		<col width="150"/>
		<col width="150"/>
		<col width="150"/>
		<col width="150"/>
		<col width="50"/>
		<tr>
			<th>보낸사람</th>
			<th>제목</th>
			<th>보낸시간</th>
			<th>읽은시간</th>
			<th><input type="checkbox" name="all"></th>				
		</tr>	
	<c:choose>		
			<c:when test="${empty list }">
			<tr>
				<td colspan="5">----------받은 쪽지가 없습니다----------</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">				
					<tr>
						<td>${dto.opt_id }</td>
						<td><a href="postbox.do?command=recivePostdetail&post_no=${dto.post_no_seq }&page=${page }&type=recivePostbox">${dto.post_title }</a></td>
						<td>${dto.post_send_date }</td>
						<td>
							<c:choose>
								<c:when test="${dto.post_recive_read eq 'N'}">
									<c:out value="읽지않음"></c:out>
								</c:when>
								<c:otherwise>
									<c:out value="${dto.post_read_date }"></c:out>
								</c:otherwise>
							</c:choose>
						</td>
						<td><input type="checkbox" name="chk" ></td>
					</tr>					
				</c:forEach>
			</c:otherwise>		
	</c:choose>
	</table>
	<table>
		<tr>
			<td>
				<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
			<c:choose>
				<c:when test="${prevPage >0}">
					<a href="postbox.do?command=recivePostbox&page=${prevPage }">◀</a>
				</c:when>
				<c:otherwise>
					<a href="postbox.do?command=recivePostbox&page=1">◀</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${absolutePage }" end="${endPage }" var="i">
				<c:choose>
				<c:when test="${i eq page}">
					<a href="postbox.do?command=recivePostbox&page=${i}"><strong>[${ i }]</strong></a>
				</c:when>
				<c:otherwise>
					<a href="postbox.do?command=recivePostbox&page=${i}">[${ i }]</a>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
			<c:choose>
				<c:when test="${nextPage < totalPage}">
					<a href="postbox.do?command=recivePostbox&page=${nextPage }">▶</a>
				</c:when>
				<c:otherwise>
					<a href="postbox.do?command=recivePostbox&page=${totalPage}">▶</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</table>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>