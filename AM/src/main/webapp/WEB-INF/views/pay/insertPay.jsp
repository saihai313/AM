<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 설정</title>
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
	
	#updateBtn{
		float : right;
	}
	
	#inputTable{
		width:1100px;
	}
	
	
	
</style>

 
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section">
		<div class="overlay"></div>
			<div class="row justify-content-center pb-5">
			
			
			
				<div class="col-md-12 heading-section text-center fadeInUp">
					<span class="subheading">SALARY</span>
					<h2>급여 설정</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1">
				<li class="on"><a href="${contextPath}/pay/insertPay">급여설정</a></li>
				<li><a href="${contextPath}/pay/payStubList">급여 명세서</a></li>
				<li><a href="${contextPath}/pay/requestPayStub">정정신청</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->
			
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="wrapper px-md-4">
							<div class="row no-gutters">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<div class="col-md-12 heading-section fadeInUp">
								          	<span class="subheading">직원선택</span>
								            <select class="form-control" style="width:120px; display: inline-block;">
								            	<option>최지은</option>
								            	<option>전상아</option>
								            	<option>이아라</option>
								            	<option>김지영</option>
								            </select>
								        </div>
								        
										<form method="POST" id="contactForm" name="contactForm" class="contactForm mt-5">
										
											<div class="row">
											
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payDay">급여일</label> <input
															type="email" class="form-control" name="payDay" id="payDay"
															placeholder="일" >
															
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payTime">근무시간</label> <input
															type="text" class="form-control" name="payTime" id="payTime"
															placeholder="시간">
													</div>
												</div>
												
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="partMoney">시급</label> <input
															type="text" class="form-control" name="partMoney"
															id="partMoney" placeholder="원">
													</div>
												</div>
												
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="vacaMoney">주휴수당</label> <input
															type="text" class="form-control" name="vacaMoney" id="vacaMoney"
															placeholder="원">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="totalTime">총 일한시간</label> <input
															type="text" class="form-control" name="totalTime" id="totalTime"
															placeholder="시간">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="totalDay">총 일수</label> <input
															type="text" class="form-control" name="totalDay" id="totalDay"
															placeholder="일">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="totalMoney">총 지급액</label> <input
															type="text" class="form-control" name="totalMoney" id="totalMoney"
															placeholder="원">
													</div>
												</div>
												
												
												<div class="col-md-12 mt-5">
													<div class="form-group">
														<input type="submit" value="등록" class="btn btn-primary form-control">
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