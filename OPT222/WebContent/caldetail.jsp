<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="css/calendardetail.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function goData(){
	var form = document.fr;
	form.submit();
    opener.location.reload();
    window.close();
}
function deleteData(idx){
	location.href="opt.do?command=cal_delete&idx="+idx;
	opener.location.reload();
	window.close();
}
</script>
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>
<body>
	<h1>일정상세</h1>
	
	<c:choose>
	<c:when test="${empty caldto }">
	</c:when>
		<c:otherwise>
			<form action="opt.do" method="post" name="fr">
			<input type="hidden" name="command" value="cal_update"/>
			<input type="hidden" name="idx" value="${caldto.calendar_no_seq }"/>
			
			<div class="cal_content">
			일정제목: <input type="text" name="cal_title" value="${caldto.calendar_title }"><br/>
    		일정시작일: <input type="text" id="datepicker" name="cal_start" value="${caldto.calendar_startday }"><br/>
    		일정종료일: <input type="text" id="datepicker2" name="cal_end" value="${caldto.calendar_enddate }"><br/>
    		일정등록일: <input type="text" name="cal_date" value="${caldto.calendar_regdate }"><br/>
    		</div>
    		<a href="#" onClick="goData();">일정수정하기</a>
    		<button onclick="deleteData(${caldto.calendar_no_seq});">삭제</button>
    		</form>
		</c:otherwise>		
	</c:choose>
<script>
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+3Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
            
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
   </script>

</body>
</html>