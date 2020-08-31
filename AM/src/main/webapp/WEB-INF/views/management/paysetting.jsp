<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
}

.tabType1 li.on a {
	color: #fff;
}

#email{font-family: 'S-CoreDream-6Bold' !important;}
</style>

</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container">

			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">MY FAGE</span>
					<h2>급여설정</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1">
				<li class="on"><a href="${contextPath}/management/pays">급여설정</a></li>
				<li><a href="${contextPath}/management/bills">급여명세서</a></li>
				<li><a href="${contextPath}/management/moneysetting">급여기준설정</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->


			<div class="row justify-content-center">
				<div class="col-md-7">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form method="POST" id="contactForm" name="contactForm"
									class="contactForm mt-5">

									
								</form>
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