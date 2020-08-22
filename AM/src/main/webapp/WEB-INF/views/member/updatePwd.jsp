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
					<h2>비밀번호 수정</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1">
				<li><a href="${contextPath}/member/updateMember">회원정보 수정</a></li>
				<li class="on"><a href="${contextPath}/member/updatePwd">비밀번호 수정</a></li>
				<li><a href="${contextPath}/member/secession">회원 탈퇴</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->
			
			<div class="row justify-content-center">
				<div class="col-md-7">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form method="POST" id="contactForm" name="contactForm"
									class="contactForm mt-5">

									<div class="row">

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="email">이메일</label> <input
													type="email" class="form-control" name="memberEamil"
													id="email" placeholder="am@email.com" readonly>
											</div>
										</div>
										
										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd">현재 비밀번호</label> <input
													type="text" class="form-control" id="pwd"
													placeholder="Now Password">
											</div>
										</div>
										<div class="col-md-7 mb-5">
											<div class="form-group pt-5">
												<span id="checkPwd2">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd1">새 비밀번호</label> <input
													type="text" class="form-control" name="memberPwd" id="pwd1"
													placeholder="New Password">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5">
												<span id="checkPwd1">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd2">새 비밀번호 확인</label> <input
													type="text" class="form-control" id="pwd2"
													placeholder="New Password Check">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5">
												<span id="checkPwd2">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-12 mt-5">
											<div class="form-group">
												<input type="submit" value="CHANGE"
													class="btn btn-primary form-control">
												<div class="submitting"></div>
											</div>
										</div>

									</div>
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