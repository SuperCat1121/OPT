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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>상품 상세페이지</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
			var opt_no = 0 + 0${memdto.opt_no_seq };
			
			
			
			

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
		
		var url = "http://naver.com";
		 //<![CDATA[
	    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('bb4c1bf59ae19585b6f94728945e9eef');
	    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	    Kakao.Link.createDefaultButton({
	      container: '#kakao-link-btn',
	      objectType: 'commerce',
	      content: {
	        title: '${Itemdto.item_name }',
	        imageUrl: 'https://lh3.googleusercontent.com/uQSd9OlkLSjc9_Lm5QtO4QNdGUV6clWZyZhV0zAtGAd6U29WoebM8CDW-v40RF9Si2lwgDUjQRiooRWuLsScF2gCzfpwizXgJ3zx83jvku0x9K9fa_TrVyPB-l9GOSmVhVfYyyKCUDcOUiVaedqiuErAQg3QU2VscQdLYxzu1LSMUaIM4A2sC9g7cYwsNcAcARkOdZwuwLgpmTTwSmZztNj1lw2olgnHOFjknhswPnSJJ-U9EVP4cP186Fe-cqLYzS6-DY-TbGJAOmFGxyOrTSqP222ZpA_ISzJsFN_U-OpB0Gh1V_PZvagt7s6cwudohiAmqPgHsZHF7LEo9vqfdXYND9X_ICkFT2hOtc2WhmSI8hHWAmbr89aaA_POJm_oAhQzKlRoiDTlNbGzP9s2Db_j6cRc0B5PmEtPhQqrMrWcsHKRgtJN8A7ssbAHE9EVCUzUic4ei1SoeGL-n2WVsNcxT_KwFYFjZxUm-PInNRpCmPT8-XbaH2fs2Hy2qoHfimlhNpEbm5AVoCL7dmNmqH8n4af25CoAIUnBXxz1WhRxMe_uwczkuaFMF3JAAQAsVrNYrJl2TvPvc5kuUco57ZMKcOzv50P8Xh-gYYTUFJczrAgpF8Ct95zKADwh1iHiGlVWWAbEKK9TAlAp8Nolvht5V15YO6OQW_gPHNJWaJnKzH31OcGpd0E2dajrC6E0WjJP6_TQP1eotuAtApAAjPQ=w200-h80-no',
	        link: {
	          mobileWebUrl: url,
	          webUrl: url
	        }
	      },
	      commerce: {
	        regularPrice: ${Itemdto.item_price }
	      },
	      buttons: [
	        {
	          title: '구매하기',
	          link: {
	            mobileWebUrl: url,
	            webUrl: url
	          }
	        },
	        {
	          title: '공유하기',
	          link: {
	            mobileWebUrl: url,
	            webUrl: url
	          }
	        }
	      ]
	    });
	  //]]>
			
			

				
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
							<h3>${Itemdto.item_name } <a id="kakao-link-btn" href="javascript:;">
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
							</a></h3>
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