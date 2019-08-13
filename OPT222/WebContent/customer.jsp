<%@page import="java.sql.Date"%>
<%@page import="com.opt.dto.FaqDto"%>
<%@page import="com.opt.dto.CustomerServiceDto"%>
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
    padding-left: 23px;
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
<%
	List<CustomerServiceDto> customerList = (List)session.getAttribute("customerdto");	
	List<AdminAnswerDto> answerList = (List)session.getAttribute("answerList");
%>
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
<%
	if(customerList == null){
%>
			<li>
				----------------내용이없습니다-------
			</li>			
<%		
	}else{
		for(int i=0; i<customerList.size(); i++){
%>
			<li id="faq">
				<a id="qna_a" href="#">
				<span class="costomer_span_one"><%=customerList.get(i).getCustomer_no_seq() %></span>
				<span class="costomer_span_two"><%=customerList.get(i).getCustomer_title() %></span>
				<span class="costomer_span_three"><%=customerList.get(i).getOpt_id() %></span> 
				<span class="costomer_span_four"><fmt:formatDate value="<%=customerList.get(i).getCustomer_regdate() %>" pattern="yyyy-MM-dd" /></span></a>
			 	<div id="costomer_text">
			 	<div class="costomer_img"></div>
			 	<div class="text_area"><p class="cosutomer_textcontent"><%=customerList.get(i).getCustomer_content() %></p></div>			
<%			
			for(int j=0; j<answerList.size(); j++){
				if(answerList.get(j).getCustomer_no_seq() == customerList.get(i).getCustomer_no_seq()){
%>
				<div class="answer_area">
				<div class="answer_img"></div>
				<div class="answer_area"><p class="answer_textcontent"><%=answerList.get(j).getAdmin_answer_content() %></div>
				</div>			
<%					
				}
			}
%>
				</div>
			</li>
<%		
		
		}
	}
%>	 			

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