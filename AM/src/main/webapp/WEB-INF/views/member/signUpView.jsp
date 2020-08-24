<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section bg-light" id="signUp">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="wrapper px-md-4">
						
						<div class="row no-gutters">
						
						
								<div class="contact-wrap w-100 p-md-5 p-4">
								
									<div class="col-md-12 heading-section text-center fadeInUp">
							          	<span class="subheading">JOIN US</span>
							            <h2>Employer</h2>
							        </div>
							        
									<form method="POST" id="contactForm" name="contactForm" class="contactForm mt-5">
									
										<div class="row">
										
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="email">이메일</label> <input
														type="email" class="form-control" name="memberEamil" id="email"
														placeholder="Email">
												</div>
											</div>
											
											<div class="col-md-5">
												<div class="form-group">
													<label class="label" for="pwd1">비밀번호</label> <input
														type="text" class="form-control" name="memberPwd" id="pwd1"
														placeholder="Password">
												</div>
											</div>
											<div class="col-md-7">
												<div class="form-group pt-5">
													<span id="checkPwd1">&nbsp;</span>
												</div>
											</div>
											
											<div class="col-md-5">
												<div class="form-group">
													<label class="label" for="pwd2">비밀번호 확인</label> <input
														type="text" class="form-control" 
														id="pwd2" placeholder="Password Check">
												</div>
											</div>
											<div class="col-md-7">
												<div class="form-group pt-5">
													<span id="checkPwd2">&nbsp;</span>
												</div>
											</div>
											
											<div class="col-md-5">
												<div class="form-group">
													<label class="label" for="name">이름</label> <input
														type="text" class="form-control" name="memberName" id="name"
														placeholder="name">
												</div>
											</div>
											<div class="col-md-7">
												<div class="form-group pt-5">
													<span id="checkName">&nbsp;</span>
												</div>
											</div>
											
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="phone">전화번호</label> 
													
													<div class="form-row">
														<div class="col-md-4">
															<div class="form-group">
									                            <select class="form-control" id="phone1" name="phone1" required>
									                                <option>010</option>
									                                <option>011</option>
									                                <option>016</option>
									                                <option>017</option>
									                                <option>019</option>
									                            </select>
								                            </div>
								                        </div>
								                        
														<div class="col-md-4">
															<div class="form-group">
								                            	<input type="number" class="form-control" id="phone2"  maxlength="4" name="phone2" required>
								                            </div>
								                        </div>
								                        
								                        <div class="col-md-4">
								                        	<div class="form-group">
								                           		<input type="number" class="form-control" id="phone3"  maxlength="4" name="phone3" required>
								                        	</div>
								                        </div>
													</div>
							                 	</div>
							                 </div>
							                 <div class="col-md-12">
												<div class="form-group pt-5">
													<span id="checkPhone">&nbsp;</span>
												</div>
											</div>
											
											
											
											<div class="col-md-12 mt-5">
												<div class="form-group">
													<input type="submit" value="JOIN" class="btn btn-primary form-control">
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