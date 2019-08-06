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
<title>상품 상세페이지</title>
<link href="css/item_detail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">


	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	
	$(document).ready(function(){
		
		var total = $('#price').val() * $('#ea').val();		
		$('#totalPrice').html(addComma(total));	
		
		$('#insertBasket').click(function(){
			var item_no = ${Itemdto.item_num_seq };
			var item_ea = $("#ea").val();
			var item_page = ${page };
			var item_name = "${Itemdto.item_name }";
			var item_price = ${Itemdto.item_price };
			var item_url = "${Itemdto.item_url }";
			var opt_no = 0 +0${memdto.opt_no_seq };
			

			if(opt_no == 0){
			
				location.href="login.jsp?Flag=3&itemno="+item_no+"&itempage="+item_page;
				
			}else{				
				
				if(confirm("장바구니에 담으시겠습니까?")){
					var url = "basket.do?command=basketinsert&opt_no=" + opt_no + "&item_no=" + item_no + "&item_ea=" + item_ea + "&item_price=" + item_price + "&item_name=" + item_name + "&item_url=" + item_url;
					$.ajax({
						type: "POST",
						url: url,
						dataType : "JSON",
						success : function(){
							alert("장바구니에 담겼습니다");
						},
						error: function(){
							alert("실패!");
						}
					});

				}else{
					return false;
				}
			}
		});
		
			
			
			

				
	});
	
	

	
	
	function submit(){
		$('#form').submit();
	}
	
	
	
	$(function(){
		$('#ea').change(function(){
			if($('#ea').val() <= 0){
				alert("수량을 1개이상 입력해주세요");
				$('#ea').val(1);
			}else if($('#ea').val() > 100){
				alert("최대 수량은 100개 입니다");
				$('#ea').val(100);
			}
					
			
			$('#totalPrice').html(addComma($('#price').val() * $('#ea').val()));
			
			
		});
	});




</script>

</head>
<body>
  
  	<jsp:include page="header.jsp"></jsp:include>

	<h1>상품 상세페이지</h1>
	
	<form action="item.do" method="post" id="form" onsubmit="return false;">
	<input type="hidden" name="command" value="payment">
	<input type="hidden" name="Flag" value="2">
	<input type="hidden" name="no" value="${Itemdto.item_num_seq }" />
	<input type="hidden" id="price" value="${Itemdto.item_price }" />
		<div>
			<ul>
				<li>
					<div>
						<div>
							<img alt="상품사진" src="${Itemdto.item_url }" width="500" height="500" />
						</div>
						<div>					
							<h3>${Itemdto.item_name } </h3>
							<a>${Itemdto.item_content }</a><br/>
							<a>수량 : </a> <input type="number" value="1" id="ea" name="ea" min="1" max="100" onkeydown="javascript: return event.keyCode == 110 ? false : true" /><br/>
							가격 : <strong id="totalPrice"></strong>원<br/>
							<a>view : ${Itemdto.item_views_no }</a><br/>
							<input type="button" value="구매하기" onclick="submit();"/>
							<input type="button" value="장바구니" id="insertBasket" />
							<input type="button" value="목록으로" onclick="location.href='item.do?command=itemlist&page=${page }'">
						</div>
					</div>									
				</li>
			</ul>
		</div>
	
	
	</form>

	<%@ include file="./footer.jsp" %>

</body>
</html>