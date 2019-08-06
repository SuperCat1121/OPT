$(function() {
	$("span").hover(function() {
		$("#itemCountWarning").toggle();
	},function() {
		$("#itemCountWarning").toggle();
	});
	
	$(".adminUserManagerPopup").load("admin.do?command=adminUserManager");
	$(".adminUserManager").eq(0).click(function() {
		$(".adminUserManagerPopup").fadeToggle(400).css("z-index", 2);
		$(".layer").toggle();
	});
	
	$(".adminItemManagerPopup").load("admin.do?command=adminItemManager");
	$(".adminItemManager").eq(0).click(function() {
		$(".adminItemManagerPopup").fadeToggle(400).css("z-index", 2);
		$(".layer").toggle();
	});
});