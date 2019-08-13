<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/customer.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style type="text/css">
	.foot_wrap_area{
		position: relative;
		top: 54px;
	}
	
	.td_text {
		width: 700px;
		height: 50px;
		border: 1px solid black;
	}
	
	.td_content:hover {
		cursor: pointer;
	}
	
	.td_text {
		display: none;
	}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  $("p").hide();
	  // $("ul > li:first-child a").next().show();
	  $("ul li a").click(function(){
	    $(this).next().slideToggle(300);
	    // $(this).next().slideDown(300);
	    $("ul li a").not(this).next().slideUp(300);
	    return false;
	  });
	  $("ul li a").eq(0).trigger("click");
	});
	
</script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>

	
	<div class="service_content_wrap">
		<h3>고객 QNA</h3>
	<div class="category_menu">
		<ul>
			<li>
				<a href="customer_often_FAQ.jsp">자주묻는질문</a>
			</li>
			<li>
				<a href="#">고객 QNA</a>
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
				</table>
	 			<ul>
		<c:choose>
		<c:when test="${empty customerdto }">
			<li>
				----------------내용이없습니다-------
			</li>
		</c:when>
		<c:otherwise>
			<c:forEach items="${customerdto }" var="dto">
					<li>
						<a href="#">${dto.customer_no_seq } ${dto.customer_title } ${dto.customer_title } ${dto.opt_id } <fmt:formatDate value="${dto.customer_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></a>
					 	<p>${dto.customer_content }</p>
					</li>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
		 <li>
		<input type="button" value="글작성"
							onclick="location.href='customerwrite.jsp'" />
			</li>				
							</ul>
		</div>	
	</div>
	<div class="paging">
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
	
	
	<div class="foot_wrap_area">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>