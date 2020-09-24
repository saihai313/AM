<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무 스케줄</title>

<!-- 아이콘 등록 -->
<link rel="icon" type="image/png" href="${contextPath}/resources/images/icons/am.ico"/>

<link rel="stylesheet" href="${contextPath}/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>




<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 



<style>
	#work-title{border-bottom: 3px solid #F5F4F0;}
	
	#notLogin{
		width: 100%;
		height: 800px;
		line-height: 600px;
		text-align: center;
	}
	
	.part{
		float: right;
    margin-right: 10px;
	}
	
	.pix{
		float: right;
	}
	
	.pageBtn{
		    width: 90%;
    		margin-top: 20px;
	}
	
	
	
	
	
	      #my_modal {
                display: none;
                width: 400px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 18px;
            }

            #my_modal .modal_close_btn, #my_modal2 .modal_close_btn{
                position: absolute;
                top: 10px;
                right: 10px;
            }
            
             #my_modal2 {
                display: none;
                width: 400px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 18px;
            }
            
        #deleteBtn{
        	display: none;
        }
        
        
 .one1{
 	    background-color: bisque;
 	        border-radius: 14px;
 	        padding: 10px;
 	        border: 2px solid lightgray;
 	        height: 950px;
 }
 
 .timeCss{
 	    margin-left: 50px;
 }

#noticeBoard{
	width: 1100px;
	margin: auto;
	padding: 30px;
	border: 1px solid;
	margin-bottom: 50px;
	border-radius: 10px;
	font-family: 'S-CoreDream-6Bold' !important;
}

body {margin:0;}
 #wrap {margin:0 auto;text-align:center;}
 #quick_bg {margin:0 auto;text-align:center;width:1400px;position:relative;}
 #quick {position:absolute;z-index:2;top:15px;width:153px;right:0px;}
 #containert {position:relative;}
 
 .news{
     width: 550px;
 }
 
 .newsA{
 	border-bottom: 1px solid;
 	font-size: 15px;
 }
 
 .newsA:hover{
 	color: #184424;
 }
 
  #calendar{
 	    background-color: white;
 }
 
 .btns{
    margin-bottom: 10px;
 }
 
 .updateBtn{
 	margin-left: 120px;
 }
 
 .insetBtn{
 margin-left: 140px;
 margin-bottom: 10px;
 }
 
  .fc-sat{color:#0000FF;}
 .fc-sun{ color:#FF0000; }
 
 #partDiv{
    text-align: center;
 }
 
 #partTimeDiv{
	width: 500px;
	margin: auto;
	padding: 30px;
	border: 1px solid;
	margin-bottom: 50px;
	border-radius: 10px;
	font-family: 'S-CoreDream-6Bold' !important;
	display: inline-block;
	overflow-y: scroll;
	    height: 476px;
}

#noti{
	width: 500px;
	margin: auto;
	
	margin-bottom: 50px;
	border-radius: 10px;
	font-family: 'S-CoreDream-6Bold' !important;
	display: inline-block;
	
}

.backColor{
	 background-image: url(${contextPath}/resources/images/배경2.png);
    background-repeat: no-repeat;
}
</style>
</head>
<body>
	
	


	 	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- ------------------------- main ---------------------------- -->
	
	 <div id="wrap">
	<div id="containert">
		<div id="quick_bg">
			<div id="quick">
			<a href="#form" style="position:fixed;margin-top:-350px"><img src="${contextPath}/resources/images/배너.jpg" style="width:200px"></a>
			</div>
		</div>
	</div>
</div>
	
	
	
	<c:choose>
		<c:when test="${empty loginMember }">
		<!--  로그인 x -->
		<div id="notLogin">로그인 후 이용해주세요</div>
		</c:when>
		
		<c:when test="${!empty loginMember.memberName }">
		<!-- 로그인 o -->
		
	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container one1 backColor">

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
				<div class="pageBtn">
				<%-- <a class="btn btn-primary pix"  href="${contextPath}/calendar/pixSchedule">고정스케쥴 등록</a>--%>
			
				</div>
			</div>
	</section>


	<!-- 파트타임 -->	

	<div id="partDiv">
	<div id="partTimeDiv">
		<span><h3>더 편한 근무관리를 위해!</h3>
		<h6> 파트타임 설정으로 편리하게 입력|수정하세요.</h6></span>
		<hr>
		
		
			<c:forEach var="partTime" items="${pList}">
				<!--  
					시간이 10미만이면 0을 붙이고 10이상이면 그대로 변수저장
				 -->
		
					
					
				<h6>${partTime.partName}[${partTime.partStart}:00 ~ ${partTime.partEnd}:00]</h6>
						<hr>
						</c:forEach>
	</div>					
	<div id="noti">
		<a href="${contextPath}/calendar/partTime"><img alt="" src="${contextPath}/resources/images/파트타임.png" style="float: left;width: 100%;border-radius: 10px;"></a>
	

