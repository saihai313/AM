<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
	#contact h2{font-family: 'S-CoreDream-6Bold' !important;}
</style>

</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-appointment ftco-section img"
		style="background-image: url(${contextPath}/resources/images/main_img.png);" id="contact">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 half">
					<h2 class="mb-5 text-center">AM 고객 지원센터</h2>
					<form action="#" class="appointment">
						<div class="row">
						
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="이름">
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control" placeholder="이메일">
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon">
												<span class="fa fa-chevron-down"></span>
											</div>
											<select name="question" id="question" class="form-control">
												<option id="none">문의 유형</option>
												<option value="join">회원가입</option>
												<option value="use">사이트 이용</option>
												<option value="suggest">건의 사항</option>
												<option value="other">기타 문의</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="message" id="message" cols="30" rows="7" class="form-control"
										placeholder="자세한 내용을 기입해 주세요."></textarea>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" value="Send message"
										class="btn btn-primary py-3 px-4">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>