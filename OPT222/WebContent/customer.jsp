<%@page import="com.opt.dto.AdminAnswerDto"%>
<%@page import="java.util.List"%>
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
	#costomer_text{
	width: 98%;
    margin: 0 auto;
    border-top: 1px solid #ebebeb;
    padding: 11px 0;
    margin-top: 18px;
    padding-left: 36px;
	}
	.costomer_img{
	width: 26px;
    height: 26px;
    background: url(./image/ico_q.png) no-repeat;
	}
	.answer_img{
	width: 26px;
    height: 26px;
    background: url(./image/ico_a.png) no-repeat;
	}
	#faq_div{
	cursor: pointer;
	}
	
	.coupon_list {
    height: 630px;
    margin-top: 30px;
	}
	.service_content_wrap {
    margin: 0 auto;
    padding-top: 10px;
    width: 1400px;
    height: 900px;
	}
	
	.paging{
		margin-top: 20px;
	}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    //$("#costomer_text").hide();
    // $("ul > li:first-child a").next().show();
    $("#faq #faq_div").click(function(){
      $(this).next().slideToggle(300);
      // $(this).next().slideDown(300);
      $("#faq #faq_div").not(this).next().slideUp(300);
      return false;
    });
    $("#faq #faq_div").eq(0).trigger("click");
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
				<a href="service.do?command=faqlist&page=1">자주묻는질문</a>
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
	 		<div class="costomer_list_div">
	 			<ul class="costomer_list_ul">
		<c:choose>
		<c:when test="${empty customerdto }">
			<li>
				----------------내용이없습니다-------
			</li>
		</c:when>
		<c:otherwise>
			<c:forEach items="${customerdto }" var="dto">
					<li id="faq">
						<div id="faq_div">
						<p class="costomer_p_one">${dto.customer_no_seq }</p>
						<p class="costomer_p_two"> ${dto.customer_title }</p>
						<p class="costomer_p_three"> ${dto.opt_id }</p> 
						<p class="costomer_p_four"><fmt:formatDate value="${dto.customer_regdate}" pattern="yyyy-MM-dd" /></p>
						</div>
					 	<div id="costomer_text">
					 	<div class="costomer_img"></div>
					 	<div class="text_area"><p class="cosutomer_textcontent">${dto.customer_content }</p></div>
					 	<div class="answer_area">
					 	<div class="answer_img"></div>
					 	<div class="answer_area"><p class="answer_textcontent">${dto.admin_answer_content }</div>
					 	</div>
					 	</div>
					</li>
			</c:forEach>
			</c:otherwise>
		</c:choose>			
			</ul>
			<input type="button" class="btn" value="글작성"	onclick="location.href='customerwrite.jsp'" />
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
	</div>
	
	<div class="foot_wrap_area">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>