</div>
</div>


	<!-- -------------------------------------- -->


	<div id="noticeBoard">
	<div style=" width: 50%; display: inline-block;">	<h3>뉴스 소식
	<img src="${contextPath}/resources/images/new.gif" style="width:40px; padding-bottom: 10px;">
	</h3>
	<hr>
		<table style="width: 100%;">
		
			<c:forEach items="${nList}" var="n">
			<tr>
				<th class="news"><a class="newsA" href="${n.address}">${n.title}</a></th>
			</tr>
			</c:forEach>
		
			
		</table>
		</div>
	
		<div style="width: 40%; display: inline-block;">
			<h3>생활 소식
	<img src="${contextPath}/resources/images/new.gif" style="width:40px; padding-bottom: 10px;">
	</h3>
	<hr>
		<table style="width: 100%;">
		
			<c:forEach items="${n2List}" var="n">
			<tr>
				<th class="news"><a class="newsA" href="${n.address}">${n.title}</a></th>
			</tr>
			</c:forEach>
		
			
		</table>
		</div>
	</div>
	
	<!-- 
		1. 날짜 눌렀을 때 모달창 나오기
		2. 년, 월, 일  값 가져오기
		3. 알바생 목록 가져오기
		4. 파트타임 가져오기
		
		5. 확인(insert) 버튼 눌렀을 때  값 넘어가기
		6. 넘겨진 값 확인하기 
	 -->



	<!-- 삽입 모달 -->
	<div id="my_modal">
		<c:choose>
			<c:when test="${empty eList}">
				<h4>알바생 없음</h4>
			</c:when>
			
			<c:otherwise>
	          <form class="form-signin" method="POST" action="${contextPath}/calendar/insertCalendar" name='insertCalendarForm' onsubmit="return validate();"
	          	 style="text-align: ; padding-top: 40px;  padding-left: 10px;">
	          <!-- onsubmit="return validate();"  -->
					근무자 : <select id="no" name="memberNo">
			<c:forEach var="member" items="${eList}">
					<option value="${member.memberNo}">${member.memberName}</option>
			
			</c:forEach>
				</select> <br>
			
						part 선택 :
							
						 <select id="time" name="time">
						<c:forEach var="partTime" items="${pList}">
							<!--  
								시간이 10미만이면 0을 붙이고 10이상이면 그대로 변수저장
							 -->
						<c:if test="${partTime.partStart <10}">
						 <c:set var="start" value="0${partTime.partStart}"/>								
						</c:if>
						
						<c:if test="${partTime.partStart >=10}">
						 <c:set var="start" value="${partTime.partStart}"/>								
						</c:if>
						
						<c:if test="${partTime.partEnd <10}">
						 <c:set var="end" value="0${partTime.partEnd}"/>								
						</c:if>
						
						<c:if test="${partTime.partEnd >=10}">
						 <c:set var="end" value="${partTime.partEnd}"/>								
						</c:if>
								
								
							<option value="${partTime.partName}[${start}:00 ~ ${end}:00]" value2="${start}${end}">
									${partTime.partName}[${start}:00 ~ ${end}:00]</option>
							
						</c:forEach>
						</select> 
						
						
						<c:if test="${pList[0].partStart <10}">
						 <c:set var="start" value="0${pList[0].partStart}"/>								
						</c:if>
						
						<c:if test="${pList[0].partStart >=10}">
						 <c:set var="start" value="${pList[0].partStart}"/>								
						</c:if>
						
						
						<c:if test="${pList[0].partEnd <10}">
						 <c:set var="end" value="0${pList[0].partEnd}"/>								
						</c:if>
						
						<c:if test="${pList[0].partEnd >=10}">
						 <c:set var="end" value="${pList[0].partEnd}"/>								
						</c:if>
						
						<input type="time" class="timeCss" id="timeS"  value="${start}:00"> ~ <input type="time" id="timeE"value="${end}:00">
						<br>
			
				<div class="checkbox mb-3">
					
				</div>
				<button class="btn btn-lg btn-primary insetBtn"  type="submit">등록</button>
			</form>
			</c:otherwise>
		</c:choose>
								
								
            <a class="modal_close_btn">닫기</a>
        </div>

  <%--      <button id="popup_open_btn">팝업창 띄어 줘염</button> --%>
	
	<!-- ------------------------------------------------------------------------------------------------- -->
	
	<!-- 수정, 삭제 모달 -->
	<div id="my_modal2">
		<c:choose>
			<c:when test="${empty eList}">
				<h4>알바생 없음</h4>
			</c:when>
			
			<c:otherwise>
	      
	          <form class="form-signin" method="POST" action="${contextPath}/calendar/updateCalendar" name='updateCalendarForm' onsubmit="return validate2();" 
	          style="text-align: ; padding-top: 30px;  padding-left: 10px;">
	          <!-- onsubmit="return validate();"  -->
					근무자 : <select id="updateNo" name="memberNo">
			<c:forEach var="member" items="${eList}">
					<option value="${member.memberNo}" value2="${member.memberName}">${member.memberName}</option>
			
			</c:forEach>
				</select> <br>
			
						part 선택 : <select id="updateTime" name="time">
						<option vlaue="not">-----------------</option>
						<c:forEach var="partTime" items="${pList}">
							<!--  
								시간이 10미만이면 0을 붙이고 10이상이면 그대로 변수저장
							 -->
						<c:if test="${partTime.partStart <10}">
						 <c:set var="start" value="0${partTime.partStart}"/>								
						</c:if>
						
						<c:if test="${partTime.partStart >=10}">
						 <c:set var="start" value="${partTime.partStart}"/>								
						</c:if>
						
						
						<c:if test="${partTime.partEnd <10}">
						 <c:set var="end" value="0${partTime.partEnd}"/>								
						</c:if>
						
						<c:if test="${partTime.partEnd >=10}">
						 <c:set var="end" value="${partTime.partEnd}"/>								
						</c:if>
						
								
								
							<option value2="${start}${partTime.partEnd}" 
									value="${partTime.partName}[${start}:00 ~ ${end}:00]">
									${partTime.partName}[${start}:00 ~ ${end}:00]</option>
							
						</c:forEach>
						
						<%-- 
						<option value2="1016" value='part1 [10:00 ~ 16:00]'>part1 [10:00 ~ 16:00]</option>
						<option value2="1422" value='part2 [14:00 ~ 22:00]'>part2 [14:00 ~ 22:00]</option>
						--%>
						</select> 
						
						<c:if test="${pList[0].partStart <10}">
						 <c:set var="start" value="0${pList[0].partStart}"/>								
						</c:if>
						
						<c:if test="${pList[0].partStart >=10}">
						 <c:set var="start" value="${pList[0].partStart}"/>								
						</c:if>
						
						
						<c:if test="${pList[0].partEnd <10}">
						 <c:set var="end" value="0${pList[0].partEnd}"/>								
						</c:if>
						
						<c:if test="${pList[0].partEnd >=10}">
						 <c:set var="end" value="${pList[0].partEnd}"/>								
						</c:if>
						
						<input type="time" class="timeCss" id="timeS2"  value="${start}:00"> ~ <input type="time" id="timeE2" value="${end}:00">
						
						<br>
			
			
			
			
			
			
				<div class="checkbox mb-3">
					
				</div>
				<button class="btn btn-lg btn-primary btns updateBtn" type="submit">수정</button>
				<button class="btn btn-lg btn-primary btns" onclick="deleteBtn()" type="button" >삭제</button>
				    <h6 style="font-size: 13px;">*동일한 파트타임이 존재하지 않아도 정상 삭제 가능</h6>
			</form>
				<form class="form-signin " method="POST" action="${contextPath}/calendar/deleteCalendar" name='deleteCalendarForm' onsubmit="return validate3();">
				<button class="btn btn-lg btn-primary " id="deleteBtn" type="submit" >삭제</button>
				</form>
			</c:otherwise>
		</c:choose>
								
								
            <a class="modal_close_btn">닫기</a>
        </div>










