<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<style type="text/css">
	
	.user_table{	
    	
    	border-top-width: 2px;
    	
    	
	}
	

</style>

<script type="text/javascript">


	function addrChange(){
		window.open("addr.jsp", "", "width=300px; height=300px;" );		
	}

	

	function submit(){
		$('#form').submit();
	}

	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	

	$(document).ready(function(){
		
				
		var coupon = 0;
		var point = 0;
		var maxPoint = Number($("#point").attr("max"));
		var totalPrice = 0;
		
		for(var i=0; i<$("input[name=price]").length; i++){
			totalPrice += Number($("input[name=price]").eq(i).val()); 
		}				
		
		var postPrice = Number($("#postPrice").val());
		var totalPayment = totalPrice + postPrice;
		
		$("input[name=totalPrice]").val(totalPrice);
		$("#totalPrice").html(addComma(totalPrice) + "원");
		$("#totalPayment").html(addComma(totalPayment) + "원");
		$("#total").val(totalPayment - coupon - point);
		

		$("#point").change(function(){
					
			if($("#point").val() > maxPoint){
				alert("보유포인트를 초과하였습니다")
				$("#point").val(maxPoint);
				point = Number($("#point").val());			
				$("#totalPayment").html(addComma(totalPayment - coupon - point) + "원");
				$("#total").val(totalPayment - coupon - point);
			
			}else if($("#point").val() < 0){
				alert("숫자로만 입력해주세요!")
				$("#point").val(0);
				point = Number($("#point").val());				
				$("#totalPayment").html(addComma(totalPayment - coupon - point) + "원");
				$("#total").val(totalPayment - coupon - point);
				
			}else{
				point = Number($("#point").val());				
				$("#totalPayment").html(addComma(totalPayment - coupon - point) + "원");
				$("#total").val(totalPayment - coupon - point);
			}
		
		});
		
		
		$("#couponSelect").change(function(){
			
			if($("#couponSelect option:selected").val() == 0){
				$("#couponPrice").html("0원");
				coupon = 0;
				$("#totalPayment").html(addComma(totalPayment - coupon - point) + "원");
				$("#total").val(totalPayment - coupon - point);
			}else{
				$("#couponPrice").html("-"+addComma($(this).val())+"원");
				coupon = $(this).val();
				$("#totalPayment").html(addComma(totalPayment - coupon - point) + "원");
				$("#total").val(totalPayment - coupon - point);
			}
				
		});
		
		
		
	});
	

</script>


</head>
<body>

	<h1>결제하기</h1>
	<hr/>
	<br/>
	
	<h3>구매자 정보</h3>
	<hr/>
	<form action="item.do" method="post" id="form" onsubmit="return false;">
		<table class="user_table">
			<col width="200px" />
			<col width="200px" />
			<col width="200px" />	
			<tr>
				<td>이름</td>
				<td>${memdto.opt_name }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memdto.opt_email }</td>		
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memdto.opt_phone }</td>		
			</tr>
		</table>
		<br/>
		
		<h3>배송지 정보</h3>
		<hr/>
		<table class="user_table">
			<col width="200px" />
			<col width="200px" />
			<col width="200px" />
			<tr>
				<td>배송주소<input type="hidden" id="addrForm" name="addr" value="${memdto.opt_addr}"/></td>
				<td id="addr">${memdto.opt_addr}</td>
				<td><input type="button" value="배송지 변경" onclick="addrChange()"></td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td><input type="text" placeholder="30자 미만으로 적어주세요" maxlength="30" size="50"/></td>
			</tr>
		</table>
		<br/>
		
		<h3>상품 정보</h3>
		<hr/>
		<c:forEach items="${basketList}" var="dto">
		<table class="user_table">
			<col width="200px" />
			<col width="200px" />
			<col width="200px" />
			<tr>
				<td>상품이름</td>
				<td>${dto.basket_item_name }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${dto.basket_item_count }개</td>
			</tr>
			<tr>
				<td>가격<input type="hidden" name="price" value="${dto.basket_item_price * dto.basket_item_count }"></td>
				<td><fmt:formatNumber value="${dto.basket_item_price * dto.basket_item_count }" pattern="#,##0"/>원</td>				
			</tr>
		</table>
		<br/>
		</c:forEach>
		
		
		<h3>결제정보</h3>
		<hr/>
		<table class="user_table">
			<col width="200px" />
			<col width="200px" />
			<col width="200px" />
			<tr>
				<td>총상품가격<input type="hidden" name="totalPrice" value=""></td>
				<td id="totalPrice"></td>			
			</tr>
			<tr>
				<td>할인쿠폰</td>
				<td id="couponPrice">0원</td>
				<td>보유쿠폰 ${couponList.size() }장</td>
				<td>
					<select id="couponSelect">
						<option value="0">쿠폰을 선택해 주세요</option>
						<c:choose>
							<c:when test="${empty couponList }">
								<option value="0">사용가능한 쿠폰이 없습니다.</option>
							</c:when>
							<c:otherwise>
								<c:forEach items="${couponList }" var="couponDto">
									<option value="${couponDto.coupon_sale }">${couponDto.coupon_name }</option>						
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</select>			
				</td>
			</tr>
			<tr>
				<td>포인트</td>
				<td><input type="number" id="point" value="0" 	min="0" max="${memdto.opt_point }" placeholder="사용할 포인트를 적어주세요" onkeydown="javascript: return event.keyCode == 110 ? false : true" /></td>	
				<td>보유포인트 <fmt:formatNumber value="${memdto.opt_point }" pattern="#,##0"/>p </td>	
			</tr>
			<tr>
				<td>배송비</td>
				<td>2,500원 <input type="hidden" value="2500" id="postPrice"/></td>		
			</tr>
			<tr>
				<td>총결제금액</td>
				<td id="totalPayment"></td>
				<td><input type="hidden" value="" id="total"></td>		
			</tr>		  
		</table>
		<br/>
		<img alt="" src="image/kakaoPay.png" onclick="submit();"/>		
	</form>
	<br/>
	
	
	<%@ include file="./footer.jsp" %>

</body>
</html>