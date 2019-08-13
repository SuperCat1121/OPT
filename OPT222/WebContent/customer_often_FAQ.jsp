<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/customer.css" rel="stylesheet" type="text/css">
<style type="text/css">
	
	.foot_wrap_area{
		position: relative;
		top: 54px;
	}
</style>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	
	<div class="service_content_wrap">
		<h3>자주묻는질문</h3>
	<div class="category_menu">
		<ul>
			<li>
				<a href="#">자주묻는질문</a>
			</li>
			<li>
				<a href="customer.jsp">고객 QNA</a>
			</li>
		</ul>
	</div>
	<div class="coupon_list">
			<table summary="글 번호 글 제목 글 작성일 이름">
				<colgroup>
					<col width="80">
					<col width="*">
					<col width="100">
					<col width="180">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="th_title">글 번호</div>
						</th>
						<th>
							<div class="th_title">글 제목</div>
						</th>
						<th>
							<div class="th_title">작성자</div>
						</th>
						<th>
							<div class="th_title">글 작성일</div>
						</th>
					</tr>
				</thead>
	 			<tbody>
		<%-- <c:choose>
		<c:when test="${empty customerdto }">
			<tr>
				<td colspan="5">----------------내용이없습니다-------</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${customerdto }" var="dto">
					<tr>
						<td><div class="td_content">${dto.customer_no_seq }</div></td>
						<td><div class="td_content">${dto.customer_title }</div></td>					
						<td><div class="td_content">${dto.opt_id }</div></td>
						<td><div class="td_content"><fmt:formatDate value="${dto.customer_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></div></td>
					</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>			 --%>
		</tbody>	 
			</table>
		</div>	
	</div>
	<%-- <div class="paging">
			<ul class="paging_ul">
			<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
			<c:choose>
				<c:when test="${prevPage >0}">
					<li><a href="service.do?command=servicelist&page=${prevPage }">◀</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=servicelist&page=1">◀</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${absolutePage }" end="${endPage }" var="i">
				<c:choose>
				<c:when test="${i eq page}">
					<li><a href="service.do?command=servicelist&page=${i}">${ i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=servicelist&page=${i}">${ i }</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
			<c:choose>
				<c:when test="${nextPage < totalPage}">
					<li><a href="service.do?command=servicelist&page=${nextPage }">▶</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=servicelist&page=${totalPage}">▶</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	 --%>

	
	<div class="foot_wrap_area">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>