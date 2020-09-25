<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">

<style>
.tabType1 {
	height: 50px;
	text-align: center;
	font-family: 'S-CoreDream-6Bold';
}

.tabType1 li {
	display: inline-block;
	width: 199px;
	height: 48px;
	margin-left: -4px;
	border: 1px solid #c4c4c4;
	border-left-width: 0;
}

.tabType1 li:first-child {
	margin-left: 0;
	border-left-width: 1px;
}

.tabType1 li a {
	display: block;
	height: 48px;
	text-align: center;
	line-height: 48px;
	font-size: 14px;
	color: #3A3847;
}

.tabType1 li.on {
	position: relative;
	border-color: #c4c4c4;
	background: #589168;
	color: #fff;
}

.fc-sat{color: #1187CF;}
.fc-sun{color: #B23535;}
</style>

</head>
<body>
	<ul class="tabType1 pl-0">
		<li class="on"><a id="employee">내 스케줄</a></li>
		<li><a id="employer">전체 스케줄</a></li>
	</ul>
	
	
	<div class="col-md-12 mt-3">
		<div id ="calWrap" class="wrapper px-md-4">
			<div id="calendar" class="build"></div>
			<div style="clear: both" class="build"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="${contextPath}/resources/js/calendar.js"></script>
	
	<script>
	

    $(document).ready(function() {
    		
   		//$("nav").removeClass("scrolled");
   		//$("nav").removeClass("awake");
    	// $(".ftco-navbar-light.scrolled").css("z-index", 9999);
    
	    	
	    var date = new Date();
	    var d = date.getDate();
	    var m = date.getMonth();
	    var y = date.getFullYear();
		
		var workUrl = "employeeCalendar";
		var calList = [];	
		cal();
		
		$("#employer").on("click", function(){
			$("#employee").parent().removeAttr("class")
			$("#employer").parent().attr("class", "on")
			
			$(".build").remove();
			$("#calWrap").append('<div id="calendar" class="build"></div><div style="clear: both" class="build"></div>');
			
			workUrl = "employerCalendar";
			cal();
		});
		
		$("#employee").on("click", function(){
			$("#employer").parent().removeAttr("class")
			$("#employee").parent().attr("class", "on")
			
			$(".build").remove();
			$("#calWrap").append('<div id="calendar" class="build"></div><div style="clear: both" class="build"></div>');
			
			workUrl = "employeeCalendar";
			cal();
		});
		
		// -----------------------------------------------------------------------------------
	  	 function cal() {
		
			// content
			 $.ajax({
					url : workUrl,
					dataType : "JSON",
					async : false,
					success : function(list){
						calList.length = 0;
						
						$.each(list, function(i){
							var year = list[i].workDay.toString().substring(0,4);
							var month = list[i].workDay.toString().substring(5,7) - 1;
							var day = list[i].workDay.toString().substring(8,10);
							var name = list[i].memberName;
							var startTime = list[i].workStart;
							var endTime = list[i].workEnd;
							var start = new Date(year, month, day, startTime, 0);
							var end = new Date(year, month, day, endTime, 0);
							var obj = {"title" : name ,"start" : start, "end" : end, "allDay" : false};
							
							calList.push(obj);
			        	});
						
					}, error : function(){
						console.log("ajax 통신 실패");
					}
				});
		  	
	
			 // fullCalendar
		      var calendar = $('#calendar').fullCalendar({
		        header: {
		          left: 'title',
		          center: 'agendaDay,agendaWeek,month',
		          right: 'prev,next today'
		        },
		        editable: false,
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
		        events: calList 
		      });
		 
	  	};

		// -----------------------------------------------------------------------------------
	
	});
	</script>

</body>
</html>