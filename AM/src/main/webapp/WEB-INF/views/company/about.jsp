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
	
	<hr id="aboutAddress">
	
	<section class="ftco-section">
			<div class="container">
			
			<div class="row justify-content-center pb-5 mt-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">contact us</span>
					<h2>오시는 길</h2>
				</div>
			</div>
				<div class="row justify-content-center">
				
					<div class="col-md-12">
						<div class="wrapper px-md-4">
							
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
										<div class="row mb-5">
										<div class="col-md-4">
												<div class="dbox w-100 text-center">
							        		<div class="icon d-flex align-items-center justify-content-center">
							        			<span class="fa fa-map-marker"></span>
							        		</div>
							        		<div class="text">
								            <p><span>Address<br></span> 서울특별시 중구<br>남대문로 120<br>대일빌딩 2F, 3F</p>
								          </div>
							          	</div>
											</div>
											<div class="col-md-4">
												<div class="dbox w-100 text-center">
							        		<div class="icon d-flex align-items-center justify-content-center">
							        			<span class="fa fa-phone"></span>
							        		</div>
							        		<div class="text">
								            <p><span>Phone<br></span> <a href="tel://12345678">+ 1234 5678</a></p>
								          </div>
							          </div>
											</div>
										<div class="col-md-4">
											<div class="dbox w-100 text-center">
								        		<div class="icon d-flex align-items-center justify-content-center">
								        			<span class="fa fa-paper-plane"></span>
								        		</div>
								        		<div class="text">
									            <p><span>Email<br></span> <a href="mailto:AlbeitManagement@gmail.com">AlbeitManagement<br>@gmail.com</a></p>
									          </div>
								          </div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-md-5 order-md-first d-flex align-items-stretch">
								<div id="map" style="width:100%; "></div>
			
									<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_stM0rLGlj1xzE0Kq_epQJSi_bgDKxyw&callback=initMap&region=kr"></script>
									<script>
										let marker;
	
										function initMap() {
										  const map = new google.maps.Map(document.getElementById("map"), {
										    zoom: 17,
										    center: { lat: 37.567975 ,lng: 126.983126 }
										  });
										  marker = new google.maps.Marker({
										    map,
										    draggable: true,
										    animation: google.maps.Animation.DROP,
										    position: { lat: 37.567975 ,lng: 126.983126 }
										  });
										  marker.addListener("click", toggleBounce);
										}
	
										function toggleBounce() {
										  if (marker.getAnimation() !== null) {
										    marker.setAnimation(null);
										  } else {
										    marker.setAnimation(google.maps.Animation.BOUNCE);
										  }
										}
									</script>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>