<!-- ------------------------------------------------------------------------------------------- -->	
	
     <script type="text/javascript" src="${contextPath}/resources/js/calendar.js"></script>
    
<!-- ------------------------------------------------------------------------------------------- -->	
  
    
<script>
function deleteBtn(){
	
	$("#deleteBtn").trigger("click");
}

	

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
	  	  console.log("사장이다");
	  	  
	  	 
	  	// 캘린더 값 얻어오는 ajax 
	      // 동기로 해서 순서대로 읽을 수 있도록 만들고
	      // 객체배열이니까 배열 변수 선언하고 그 안에 each 돌린 값 넣기
	      // + month가 0-11 이여서 -1 
	    	  $.ajax({
					url : "master/calendarView/",
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
							var workNo = list[i].workNo;
							/* id: 999,
					            title: '리아',
					            start: new Date(y, m, 22, 16, 0),
					            end : new Date(y, m, 22, 16, 0)
					            allDay: false,
					            className: 'info'*/
					            
					            
					            if(endTime == 0){
					            	endTime = 24;
					            }
							var start = new Date(year, month, day, startTime, 0);
							var end = new Date(year, month, day, endTime, 0);
							//var obj = {"year" : year, "month" : month, "day" : day, "name" : name, "startTime" : startTime, "endtTime" : endtTime };
							var obj = {"title" : name ,"start" : start, "end" : end, "allDay" : false, "color" : "#"+Math.round(Math.random()*0xffffff).toString(16)};
							
						/*
							color:"#"+Math.round(Math.random()*0xffffff).toString(16),
		                      textColor: "white"
		                      
		                    	  */
							console.log(obj);
							
							
							
							calList.push(obj);
							
							
							
							
							
							
							$workNo =$("<input>", {type : "hidden", name : "workNo", 
								value : list[i].workNo});
							
							console.log("일번호 " + list[i].workNo);
							
							$("form[name='updateCalendarForm']").append($workNo);
			        	});
						
					}, error : function(){
						console.log("ajax 통신 실패");
					}
				});
	    }else{
	  	  // 아이디가 알바생일 때
	  	  console.log("알바생이다");
	  	  
	  	  
	  	// 캘린더 값 얻어오는 ajax 
	      // 동기로 해서 순서대로 읽을 수 있도록 만들고
	      // 객체배열이니까 배열 변수 선언하고 그 안에 each 돌린 값 넣기
	      // + month가 0-11 이여서 -1 
	    	  $.ajax({
					url : "staff/calendarView/",
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
      
	
	// 클릭한 날의 년,월,일 변수
	var clickYear = 0;
	var clickMonth = 0;
	var clickDay = 0;
	//var addDay = "2020-09-22샘플";
	
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
	        select: function(start, end, allDay, month) {
	        	
	        	test2(start);
	        	console.log("시간" + start.toString());
	        	console.log(start.toString().substr(11, 4));
	        	// 선택한 날짜 나옴

	        	// 년
	        	clickYear = (start.toString().substr(11, 4));
	        	
	        	// 일
	        	clickDay =  (start.toString().substr(8, 2));
	        	
	        	switch(start.toString().substr(4, 3)){
	        	case "Jan" : clickMonth = '01'; break;
	        	case "Feb" : clickMonth = '02'; break;
	        	case "Mar" : clickMonth = '03'; break;
	        	case "Apr" : clickMonth = '04'; break;
	        	case "May" : clickMonth = '05'; break;
	        	case "Jun" : clickMonth = '06'; break;
	        	case "Jul" : clickMonth = '07'; break;
	        	case "Aug" : clickMonth = '08'; break;
	        	case "Sep" : clickMonth = '09'; break;
	        	case "Oct" : clickMonth = '10'; break;
	        	case "Nov" : clickMonth = '11'; break;
	        	case "Dec" : clickMonth = '12'; break;
	        	}
	        	
	        	var addDay = clickYear + "-" + clickMonth + "-" + clickDay;
	        	console.log(addDay);
	        	
	        	createAddDay(addDay);
	        	
	         
	        },
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
	        eventRender: function (event, element) {
	        	// 일정을 클릭했을 때 나옴
	            element.attr('href', 'javascript:void(0);');
	            element.click(function() {
	               //alert(event.title + "\n" +  event.start +"\n" + event.end);
	            
	               
	              // alert("업데이트 맞음" + event.title);
	               
	              
	             console.log("없데이트 일번호" +  $("input[name=workNo]").val());
	             console.log("업데이트 시작 시간" +  event.start);
	              
	              test3(event.title, event.start, event.end);
	               
	               
	               
	               
	               //modal('my_modal2');
	               // 모달로 이동
	            });
	        },
	        events: calList 
	          /*{
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
    
    // workDay 변수에 가져오기
    var workDay;
    function createAddDay(addDay){
    	workDay = addDay;
    }
    
    
    
    function test2(day){
    	
    	// 클릭한 날짜
    	console.log(typeof(day));
    	
    	modal('my_modal');
    	
    }
    
 function test3(title, start, end){
    	
    	console.log(title +"/" + start + "/" + end);
    	console.log(start.toString().substr(16, 2));
    	//console.log(end.toString().substr(16, 2));
    	
    	var end1;
    	if(end == null){
    		end1 = "24";
    	}else{
    		end1 = end.toString().substr(16, 2);
    	}
    	
    	
    	//파트타임 전체 목록 가져오기 
    	//console.log($('#time').find('option').map(function() {return $(this).val();}).get());
    	
    	var t = title;
    	var s = start.toString().substr(16, 2);
    	var e =end1;
    	

    	snedContent(t, s, e);
    	
    	
    	
    	
    	
    	console.log(start.toString().substr(11, 4));
    	// 선택한 날짜 나옴

    	// 년
    	clickYear = (start.toString().substr(11, 4));
    	
    	// 월
    	//clickMonth = (start.toString().substr(4, 3));
    	
    	// 일
    	clickDay =  (start.toString().substr(8, 2));
    	
    	
    
    	
    	switch(start.toString().substr(4, 3)){
    	case "Jan" : clickMonth = '01'; break;
    	case "Feb" : clickMonth = '02'; break;
    	case "Mar" : clickMonth = '03'; break;
    	case "Apr" : clickMonth = '04'; break;
    	case "May" : clickMonth = '05'; break;
    	case "Jun" : clickMonth = '06'; break;
    	case "Jul" : clickMonth = '07'; break;
    	case "Aug" : clickMonth = '08'; break;
    	case "Sep" : clickMonth = '09'; break;
    	case "Oct" : clickMonth = '10'; break;
    	case "Nov" : clickMonth = '11'; break;
    	case "Dec" : clickMonth = '12'; break;
    	}
    	
    	var addDay = clickYear + "-" + clickMonth + "-" + clickDay;
    	console.log(addDay);
    	
    	createAddDay(addDay);
    	
    	
    	
    	
    	
    	modal('my_modal2');
    	
    }
    
 var updateT;
 var updateS ;
 var updateE;
 // 일정에서 가져온 이름,시작시간, 종료시간
function snedContent(t, s, e){
	updateT = t;
	updateS = s;
	updateE = e;
	
	
	console.log("일정에서 가져온 자른 시간 " + updateT + "//" + updateS + "//" + updateE);
}
  



 
    // 모달
    function modal(id) {
    	
    	// option에 selected 속성추가
    	
    	
    	var partTime = $('#time').find('option').map(function() {return $(this).val();}).get();
    	var name = $('#no').find('option').map(function() {return $(this).text();}).get();
    	
    	
    	$.each(partTime, function(i){
    		
    		
    		// 시작 시간
    		console.log(partTime[i].toString().slice(-14,-12));
    		console.log("입력된 시작 시간 " + updateS);
    		// 끝나는 시간
    		console.log(partTime[i].toString().slice(-6,-4));
    		console.log("입력된 종료 시간 " + updateE);
    		
    		$("#timeS2").val(updateS + ":00");
			$("#timeE2").val(updateE+ ":00");
    			if(updateS == 00){
    				updateS = 24;
    			}else if(updateE == 00){
    				updateE = 24;
    			}
    			
    		// 파트 타임 비교해서 selected 넣기
    		if(partTime[i].toString().slice(-14,-12) == updateS && partTime[i].toString().slice(-6,-4) == updateE){
    			console.log("같은 게 있다");
    			
    			
    			
    			
    			var add = partTime[i].toString().slice(-14,-12) + partTime[i].toString().slice(-6,-4);
    			console.log("add" + add);
    			console.log("성공 " + partTime[i].toString().slice(-14,-12) + "/" +  updateS +"||" + partTime[i].toString().slice(-6,-4) + "/" + updateE);
    			$("#updateTime option[value2=" +add + "]").attr('selected', 'selected');
    			
    		}else{
    			console.log("같은 게 없다");
    			console.log("실패" + partTime[i].toString().slice(-14,-12) + "/" +  updateS +"||" + partTime[i].toString().slice(-6,-4) + "/" + updateE);
    			$("#updateTime option[value='not']").attr('selected', 'selected');
    			
    		}
    		
    	});
    		
    	
    		console.log(name);
    	$.each(name, function(i){
    	
    	
    		// 이름 비교해서 selected 넣기
    		
    		if(name[i] == updateT){
    			console.log("이름 같은 게 있다");
    			$("#updateNo option[value2="+ name[i] +"]").attr('selected', 'selected');
    			var beforeNo = $("#updateNo option:selected").val();
    			console.log("업데이트 예전 번호" + beforeNo);
    			
    			createBeforeNo(beforeNo);
    		}
    		
    	});
    		
    	
    	
    	
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
            
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
			width : "500px",
		    height: "280px",
		    
            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

   /* document.getElementById('popup_open_btn').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });
    */
    
     
   
    
var b;
    function createBeforeNo(beforeNo){
     	b =beforeNo;	
    }
    
    
  
  
 // 삽입 submit 동작
	function validate(){
    
		console.log("시작 시작시간" + $("input[id=timeS]").val().substr(0,2));
		console.log("끝 끝나는시간" + $("input[id=timeE]").val().substr(0,2));
		
	 
	 
 		console.log("서브밋동작" + $("#no").val());
 		
 		
 		$memberNo = $("<input>", {type : "hidden", name : "memberNo", 
			value : $("#no").val() });
 		
    	var time = $("#time").val();
    	
    	console.log("시간 쪼개기" + time);
 		
    	
    	var start;
    	var end;
    	// 오전 12시이면 0으로 나옴
		if($("input[id=timeE]").val().substr(0,2) == 0){
			console.log("0 임");
			end = 24;
			console.log("end"+ end);
		}else{
			
			end = $("input[id=timeE]").val().substr(0,2);
		}
    	
		if($("input[id=timeS]").val().substr(0,2) == 0){
			console.log("0 임");
			start = 24;
		}else{
			start = $("input[id=timeS]").val().substr(0,2);
		}
    	
    	
 		
 		$workStart =$("<input>", {type : "hidden", name : "workStart", 
			value :  start});
 		
 		$workEnd =$("<input>", {type : "hidden", name : "workEnd", 
			value :  end});
 		
 		console.log(workDay);
 		// 날짜
 		$workDay =$("<input>", {type : "hidden", name : "workDay", 
					value : workDay});
 		
 		$("form[name='insertCalendarForm']").append($memberNo, $workStart, $workEnd, $workDay);
 		
 	
 		
 			
	 }	
 
	 
	 // 업데이트 submit 동작
		function validate2(){
	    	// 디비에 이렇게 입력들어가야함
	    	// 20/09/05
	    
	 		console.log("서브밋동작" + $("#updateNo").val());
	 		
	 		console.log("beforeMemberNo" + b);
	 		
	 		$beforeMemberNo = $("<input>", {type : "hidden", name : "beforeMemberNo", 
				value : b });
	    	
	 		$memberNo = $("<input>", {type : "hidden", name : "memberNo", 
				value : $("#updateNo").val() });
	 		
	 		
	 		
	 		
	    	var time = $("#updateTime").val();
	    	
	 		
	    	console.log("시간 쪼개기" + time);
	 		
	    	
	    	var start = $("input[id=timeS2]").val().substr(0,2);
	    	var end = $("input[id=timeE2]").val().substr(0,2);
	    	
	    	console.log("시작시간" + start);
	    	console.log("종료시간" + end);
	    	
	    	
	    	if(start == 0){
				console.log("0 임");
				start = 24;
				console.log("start"+ start);
			}
	    	
			if(end == 0){
				console.log("0 임");
				end = 24;
				console.log("end"+ end);
			}
			
			
			
			
			if(updateS == 0){
				console.log("0 임 바꾼다");
				updateS = 24;
				console.log("0 임 바꾼다" + updateS);
			}
	    	
			if(updateE == 0){
				updateE = 24;
				console.log("0 임 바꾼다" + updateE);
			}
	    	
			
			//test
				console.log("예전시간 시작" + updateS);
				console.log("예전시간 종료" + updateE);
				console.log("바꾼시간 시작" + start);
				console.log("바꾼시간 종료" + end);
			
	    	
	 		// 뒤에서부터 숫자 끊어서 가져오기
	 		// str.slice(-3,-1);
	 		
	 		$beforeStart =$("<input>", {type : "hidden", name : "beforeStart", 
				value :  updateS});
	 		
	 		$beforeEnd =$("<input>", {type : "hidden", name : "beforeEnd", 
				value :  updateE});
	 		
	 		
	 		$workStart =$("<input>", {type : "hidden", name : "workStart", 
				value :  start});
	 		
	 		$workEnd =$("<input>", {type : "hidden", name : "workEnd", 
				value :  end});
	 		
	 		console.log(workDay);
	 		// 날짜
	 		$workDay =$("<input>", {type : "hidden", name : "workDay", 
						value : workDay});
	 		
	 		$("form[name='updateCalendarForm']").append($memberNo, $workStart, $workEnd, $workDay, $beforeStart, $beforeEnd, $beforeMemberNo  );
	 		
		 }	
	 
	 
	 // delete submit
		function validate3(){
			confirm("정말 삭제하시겠습니까?");
			
			
	console.log("서브밋동작" + $("#updateNo").val());
	 		
	 		console.log("beforeMemberNo" + b);
	 		
	 		
	 		$memberNo = $("<input>", {type : "hidden", name : "memberNo", 
				value : $("#updateNo").val() });
	 		
	 		
	    	var time = $("#updateTime").val();
	    	
	    	console.log("시간 쪼개기" + time);
	 		
	 		
	 		// 뒤에서부터 숫자 끊어서 가져오기
	 		// str.slice(-3,-1);
	 		
	 		
	 		console.log("시작시간"+updateS);
	 		console.log("종료시간"+updateE);
	    	// 오전 12시이면 0으로 나옴
			if(updateS == 0){
				console.log("0 임");
				updateS = 24;
				console.log("end"+ end);
			}
	    	
			if(updateE == 0){
				console.log("0 임");
				updateE = 24;
			}
	    	
	 		
	 		
	 		$workStart =$("<input>", {type : "hidden", name : "workStart", 
				value :  updateS});
	 		
	 		$workEnd =$("<input>", {type : "hidden", name : "workEnd", 
				value :  updateE});
	 		
	 		console.log(workDay);
	 		// 날짜
	 		$workDay =$("<input>", {type : "hidden", name : "workDay", 
						value : workDay});
	 		
	 		$("form[name='deleteCalendarForm']").append($memberNo, $workStart, $workEnd, $workDay);
	 		
		}
		
	 
	 $("#time").on("change", function(){
		console.log("정상 작동"); 
		var time = $("#time").val();
		console.log("정상 작동" + time); 
		
		var start = time.slice(-14,-9);
		var end = time.slice(-6,-1);
		
		console.log("정상 start" + start); 
		console.log("정상 end" + end); 
		
		
		$("#timeS").val(start);
		$("#timeE").val(end);
		
		
	 });
	 
	 
	 $("#updateTime").on("change", function(){
			console.log("정상 작동"); 
			var time = $("#updateTime").val();
			console.log("정상 작동" + time); 
			
			var start = time.slice(-14,-9);
			var end = time.slice(-6,-1);
			
			console.log("정상 start" + start); 
			console.log("정상 end" + end); 
			
			
			$("#timeS2").val(start);
			$("#timeE2").val(end);
			
			
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
</c:when>
		
		</c:choose>
  	 <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>