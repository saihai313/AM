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
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
            }
</style>
</head>
<body>
	
	


	 	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- ------------------------- main ---------------------------- -->
	<c:choose>
		<c:when test="${empty loginMember }">
		<!--  로그인 x -->
		<div id="notLogin">로그인 후 이용해주세요</div>
		</c:when>
		
		<c:when test="${!empty loginMember.memberName }">
		<!-- 로그인 o -->
		
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
				<div class="pageBtn">
				<a class="btn btn-primary pix"  href="${contextPath}/calendar/pixSchedule">고정스케쥴 등록</a>
				<a class="btn btn-primary part" href="${contextPath}/calendar/partTime">파트타임 설정</a>
				</div>
			</div>
	</section>

	
	<!-- 
		1. 날짜 눌렀을 때 모달창 나오기
		2. 년, 월, 일  값 가져오기
		3. 알바생 목록 가져오기
		4. 파트타임 가져오기
		
		5. 확인(insert) 버튼 눌렀을 때  값 넘어가기
		6. 넘겨진 값 확인하기 
	 -->



<!-- 모달 -->
<div id="my_modal">
		<c:choose>
			<c:when test="${empty eList}">
				<h4>알바생 없음</h4>
			</c:when>
			
			<c:otherwise>
	          <form class="form-signin" method="POST" action="${contextPath}/calendar/insertCalendar" name='insertCalendarForm' onsubmit="return validate();">
					근무자 : <select id="no">
			<c:forEach var="member" items="${eList}">
					<option value="${member.memberNo}">${member.memberName}</option>
			
			</c:forEach>
				</select> <br>
			
						part 선택 : <select id="time" name="time">
						<option>part1 [10:00 ~ 16:00]</option>
						<option>part2 [14:00 ~ 22:00]</option>
						</select> 
						<br>
			
				<div class="checkbox mb-3">
					
				</div>
				<button class="btn btn-lg btn-primary" type="submit">등록|수정</button>
			</form>
			</c:otherwise>
		</c:choose>
								
								
            <a class="modal_close_btn">닫기</a>
        </div>

  <%--      <button id="popup_open_btn">팝업창 띄어 줘염</button> --%>
	
	
	
	
     <script type="text/javascript" src="${contextPath}/resources/js/calendar.js"></script>
    
  
    
<script>
	// 날짜 클릭했을 때 모달 창 나오기
	$(".fc-day").on("click", function(){
		  console.log("111111");
	});

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
				
	if(${loginMember.memberGrade== 'M'}){
	  	  // 아이디가 사장님일 때
	  	  console.log("m이다");
	  	  
	  	  
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
							var year = list[i].workingDay.toString().substring(0,4);
							var month = list[i].workingDay.toString().substring(5,7) - 1;
							var day = list[i].workingDay.toString().substring(8,10);
							var name = list[i].memberName;
							var startTime = list[i].startTime;
							var endTime = list[i].endTime;
						
							/* id: 999,
					            title: '리아',
					            start: new Date(y, m, 22, 16, 0),
					            end : new Date(y, m, 22, 16, 0)
					            allDay: false,
					            className: 'info'*/
							var start = new Date(year, month, day, startTime, 0);
							var end = new Date(year, month, day, endTime, 0);
							//var obj = {"year" : year, "month" : month, "day" : day, "name" : name, "startTime" : startTime, "endtTime" : endtTime };
							var obj = {"title" : name ,"start" : start, "end" : end, "allDay" : false,  "dow": [ 1, 4 ]};
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
					url : "staff/calendarView/",
					dataType : "JSON",
					async : false,
					success : function(list){
						console.log(list);
						$.each(list, function(i){
							var year = list[i].workingDay.toString().substring(0,4);
							var month = list[i].workingDay.toString().substring(5,7) - 1;
							var day = list[i].workingDay.toString().substring(8,10);
							var name = list[i].memberName;
							var startTime = list[i].startTime;
							var endTime = list[i].endTime;
						
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
	        select: function(start, end, allDay, month) {
	        	
	        	
	       
	        	
	        	
	        	
	        	test2(start);
	        	console.log("시간" + start.toString());
	        	console.log("월" + month);
	        	// 선택한 날짜 나옴
	        	
	        	
	        	// function 호출해서 값 리턴..?
	        	// 변수 만들어서 값 넣기
	        	
	          var title = test();
	          // 일 클릭하면 나오는 창
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
    
    function test2(day){
    	
    	// 클릭한 날짜
    	console.log(typeof(day));
    	
    	
    	
    	
    	modal('my_modal');
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    }
    function test(){
    	var t= "테스트"
    	return t;
    }
    
    
    // 모달
    function modal(id) {
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
    
    
 	// submit 동작
	function validate(){
		
    	// 디비에 이렇게 입력들어가야함
    	// 20/09/05
    	
    	
    	
    	
    	
    	
 		console.log("서브밋동작" + $("#no").val());
 		
 		$employeeNo = $("<input>", {type : "hidden", name : "employeeNo", 
			value : $("#no").val() });
 		
    	var time = $("#time").val();
    	
    	console.log("시간 쪼개기" + time);
 		
 		
 		// 뒤에서부터 숫자 끊어서 가져오기
 		// str.slice(-3,-1);
 		$startTime =$("<input>", {type : "hidden", name : "startTime", 
			value :  time.slice(-14,-12)});
 		
 		$endTime =$("<input>", {type : "hidden", name : "endTime", 
			value :  time.slice(-6,-4)});
 		
 		$("form[name='insertCalendarForm']").append($employeeNo, $startTime, $endTime);
 		
	 }
    
    $(document).ready(function() {
    	
    	
    	//  시작 시
    	// .slice(-14,-12)
    	
    	// 시작 분
    	// .slice(-11,-9)
    	
    	// 종료 시
    	// .slice(-6,-4)
    	
    	// 종료 분
    	// .slice(-3,-1)

 		// part1 [10:00 ~ 16:00]
    	
    });
 	
</script>
</c:when>
		
		</c:choose>
  	 <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>