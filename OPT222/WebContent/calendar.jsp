<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='js/fullcalender/packages/core/main.css' rel='stylesheet' />
<link href='js/fullcalender/packages/daygrid/main.css' rel='stylesheet' />
<script src='js/fullcalender/packages/core/main.js'></script>
<script src='js/fullcalender/packages/interaction/main.js'></script>
<script src='js/fullcalender/packages/daygrid/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    today = yyyy+'-'+mm+'-'+dd;
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: today,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [//ajax 맵형태로 리턴하면 json 형태로됨
        {
          title: 'Dinner',
          start: '2019-06-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-06-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2019-06-28'
        }
      ]
    });

    calendar.render();
  });
	
  function popup(){
	window.open("calendar_popup.jsp","쿠폰함","width=500px,height=400px"); 
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