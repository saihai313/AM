<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.checkBtn {
	font-family: 'S-CoreDream-6Bold';
	font-size: small;
}

.checkSpan{
	font-family: 'S-CoreDream-4Regular';
	font-size: small;
}

#email{color: black; font-weight: bold;}
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section bg-light" id="signUp">
		<div class="overlay"></div>
		<div class="container">

			<div class="contact-wrap w-100 p-md-5 p-4 justify-content-center col-md-12">
				
				<div class="row">
					<div class="col-md-12 heading-section text-center fadeInUp">
						<span class="subheading">JOIN US</span>
						<h2>회원가입</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 p-4">
					<form method="POST" action="signUpAction" class="contactForm mt-5" name="signUpForm" onsubmit="return validate();">
					
						<div class="row" style="padding-left: 37%;">
						<!-- ------------------------------------------------------------------- -->
							<div class="row justify-content-center">
								<div class="contact-wrap w-100">
									<div class="row">

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="email">이메일</label> 
												<input type="email" class="form-control" name="memberEmail" value="${memberAuth.authEmail }" readonly>
											</div>
										</div>
										<div class="col-md-7"></div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd1">비밀번호</label> 
												<input type="password" class="form-control" name="memberPwd" id="pwd1" placeholder="Password">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkPwd1">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd2">비밀번호 확인</label> 
												<input type="password" class="form-control" id="pwd2" placeholder="Password Check">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkPwd2">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="name">이름</label> 
												<input type="text" class="form-control" name="memberName" id="name" placeholder="name">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkName">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
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
															<input type="number" class="form-control phone" id="phone2" maxlength="4" name="phone2" required>
														</div>
													</div>

													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone" id="phone3" maxlength="4" name="phone3" required>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkPhone">&nbsp;</span>
											</div>
										</div>
			
									</div>
								</div>
							</div>
						
						<!-- ------------------------------------------------------------------- -->
						</div>
						
						
						<div class="row justify-content-center mt-5">
							<div class="col-md-6">
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
	</section>

	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
	 var signUpCheck = { 
			"pwd1":false,
			"pwd2":false,
			"name":false,
			"phone2":false,
		};
	 
	var $pwd1 = $("#pwd1");
	var $pwd2 = $("#pwd2");
	var $pwd = $("#pwd1, #pwd2");
	var $name = $("#name");
	var $phone2 = $("#phone2");
	var $phone3 = $("#phone3");
	
	// ------------------- 비밀번호 ---------------------------
	$pwd.on("input", function(){
		var regExp = /^[A-Za-z0-9]{6,12}$/;
		
		if(!regExp.test($("#pwd1").val())){ 
			$("#checkPwd1").text("유효하지 않은 비밀번호").css("color","red");
			signUpCheck.pwd1 = false;
        }else{
        	$("#checkPwd1").text("유효한 비밀번호").css("color","green");
        	signUpCheck.pwd1 = true;
        }
		
	if(!signUpCheck.pwd1 && $pwd2.val().length > 0){
		swal({
			  title: "비밀번호 작성 확인",
			  text: "유효한 비밀번호를 먼저 작성해 주세요.",
			  icon: "info",
			  button: "닫기",
			});
		$pwd2.val("");
		$pwd1.focus();
	}else if(signUpCheck.pwd1 && $pwd2.val().length > 0){
		if($("#pwd1").val().trim() != $("#pwd2").val().trim()){
			$("#checkPwd2").text("비밀번호 불일치").css("color","red");
			signUpCheck.pwd2 = false;
		}else{
			$("#checkPwd2").text("비밀번호 일치").css("color","green");
			signUpCheck.pwd2 = true;
		}
	}
		
	});
	
	
	// ------------------- 이름 ---------------------------
	$name.on("input", function(){
		var regExp =  /^[가-힣]{2,}$/; 
		
		if(!regExp.test($name.val())){
			$("#checkName").text("한글 두글자 이상 입력").css("color","red");
			signUpCheck.name = false;
		}else {
			$("#checkName").text("정상 입력").css("color","green");
			signUpCheck.name = true;
		}
		
	});
	
	// ------------------- 전화번호 ---------------------------
 	$(".phone").on("input",function(){
 		
		if ($(this).val().length > $(this).prop("maxLength")){
		  $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		}
		    var regExp1 =  /^\d{3,4}$/; 
		    var regExp2 =  /^\d{4,4}$/; 
		    
		    if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
		    	$("#checkPhone").text("유효하지 않은 전화번호").css("color","red");
				signUpCheck.phone2 = false;
		  }else{
				$("#checkPhone").text("유효한 전화번호").css("color","green");
				signUpCheck.phone2 = true;
		  }
	});
	
	// ------------------- submit 동작 ---------------------------
	function validate(){

		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				
				var msg;
				switch(key){
				case "pwd1" : case "pwd2" : msg="비밀번호가 ";  break;
				case "name" : msg="이름이 ";  break;
				case "phone2" : msg="전화번호가 ";  break;
				}
				
				swal({
					  title: msg + "유효하지 않습니다.",
					  icon: "error",
					  button: "닫기",
					});
				var el = "#"+key;
				$(el).focus();
				return false;
				
			}
		}

		$memberPhone = $("<input>", {type : "hidden", name : "memberPhone",
			value : $("#phone1").val()+ "-" + $("#phone2").val()+ "-" +$("#phone3").val()});
		
		$("form[name='signUpForm']").append($memberPhone);
	}
	</script>

</body>
</html>