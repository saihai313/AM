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

<!-- 배너 -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<style>
	#work-title{border-bottom: 3px solid #F5F4F0;}
	#notice{float: right; padding-top : 10px;}
	
	
	
	
body {margin:0;}
 #wrap {margin:0 auto;text-align:center;}
 #quick_bg {margin:0 auto;text-align:center;width:1400px;position:relative;}
 #quick {position:absolute;z-index:2;top:15px;width:153px;right:0px;}
 #containert {position:relative;}
 

 .one1{
 	    background-color: bisque;
 	        border-radius: 14px;
 	        padding: 10px;
 	        border: 2px solid lightgray;
 	        
 
 }
 
 .employee{
 	    margin: auto;
    width: 1200px;
 }
 
 #employee2{
 	    text-align: center;
    width: 100%;
 }
 
 .tdCss{
 	padding: 10px;
 }
 
 #emp{
 font-family: 'S-CoreDream-6Bold' !important;
 padding-left: 10px;
     margin-bottom: -20px;
 }
 
 #calendar{
 	    background-color: white;
 }
 
    
 .fc-sat{color:#0000FF;}
 .fc-sun{ color:#FF0000; }
.backColor{
	 background-image: url(${contextPath}/resources/images/배경2.png);
    background-repeat: no-repeat;
}
</style>
</head>
<body>
	 <div id="wrap">
	<div id="containert">
		<div id="quick_bg">
			<div id="quick">
			<a href="#form" style="position:fixed;margin-top:-350px"><img src="${contextPath}/resources/images/배너.jpg" style="width:200px"></a>
			</div>
		</div>
	</div>
</div>
	
	<!-- ------------------------- main ---------------------------- -->
	<hr>
	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container one1 backColor">

			<div class="row justify-content-center pb-5 ">
				<div class="col-md-7 heading-section text-center fadeInUp" id="work-title">
					<span class="subheading">Work Schedule</span>
					<h2>근무 스케줄</h2>
				</div>
			</div>

			<div class="row justify-content-center ">
				<div class="col-md-10">
					<div class="wrapper px-md-4">
						<div id='calendar'></div>
							<h6 id="notice">*스케쥴 변경은 근무관리에서 가능합니다.</h6>
							
						<div style='clear: both'></div>
						
					</div>
				</div>
			</div>
			
			</div>
			<hr>
			<c:if test="${loginMember.memberGrade eq  'R' }"></c:if>
							<div class="one1 employee">
								<h4 id="emp"><img src="${contextPath}/resources/images/전구.gif" style="width:80px;padding-bottom: 10px;">알바생 정보</h4>
								<hr>
								<div >
									<table id="employee2">
										<tr>
											<th>이름</th>
											<th>전화번호</th>
											<th>가입일</th>
										</tr>
										<tr>
										 <td colspan="3"><hr></td>
										</tr>
									</table>
								</div>
							
							</div>
	</section>
		<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-7 heading-section text-center fadeInUp">
          	<span class="subheading">Services</span>
            <h2>FOR EMPLOYER</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-4 d-flex align-items-stretch">
    				<div class="services-2 text-center">
    					<div class="icon-wrap">
    						<div class="number d-flex align-items-center justify-content-center"><span>01</span></div>
	    					<div class="icon d-flex align-items-center justify-content-center select1">
	    						<span class="flaticon-employee"></span>
	    					</div>
    					</div>
    					<h2 class="main-title">인사 관리</h2>
    					<p class="main-text">알바생 정보를<br>더 효율적으로 관리</p>
    				</div>
    			</div>
    			<div class="col-md-4 d-flex align-items-stretch">
    				<div class="services-2 text-center">
    					<div class="icon-wrap">
    						<div class="number d-flex align-items-center justify-content-center"><span>02</span></div>
	    					<div class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-calendar"></span>
	    					</div>
    					</div>
    					<h2  class="main-title">근무 관리</h2>
  						<p class="main-text">근무 스케줄러로<br>확인, 관리를 바로바로</p>
    				</div>
    			</div>
    			<div class="col-md-4 d-flex align-items-stretch">
    				<div class="services-2 text-center">
    					<div class="icon-wrap">
    						<div class="number d-flex align-items-center justify-content-center"><span>03</span></div>
	    					<div class="icon d-flex align-items-center justify-content-center">
	    						<span class="flaticon-checklist"></span>
	    					</div>
    					</div>
    					<h2  class="main-title">급여 관리</h2>
  						<p class="main-text">복잡한 급여 계산을<br>쉽고 편하게</p>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    <script type="text/javascript" src="${contextPath}/resources/js/calendar.js"></script>
    
<script>

// 여기 페이지 json이 인식되지않는다.
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
             console.log(JSON.parse(list));
           	 list = JSON.parse(list);
           	 // json으로 인식 못해서 json으로 만들어줌
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
   
   
       $.ajax({
		   url : "calendar/employeeList/",
	          dataType : "JSON",
	          async : false,
	          success : function(list){
	        	  console.log(JSON.parse(list));
	            	 list = JSON.parse(list);
	        	  
	        	  $.each(list, function(i){
	        	  console.log("알바생 정보 : " + list[i].memberName);
	        		  
	        	  /*
	        	  
	        							  <tr>
											<th>이름</th>
											<th>전화번호</th>
											<th>가입일</th>
										</tr>
	        	  
	        	  */
	        	  
	        		  $tr =$("<tr>");
	        		  $td1 = $("<td>").text(list[i].memberName).addClass("tdCss");
	        		  $td2 = $("<td>").text(list[i].memberPhone).addClass("tdCss");
	        		  $td3 = $("<td>").text(list[i].memberEnrollDate).addClass("tdCss");
	        		  
	        		  $tr.append($td1, $td2, $td3);
	        		  $("#employee2").append($tr);
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
         events: calList 
         /*
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
  


	
	//배너
    var quick_menu = $('#quick');
    var quick_top = 470;

    quick_menu.css('top', $(window).height() );
    $(document).ready(function(){
    quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 200 ); 
    $(window).scroll(function(){
    quick_menu.stop();
    quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
    });
    });
  
    

</script>
  
  
  
</body>
</html>