<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>AM_Albeit Management</title>

	<style>
		#main-slide{ 
			border-top: 3px  solid #eceaea; 
			border-bottom: 3px  solid #eceaea; 
		}
		.main-text{font-family: 'S-CoreDream-4Regular' !important;}
		.main-title{font-family: 'S-CoreDream-6Bold' !important;}
	</style>
	
  </head>
  <body>
  
  	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
	
	
	<c:choose>
		<c:when test="${!empty loginMember.memberName }">
		
		<jsp:include page="WEB-INF/views/calendar/mainWorkList.jsp"/>
		</c:when>
		
		
		<c:otherwise>
	 
	 		
    <div class="hero-wrap" style="background-image: url('${contextPath}/resources/images/main_img.png');" data-stellar-background-ratio="0.5" id="main-slide"> 
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center">
          <div class="col-md-6 ftco-animate d-flex align-items-end fadeInUp ftco-animated">
          	<div class="text w-100">
	            <h1 class="mb-4">Leave it up<br>to AM</h1>
	            <p class="mb-4 main-text">귀찮고 어려운 알바생 관리?<br>이제 AM에 맡기세요!</p>
				<p>
				<a href="${contextPath}/company/about" class="btn btn-primary py-3 px-4">Read more</a>
				<a href="${contextPath}/company/contact" class="btn btn-primary py-3 px-4">Contact us</a> 
				</p>
            </div>
          </div>
        </div>
      </div>
    </div>

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
	    					<div class="icon d-flex align-items-center justify-content-center">
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
		
		</c:otherwise>
		
	</c:choose>
		
	
	
    
    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="WEB-INF/views/common/footer.jsp" />
    
  </body>
</html>