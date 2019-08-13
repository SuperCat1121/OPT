<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
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
	
	#costomer_text{
	width: 98%;
    margin: 0 auto;
    border-top: 1px solid #ebebeb;
    padding: 11px 0;
    margin-top: 18px;
    padding-left: 23px;
	}
	.costomer_img{
	width: 26px;
    height: 26px;
    background: url(./image/ico_q.png) no-repeat;
	}

	
	
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  //$("#costomer_text").hide();
	  // $("ul > li:first-child a").next().show();
	  $("#faq a").click(function(){
	    $(this).next().slideToggle(300);
	    // $(this).next().slideDown(300);
	    $("#faq a").not(this).next().slideUp(300);
	    return false;
	  });
	  $("#faq a").eq(0).trigger("click");
	});
	
</script>

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
			<table summary="글 번호 글 제목 글 작성일 이름" style="text-align: center;">
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
	 		<div class="costomer_list_div">
	 			<ul class="costomer_list_ul">
		<c:choose>
		<c:when test="${empty list }">
			<li>
				----------------내용이없습니다-------
			</li>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
					<li id="faq">
						<a href="#">
						<span class="costomer_span_one">${dto.faq_no_seq }</span>
						<span class="costomer_span_two"> ${dto.faq_title }</span>
						<span class="costomer_span_three">ADMIN</span>
						<span class="costomer_span_four"><fmt:formatDate value="${dto.faq_regdate }" pattern="yyyy-MM-dd" /></span></a>
					 	<div id="costomer_text">
					 	<div class="costomer_img"></div>
					 	<div class="text_area"><p class="cosutomer_textcontent">${dto.faq_content }</p></div>					 	
					 	</div>
					</li>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
			</ul>			
		</div>	
	</div>
	<div class="paging">
			<ul class="paging_ul">
			<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
			<c:choose>
				<c:when test="${prevPage >0}">
					<li><a href="service.do?command=faqlist&page=${prevPage }">◀</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=faqlist&page=1">◀</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${absolutePage }" end="${endPage }" var="i">
				<c:choose>
				<c:when test="${i eq page}">
					<li><a href="service.do?command=faqlist&page=${i}">${ i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=faqlist&page=${i}">${ i }</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
			<c:choose>
				<c:when test="${nextPage < totalPage}">
					<li><a href="service.do?command=faqlist&page=${nextPage }">▶</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="service.do?command=faqlist&page=${totalPage}">▶</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
	</div>
	
	<div class="foot_wrap_area">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>