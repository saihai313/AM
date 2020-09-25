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
 .one1{
 	    background-color: bisque;
 	        border-radius: 14px;
 	        padding: 10px;
 	        border: 2px solid lightgray;
 	        height: 950px;
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
				<div class=" col-md-10">
					<jsp:include page="/WEB-INF/views/work/workCalendar.jsp"/>
				</div>
			</div>
			
		</div>
	</section>

	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  
</body>
</html>