<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>AM_Albeit Management</title>

	<style>
		#main-slide{ 
			border-top: 3px solid #eceaea; 
			border-bottom: 3px solid #eceaea; 
		}
		.main-text{font-family: 'S-CoreDream-4Regular' !important;}
		.main-title{font-family: 'S-CoreDream-8Heavy'!important; color: #FEEBB6;}
		.mainTable *{font-size: small; color: grey;}
		.mainTable thead tr:first-child{font-weight: bold; font-family: 'S-CoreDream-6Bold';}
		.mainTable thead tr:last-child{border-bottom: 3px solid #F5F4F0;}
		.mainTable tbody tr{border-bottom: 1px solid #F5F4F0;}
	</style>
	
  </head>
  <body>
  
  	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
	
	<c:choose>
		<c:when test="${!empty loginMember }">
			<div class="hero-wrap" data-stellar-background-ratio="0.5" id="main-slide"> 
		      <div class="overlay"></div>
		      <div class="container">
				
				<div class="row">
		        
			        <div class="col-md-5">
			          <div class="row justify-content-center pb-5 text-center">
			          
							<div class="col-md-7 heading-section text-center fadeInUp mt-5">
								<jsp:useBean id="month" class="java.util.Date" />
								<fmt:formatDate var="titleMonth" value="${month }" pattern="YYYY년  MM월"/>
								<h3 class="main-title">${titleMonth}</h3>
							</div>
							
							
							<table class="col-md-12 mt-3 mb-5 mainTable">
								<thead>
									<tr><th colspan="2" class="text-left">미확인 급여 명세서</th></tr>
									<tr><th colspan="2" class="text-left" style="color: transparent;">공백</th></tr>
									<tr>
										<th width="50%">발급일</th>
										<th width="50%">명세서명</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
				                		<c:when test="${empty payListMain}">
				                			<tr><td colspan="2">새로운 급여 명세서가 없습니다.</td><tr>
				                		</c:when>
				                		
				                		<c:otherwise>
				                			<c:forEach var="pay" items="${payListMain}">
				                				<tr>
				                					<td>${pay.payCreateDate }</td>
				                					<td>
														<fmt:formatDate var="payTitle" value="${pay.payCreateDate }" pattern="YYYY년  MM월 명세서"/>
				               							${payTitle }
				                					</td>
				                					<td></td>
				                				</tr>
				                			</c:forEach>
				                		</c:otherwise>
				                		
				                	</c:choose>
				                	
								</tbody>
							</table>
							
							
							<table class="col-md-12 mb-3  mainTable">
								<thead>
									<tr><th colspan="2" class="text-left">미확인 급여 정정 신청 결과</th></tr>
									<tr><th colspan="2" class="text-left" style="color: transparent;">공백</th></tr>
									<tr>
										<th width="50%">해당 명세서명</th>
										<th width="50%">결과</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
				                		<c:when test="${empty correctionListMain}">
				                			<tr><td colspan="2">새로운 급여 정정 신청 결과가 없습니다.</td><tr>
				                		</c:when>
				                		
				                		<c:otherwise>
				                			<c:forEach var="correction" items="${correctionListMain}">
				                				<tr>
				                					<td>
														<fmt:formatDate var="corrTitle" value="${correction.correctionCreateDate }" pattern="YYYY년  MM월 정정 신청"/>
				               							${corrTitle }
				                					</td>
				                					<td>
				                						<c:choose>
				                							<c:when test="${correction.correctionStatus == 'Y' }">
				                								정정 승인
				                							</c:when>
				                							<c:when test="${correction.correctionStatus == 'N' }">
				                								정정 반려
				                							</c:when>
				                							<c:otherwise/>
				                						</c:choose>
				                					</td>
				                				</tr>
				                			</c:forEach>
				                		</c:otherwise>
				                	</c:choose>
				                	
								</tbody>
							</table>
							
						</div>
			        </div>
			        
			        <div class="col-md-7">
			          <jsp:include page="WEB-INF/views/work/workCalendarMain.jsp"/>
			        </div>
		        </div>
		        
		    </div>
			</div>
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
    	</c:otherwise>
    </c:choose>

		<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">Services</span>
					<h2>FOR EMPLOYEE</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 d-flex align-items-stretch">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="number d-flex align-items-center justify-content-center">
								<span>01</span>
							</div>
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-calendar"></span>
							</div>
						</div>
						<h2 class="main-title">근무 스케줄</h2>
						<p class="main-text">
							근무 스케줄러로<br>한눈에 확인
						</p>
					</div>
				</div>
				<div class="col-md-4 d-flex align-items-stretch">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="number d-flex align-items-center justify-content-center">
								<span>02</span>
							</div>
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-checklist"></span>
							</div>
						</div>
						<h2 class="main-title">급여 명세서</h2>
						<p class="main-text">
							급여 내역을<br>쉽고 편하게
						</p>
					</div>
				</div>
				<div class="col-md-4 d-flex align-items-stretch">
					<div class="services-2 text-center">
						<div class="icon-wrap">
							<div
								class="number d-flex align-items-center justify-content-center">
								<span>03</span>
							</div>
							<div
								class="icon d-flex align-items-center justify-content-center">
								<span class="flaticon-qa"></span>
							</div>
						</div>
						<h2 class="main-title">급여 정정 신청</h2>
						<p class="main-text">
							귀찮은 급여 정정 신청을<br>바로바로
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    
    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="WEB-INF/views/common/footer.jsp" />
    
  </body>
</html>