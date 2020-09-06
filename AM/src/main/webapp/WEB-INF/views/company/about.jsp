<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About AM</title>

<style>
	#about-wrapper{
		border-top: 3px solid #eceaea; 
		border-bottom: 3px solid #eceaea; 
	}
	
	#about-title{font-family: 'S-CoreDream-6Bold';}
	#about p{font-family: 'S-CoreDream-4Regular';}
</style>
</head>
<body>
	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section" id="about">
		<div class="overlay"></div>
		<div class="container">
		
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">Welcome to AM</span>
					<h2>회사 소개</h2>
				</div>
			</div>
			
			<div class="row" id="about-wrapper">
				<div
					class="col-md-6 img img-3 d-flex justify-content-center align-items-center"
					style="background-image: url('${contextPath}/resources/images/about_img.jpg');"></div>
				<div class="col-md-6 wrap-about px-md-5 py-5 bg-light">
					<div class="heading-section">
						<h2 class="mb-4" id="about-title">
							최고의 아르바이트<br>관리 시스템
						</h2>

						<p>
							소규모 사업장에서도 부담 없이 사용할 수 있는<br> 인사, 근무, 급여 관리 프로그램이 필요하신가요?<br>
							<br> 저희 AM은<br> 사장님과 아르바이트생 모두를 행복하게 만듭니다.<br>
							<br> 사장님에게는 알바생의 휴무나 초과수당,<br> 정확한 월급 지급과 명세서까지<br>
							간편하게 이용하고 관리하는 시스템을 제공합니다.<br>
							<br> 알바생에게는 정확한 계산을 통해 급여를 받고,<br> 스케쥴 관리가 가능한 시스템을
							제공합니다.
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>