<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 근무 스케줄</title>

<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

<style>
	#work-title{border-bottom: 3px solid #F5F4F0;}
	#notice{float: right; padding-top : 10px;}
</style>
</head>
<body>

	
	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container">

			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp" id="work-title">
					<span class="subheading">Work Schedule</span>
					<h2>근무 스케줄</h2>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="wrapper px-md-4">
						<div id='calendar'></div>
							<h6 id="notice">*스케쥴 변경은 근무관리에서 가능합니다.</h6>
						<div style='clear: both'></div>
						
					</div>
				</div>
			</div>
			
			</div>
	</section>
	
    <script type="text/javascript" src="${contextPath}/resources/js/calendar.js"></script>
    
<script>


    $(document).ready(function() {
      var date = new Date();
      var d = date.getDate();
      var m = date.getMonth();
      var y = date.getFullYear();
      /*  className colors
		
      className: default(transparent), important(red), chill(pink), success(green), info(blue)
		
      */
      
      
      
      /* initialize the external events
      -----------------------------------------------------------------*/
      $('#external-events div.external-event').each(function() {
        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };
        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);
        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 999,
          revert: true, // will cause the event to go back to its
          revertDuration: 0 //  original position after the drag
        });
      });
      /* initialize the calendar
      -----------------------------------------------------------------*/
		// 사장 따로, 알바따로 적용할 수 있게 만들 수 있지 않을까,,?
	
	var calList = [];		
	
	if(${loginMember.memberGrade== 'R'}){
  	  // 아이디가 사장님일 때
  	  console.log("m이다");
  	  
  	  
  	// 캘린더 값 얻어오는 ajax 
      // 동기로 해서 순서대로 읽을 수 있도록 만들고
      // 객체배열이니까 배열 변수 선언하고 그 안에 each 돌린 값 넣기
      // + month가 0-11 이여서 -1 
    	  $.ajax({
				url : "calendar/master/calendarView/",
				dataType : "JSON",
				async : false,
				success : function(list){
					console.log(list);
					$.each(list, function(i){
						var year = list[i].workDay.toString().substring(0,4);
						var month = list[i].workDay.toString().substring(5,7) - 1;
						var day = list[i].workDay.toString().substring(8,10);
						var name = list[i].memberName;
						var startTime = list[i].workStart;
						var endTime = list[i].workEnd;
					
						/* id: 999,
				            title: '리아',
				            start: new Date(y, m, 22, 16, 0),
				            end : new Date(y, m, 22, 16, 0)
				            allDay: false,
				            className: 'info'*/
						var start = new Date(year, month, day, startTime, 0);
						var end = new Date(year, month, day, endTime, 0);
						//var obj = {"year" : year, "month" : month, "day" : day, "name" : name, "startTime" : startTime, "endtTime" : endtTime };
						var obj = {"title" : name ,"start" : start, "end" : end, "allDay" : false};
						console.log(obj);
						
						
						
						calList.push(obj);
		        	});
					
				}, error : function(){
					console.log("ajax 통신 실패");
				}
			});
    }else{
  	  // 아이디가 알바생일 때
  	  console.log("a이다");
  	  
  	  
  	// 캘린더 값 얻어오는 ajax 
      // 동기로 해서 순서대로 읽을 수 있도록 만들고
      // 객체배열이니까 배열 변수 선언하고 그 안에 each 돌린 값 넣기
      // + month가 0-11 이여서 -1 
    	  $.ajax({
				url : "calendar/staff/calendarView/",
				dataType : "JSON",
				async : false,
				success : function(list){
					console.log(list);
					$.each(list, function(i){
						var year = list[i].workDay.toString().substring(0,4);
						var month = list[i].workDay.toString().substring(5,7) - 1;
						var day = list[i].workDay.toString().substring(8,10);
						var name = list[i].memberName;
						var startTime = list[i].workStart;
						var endTime = list[i].workEnd;
					
						/* id: 999,
				            title: '리아',
				            start: new Date(y, m, 22, 16, 0),
				            end : new Date(y, m, 22, 16, 0)
				            allDay: false,
				            className: 'info'*/
						var start = new Date(year, month, day, startTime, 0);
						var end = new Date(year, month, day, endTime, 0);
						//var obj = {"year" : year, "month" : month, "day" : day, "name" : name, "startTime" : startTime, "endtTime" : endtTime };
						var obj = {"title" : name ,"start" : start, "end" : end, "allDay" : false};
						console.log(obj);
						
						
						
						calList.push(obj);
		        	});
					
				}, error : function(){
					console.log("ajax 통신 실패");
				}
			});
    }
      
	
      
      
      
      $(function(){ 
	      // Ajax success 에 넣으면 될듯
	      var calendar = $('#calendar').fullCalendar({
	        header: {
	          left: 'title',
	          center: 'agendaDay,agendaWeek,month',
	          right: 'prev,next today'
	        },
	        editable: true,
	        firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
	        selectable: true,
	        defaultView: 'month',
	        axisFormat: 'h:mm',
	        columnFormat: {
	          month: 'ddd', // Mon
	          week: 'ddd d', // Mon 7
	          day: 'dddd M/d', // Monday 9/7
	          agendaDay: 'dddd d'
	        },
	        titleFormat: {
	          month: 'yyyy MMMM', // September 2009
	          week: "MMMM yyyy", // September 2009
	          day: 'MMMM yyyy' // Tuesday, Sep 8, 2009
	        },
	        allDaySlot: false,
	        selectHelper: true,
	       timeFormat : "H : mm",
	        droppable: true, // this allows things to be dropped onto the calendar !!!
	        drop: function(date, allDay) { // this function is called when something is dropped
	          // retrieve the dropped element's stored Event Object
	          var originalEventObject = $(this).data('eventObject');
	          // we need to copy it, so that multiple events don't have a reference to the same object
	          var copiedEventObject = $.extend({}, originalEventObject);
	          // assign it the date that was reported
	          copiedEventObject.start = date;
	          copiedEventObject.allDay = allDay;
	          // render the event on the calendar
	          // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
	          $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
	          // is the "remove after drop" checkbox checked?
	          if ($('#drop-remove').is(':checked')) {
	            // if so, remove the element from the "Draggable Events" list
	            $(this).remove();
	          }
	        },
	        events: calList /*[{
	            title: '예지',
	            start: new Date(y, m, 1)
	          },
	          {
	            id: 999,
	            title: '류진',
	            start: new Date(y, m, 1, 7, 0),
	            // 여기 년월일시간
	            // 연도는 내비두고, 디비에서 월, 일, 시간
	            allDay: false,
	            className: 'info'
	          },
	          {
	            id: 999,
	            title: '리아',
	            start: new Date(y, m, 22, 16, 0),
	            allDay: false,
	            className: 'info'
	          },
	          {
	        	id: 999,
	            title: '채령',
	            start: new Date(y, m, 30, 10, 30),
	            allDay: false,
	            className: 'info'
	          },
	          {
	            title: '유나',
	            start: new Date(y, m, 16, 12, 0),
	            end: new Date(y, m, 16, 14, 0),
	            allDay: false,
	            className: 'important'
	          },
	          {
	            title: 'Birthday Party',
	            start: new Date(y, m, 14, 19, 0),
	            end: new Date(y, m, 14, 22, 30),
	            allDay: false,
	          },
	          {
	            title: 'Click for Google',
	            start: new Date(y, m, 28),
	            end: new Date(y, m, 29),
	            url: 'https://google.com',
	            className: 'success'
	          }
	        ]*/
	      });
	    });
    });
    
    
  
</script>
  
  
  
</body>
</html>