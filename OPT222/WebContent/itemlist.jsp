<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link href="css/item_list.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	

	$(document).ready(function(){
		
		for(var i=0; i<$('.price').length; i++){
			
			$('.commaPrice').eq(i).html(addComma($('.price').eq(i).val()));
			
		}		

	});

</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	
	<h1>상품페이지</h1>	
	
	<div class="item_list">
		<ul>
	
		<c:choose>
			<c:when test="${empty list }">				
					<li>
						<div>------등록된 상품이 없습니다------</div>
					</li>	
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
						<li>
							<div>
								<div>
									<a href="item.do?command=itemdetail&no=${dto.item_num_seq}&page=${page}"><img alt="" src="${dto.item_url}" width="270px" height="270px"/></a>
								</div>
								<div>
									<input type="hidden" class="price" value="${dto.item_price }"/>
									<h3>${dto.item_name }</h3>																		
									<strong class="commaPrice"></strong>원<br/>
									<a>view : ${dto.item_views_no }</a>									
								</div>
							</div>
						</li>								
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>
	</div>
	<table>
		<tr>
			<td>
				<c:set var="prevPage" value="${absolutePage-blockCount}"></c:set>
			<c:choose>
				<c:when test="${prevPage >0}">
					<a href="item.do?command=itemlist&page=${prevPage }">◀</a>
				</c:when>
				<c:otherwise>
					<a href="item.do?command=itemlist&page=1">◀</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${absolutePage }" end="${endPage }" var="i">
				<c:choose>
				<c:when test="${i eq page}">
					<a href="item.do?command=itemlist&page=${i}"><strong>[${ i }]</strong></a>
				</c:when>
				<c:otherwise>
					<a href="item.do?command=itemlist&page=${i}">[${ i }]</a>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${absolutePage+blockCount }"></c:set>
			<c:choose>
				<c:when test="${nextPage < totalPage}">
					<a href="item.do?command=itemlist&page=${nextPage }">▶</a>
				</c:when>
				<c:otherwise>
					<a href="item.do?command=itemlist&page=${totalPage}">▶</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</table>
	
	
	<form action="item.do?command=itemsearch&page=1" method="post">
	<table>
		<tr>
			<td>
				<select name="keyword">
					<option value="title">상품명</option>
					<option value="content">상품내용</option>
					<option value="titleContent">상품명+상품내용</option>					
				</select>
				<input type="text" name="msg" />
				<input type="submit" value="검색" />
			</td>
		</tr>
	</table>
	</form>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>