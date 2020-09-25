<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">

<style>
#work-title{border-bottom: 3px solid #F5F4F0;}
.fc-sat{color: #1187CF;}
.fc-sun{color: #B23535;}
</style>
</head>
<body>

	<div class="col-md-10 mx-auto">
		<div class="wrapper px-md-4">

			<div id='calendar'></div>
			<div style='clear: both'></div>
			
		</div>
	</div>
	
	<script>


	    $(document).ready(function() {
	      var date = new Date();
	      var d = date.getDate();
	      var m = date.getMonth();
	      var y = date.getFullYear();

	      
	      
	      
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
	  	  
	  	// 캘린더 값 얻어오는 ajax 
	      // 동기로 해서 순서대로 읽을 수 있도록 만들고
	      // 객체배열이니까 배열 변수 선언하고 그 안에 each 돌린 값 넣기
	      // + month가 0-11 이여서 -1 
	   	  $.ajax({
				url : "work/mainCalendar",
				dataType : "JSON",
				async : false,
				success : function(list){
					
					$.each(list, function(i){
						var year = list[i].workDay.toString().substring(0,4);
						var month = list[i].workDay.toString().substring(5,7) - 1;
						var day = list[i].workDay.toString().substring(8,10);
						var name = list[i].memberName;
						var startTime = list[i].workStart;
						var endTime = list[i].workEnd;
						var start = new Date(year, month, day, startTime, 0);
						var end = new Date(year, month, day, endTime, 0);
						var obj = {"start" : start, "end" : end, "allDay" : false};

						calList.push(obj);
		        	});
					
				}, error : function(){
					console.log("ajax 통신 실패");
				}
			});
	      
	      
	      $(function(){ 
		      var calendar = $('#calendar').fullCalendar({
		        header: {
		          left: '',
		          center: '',
		          right: 'dayGridWeek listWeek'
		        },
		        contentHeight: 400, // 달력 세로크기
		        aspectRatio: 1.8, // 달력 가로세로 비율
		        editable: false,
		        firstDay: 1, 
		        selectable: false,
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
		        selectHelper: false,
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
		        events: calList 
		      });
		    });
	      
	     
	    });
	</script>

</body>
</html>