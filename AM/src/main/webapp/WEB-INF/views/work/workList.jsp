<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무 스케줄</title>

<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

<style>
	#work-title{border-bottom: 3px solid #F5F4F0;}
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
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
						<div style='clear: both'></div>
						
					</div>
				</div>
			</div>
			
			</div>
	</section>

	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
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
        select: function(start, end, allDay) {
          var title = prompt('Event Title:');
          if (title) {
            calendar.fullCalendar('renderEvent', {
                title: title,
                start: start,
                end: end,
                allDay: allDay
              },
              true // make the event "stick"
            );
          }
          calendar.fullCalendar('unselect');
        },
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
        events: [{
            title: '예지',
            start: new Date(y, m, 1)
          },
          {
            id: 999,
            title: '류진',
            start: new Date(y, m, 24, 16, 0),
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
        ],
      });
    });
</script>
  
</body>
</html>