<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<link href="css/fullcalender/fullcalendar.css" rel="stylesheet"/>
<link href="css/fullcalender/fullcalendar.print.css" rel="stylesheet"/>
<link href="css/fullcalender/scheduler.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/fullcalender/calendar.js"></script>
<script type="text/javascript" src="js/fullcalender/moment.min.js"></script>
<script type="text/javascript" src="js/fullcalender/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/fullcalender/scheduler.min.js"></script>
<script>
  function popup(){
	window.open("calendar_popup.jsp","일정등록","width=600px,height=400px"); 
  }
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

	<h1>일정관리</h1>
	<button onclick="popup();">일정등록</button>
  <div id='calendar'></div>

</body>
</html>