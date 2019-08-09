$(function() {
	$("span").hover(function() {
		$("#itemCountWarning").toggle();
	},function() {
		$("#itemCountWarning").toggle();
	});
	
	// admin 페이지 로딩 시 .adminUserManagerPopup div 태그에 유저관리 로딩
	$(".adminUserManagerPopup").load("admin.do?command=adminUserManager&page=1");
	// 유저관리 클릭 시 무조건 첫 페이지로 로딩 (돌아다니던 div 페이지 안보이게 하고 다시 그거 보여지는 것 방지)
	$(".adminUserManager").eq(0).click(function() {
		$(".adminUserManagerPopup").load("admin.do?command=adminUserManager&page=1");
		$(".adminUserManagerPopup").fadeToggle(400).css("z-index", 2);
		$(".layer").toggle();
	});
	
	// admin 페이지 로딩 시 .adminItemManagerPopup div 태그에 상품관리 로딩
	$(".adminItemManagerPopup").load("admin.do?command=adminItemManager&page=1");
	// 상품관리 클릭 시 무조건 첫 페이지로 로딩 (돌아다니던 div 페이지 안보이게 하고 다시 그거 보여지는 것 방지)
	$(".adminItemManager").eq(0).click(function() {
		$(".adminItemManagerPopup").load("admin.do?command=adminItemManager&page=1");
		$(".adminItemManagerPopup").fadeToggle(400).css("z-index", 2);
		$(".layer").toggle();
	});
// ======================유저관리=======================================================================
	// 유저관리_수정버튼 누를 시 비동기 통신으로 update 실행
	$("body").on("click", ".userUpdate", function() {
		var id = $(this).parent().siblings().eq(0).text();
		var enabled = $(this).parent().siblings().eq(3).children().val();
		var role = $(this).parent().siblings().eq(5).children().val();
		$.ajax({
			url : "admin.do?command=adminUserUpdate",
			type : "POST",
			data : {"id" : id, "enabled" : enabled, "role" : role},
			dataType : "html",
			success : function(data) {
				alert(data);
			},
			error : function(request, status, error) {
				alert("유저 수정 실패");
				alert(request.status);
				alert(request.responseText);
				alert(status);
				alert(error);
			}
		});
	});
	// 유저관리_x 표시 누르면 팝업 닫힘
	$("body").on("click", "#userManagerPopupClose", function() {
		$(".adminUserManagerPopup").fadeToggle(400);
		$(".layer").toggle();
	});
	// 유저관리_페이지 클릭 시 그 페이지로 이동
	$("body").on("click", ".userPage", function() {
		var movePage = $(this).text();
		$(".adminUserManagerPopup").load("admin.do?command=adminUserManager&page="+ movePage);
	});
// ===================상품관리=======================================================================
	var nowpage = 1;
	// 상품관리 수정 버튼 누르면 상품정보 수정 창 생
	$("body").on("click", ".itemUpdate", function() {
		var item_num_seq = $(this).parent().siblings().eq(0).text();
		var item_name = $(this).parent().siblings().eq(1).text();
		var item_price = $(this).parent().siblings().eq(2).text();
		var item_content = $(this).parent().siblings().eq(3).text();
		window.open("admin.do?command=adminItemUpdate&item_num_seq="+item_num_seq+"&item_name="+item_name+"&item_price="
				      +item_price+"&item_content="+item_content+"&page="+nowpage,"", "width=500,height=600,top=300,left=600");
	});	
	// 상품관리 팝업 x 표시 누르면 팝업 닫힘
	$("body").on("click", "#itemManagerPopupClose", function() {
		$(".adminItemManagerPopup").fadeToggle(400);
		$(".layer").toggle();
	});
	// 상품관리_페이지 클릭 시 그 페이지로 이동
	$("body").on("click", ".itemPage", function() {
		var movePage = $(this).text();
		$(".adminItemManagerPopup").load("admin.do?command=adminItemManager&page=" + movePage);
	});
	// 상품관리_페이지 클릭 시 변수에 저장
	$(".content_area").on("click", "a", function() {
		nowpage = $(this).text();
	});
});
















