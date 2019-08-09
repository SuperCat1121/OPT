<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">


function allChk(bool){
	//$("selector").each();
	$("input[name=chk]").each(function(i){
		$(this).prop("checked",bool);
	
	});
}

	function muldel(){
		if($("#multiDelForm input:checked").length == 0){
			alert("하나 이상 체크해 주세요!!");
			return false;
		}else{
			
			myform.action="basket.do?command=basketmuldel"
			myform.submit();
		}
		
	}
		
	
	function basketPayment(){
		
		if($("#multiDelForm input:checked").length == 0){
			alert("하나 이상 체크해 주세요!!");
			return false;
		}else{			
			
			var arr = new Array();
			
			for(var i=0; i < $("input[name=chk]:checked").length; i++ ){			
				
				arr.push($("input[name=chk]:checked").eq(i).parent().siblings().eq(3).children().val());
			
			}
			
			
			myform.action="item.do?command=basketpayment&countarr="+arr;
			myform.submit();
		}
	}
	
	
	
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}
	


	$(function(){
		$('.ea').change(function(){
			
			if($(this).val() <= 0){
				alert("수량을 1개이상 입력해주세요");
				$(this).val(1);
			}else if($(this).val() > 100){
				alert("최대 수량은 100개 입니다");
				$(this).val(100);
			}				
			
			$(this).parent().siblings().eq(4).children().html(addComma($('.price').val() * $(this).val())+"원");
			
		});
		
	});





	</script>
</head>
<body>

	<h1>장바구니</h1>

<form action="basket.do" method="post" name="myform" id="multiDelForm" onsubmit="return false;">

		<table border="1">

			<tr>
				<th>전체선택<input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
				<th width="200">장바구니 번호</th>
				<th width="200">상품이미지</th>
				<th width="200">상품명</th>
				<th width="200">수량</th>
				<th width="200">상품금액</th>
				

			</tr>

			<c:choose>
				<c:when test="${empty basketList}">
					<tr>
						<td colspan="6" style="text-align: center;">장바구니가 비어있습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${basketList }" var="dto">
					
					<input type="hidden" value="${dto.basket_item_no }" name="no">
					<input type="hidden" class="price" value="${dto.basket_item_price }" />
						<tr>
							<td><input type="checkbox" onclick="" name="chk"
								value="${dto.basket_no_seq }"></td>
							<td>${dto.basket_no_seq }</td>
							<td><a href="item.do?command=itemdetail&no=${dto.basket_item_no }&page=1"><img
									alt="" src="${dto.basket_item_url }" width="100" height="100" ></a></td>
							<td>${dto.basket_item_name }</td>
							<td><input type="number" style="width: 40px" id="ea" class="ea"
								value="${dto.basket_item_count }"  min="1" max="100" onkeydown="javascript: return event.keyCode == 110 ? false : true"></td>
							<td><strong id="totalPrice" class="totalPrice"><fmt:formatNumber value="${dto.basket_item_price * dto.basket_item_count }" pattern="#,##0" />원</strong></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td>
					<input type="button" value="구매하기" id="payment" onclick="basketPayment();" />
					<input type="button" value="삭제하기" id="delete" onclick="muldel();" />					
				</td>
			</tr>
		</table>
	</form>

<input type="button" value="상품목록" id="List" onclick="location.href='item.do?command=itemlist&page=1'">
</body>
</html>