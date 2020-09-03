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
					
						<div class="row">
						<!-- ------------------------------------------------------------------- -->
								<div class="col-md-5">
									<div class="row">
									
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="email">이메일</label> 
												<input type="email" class="form-control" name="memberEmail" id="email" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<button type="button" id="getCtf" class="btn btn-primary checkBtn">인증번호 받기</button>
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="certificate">인증번호 확인</label> 
												<input type="text" class="form-control" name="certificate" id="certificate" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<button type="button" id="checkCtf" class="btn btn-primary checkBtn">인증번호 확인</button>
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="pwd1">비밀번호</label> 
												<input type="password" class="form-control" name="memberPwd" id="pwd1">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkPwd1" class="checkSpan">&nbsp;</span>
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="pwd2">비밀번호 확인</label> 
												<input type="password" class="form-control" id="pwd2">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkPwd2" class="checkSpan">&nbsp;</span>
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="name">이름</label> <input type="text"
													class="form-control" name="memberName" id="name"
													placeholder="name">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkName" class="checkSpan">&nbsp;</span>
											</div>
										</div>
			
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="phone">전화번호</label>
			
												<div class="form-row">
													<div class="col-md-4">
														<div class="form-group">
															<select class="form-control" id="phone1" name="phone1"
																required>
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
															<input type="number" class="form-control phone" id="phone2"
																maxlength="4" name="phone2" required>
														</div>
													</div>
			
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone" id="phone3"
																maxlength="4" name="phone3" required>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkPhone" class="checkSpan">&nbsp;</span>
											</div>
										</div>
										
									</div>
								</div>
						<!-- ------------------------------------------------------------------- -->
								<div class="col-md-1" style="border-right: 5px dotted #F5F4F0;"></div>
								<div class="col-md-1"></div>
						<!-- ------------------------------------------------------------------- -->
								<div class="col-md-5">
									<div class="row">
									
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="storeName">업소명</label> 
												<input type="text" class="form-control" name="storeName" id="storeName" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkStoreName" class="checkSpan">&nbsp;</span>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="storeBusinessNo">사업자 번호</label>
			
												<div class="form-row">
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control storeBusinessNo" id="storeBusinessNo1" maxlength="3" name="storeBusinessNo1" required>
														</div>
													</div>
			
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control storeBusinessNo" id="storeBusinessNo2" maxlength="2" name="storeBusinessNo2" required>
														</div>
													</div>
			
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control storeBusinessNo" id="storeBusinessNo3" maxlength="5" name="storeBusinessNo3" required>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkStoreBusinessNo" class="checkSpan">&nbsp;</span>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="storePhone">업소 전화번호</label>
			
												<div class="form-row">
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone2" id="storePhone1" maxlength="3" name="storePhone1" required>
														</div>
													</div>
			
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone2" id="storePhone2" maxlength="4" name="storePhone2" required>
														</div>
													</div>
			
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone2" id="storePhone3" maxlength="4" name="storePhone3" required>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group pt-5">
												<span id="checkStorePhone" class="checkSpan">&nbsp;</span>
											</div>
										</div>
										
										
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="postcodify_search_button">업소 우편번호</label> 
												<input type="text" class="form-control postcodify_postcode5" name="post" id="post" required readonly>
											</div>
										</div>
				                        <div class="col-md-6">
				                        	<div class="form-group pt-5">
				                            	<button type="button" class="btn btn-primary checkBtn" id="postcodify_search_button">검색</button>
				                            </div>
				                        </div>
				                        
				                        <div class="col-md-8">
											<div class="form-group">
												<label class="label" for="address1">업소 도로명 주소</label> 
												<input type="text" class="form-control postcodify_address" name="ddress1" id="address1" required readonly>
											</div>
										</div>
										
										  <div class="col-md-8">
											<div class="form-group">
												<label class="label" for="address2">업소 상세주소</label> 
												<input type="text" class="form-control postcodify_details" name="address2" id="address2" required>
											</div>
										</div>
		
					                    <!-- jQuery와 postcodify 를 로딩한다. -->
					                    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					                    <script>
					                        // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					                        $(function(){
					                            $("#postcodify_search_button").postcodifyPopUp();
					                        });
					                    </script>
									
									</div>
								</div>
						<!-- ------------------------------------------------------------------- -->
						</div>
						
						
						<div class="row">
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
	</section>

	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
	 var signUpCheck = { 
			"email":false,
			"getCtf":false,
			"certificate":false,
			"checkCtf":false,
			"pwd1":false,
			"pwd2":false,
			"name":false,
			"phone2":false,
			"storeBusinessNo1":false,
			"storePhone1":false,
		};
	 
	var $email = $("#email");
	var $certificate = $("#certificate");
	var $pwd1 = $("#pwd1");
	var $pwd2 = $("#pwd2");
	var $pwd = $("#pwd1, #pwd2");
	var $name = $("#name");
	var $phone2 = $("#phone2");
	var $phone3 = $("#phone3");
	var $storeBusinessNo1 = $("#storeBusinessNo1");
	var $storeBusinessNo2 = $("#storeBusinessNo2");
	var $storeBusinessNo3 = $("#storeBusinessNo3");
	var $storePhone1 = $("#storePhone1");
	var $storePhone2 = $("#storePhone2");
	var $storePhone3 = $("#storePhone3");
	
	// ------------------- 이메일 ---------------------------
	$email.on("change", function(){
		var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; 
		
		if(!regExp.test($email.val())){
			swal({
				  title: "이메일 작성 확인",
				  text: "유효한 이메일을 작성해주세요.",
				  icon: "info",
				  button: "닫기",
				});
			$email.focus();
			signUpCheck.email = false;
		}else {
			signUpCheck.email = true;
		}
	});
	
	// 인증번호 받기
	$("#getCtf").on("click", function(){
		
		if($email.val().trim().length == 0 || signUpCheck.email == false){
			swal({
				  title: "이메일 확인",
				  text: "정확한 이메일을 먼저 작성해주세요.",
				  icon: "info",
				  button: "닫기",
				});
			$email.focus();
			signUpCheck.getCtf = false;
		}else{
			signUpCheck.getCtf = true;
		}
	});
	
	// 인증번호 확인
	$("#checkCtf").on("click", function(){
		signUpCheck.certificate = true;
		signUpCheck.checkCtf = true;
	});
	
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
	
 	
 	// ------------------- 사업자 번호 ---------------------------
 	$(".storeBusinessNo").on("input",function(){
 		
		if ($(this).val().length > $(this).prop("maxLength")){
		  $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		}
		    var regExp1 =  /^\d{3}$/; 
		    var regExp2 =  /^\d{2}$/; 
		    var regExp3 =  /^\d{5}$/; 

		    
		    if(!regExp1.test($storeBusinessNo1.val()) || 
		       !regExp2.test($storeBusinessNo2.val()) ||
		       !regExp3.test($storeBusinessNo3.val()) ){
		    	$("#checkStoreBusinessNo").text("유효하지 않은 사업자 번호").css("color","red");
				signUpCheck.storeBusinessNo1 = false;
		  }else{
				$("#checkStoreBusinessNo").text("유효한 사업자 번호").css("color","green");
				signUpCheck.storeBusinessNo1 = true;
		  }
	});
 	
 	// ------------------- 업소 전화번호 ---------------------------
	$(".phone2").on("input",function(){
 		
		if ($(this).val().length > $(this).prop("maxLength")){
		  $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		}
			var regExp1 =  /^\d{2,3}$/; 
			var regExp2 =  /^\d{3,4}$/; 
		    var regExp3 =  /^\d{4}$/; 
		    
		    if(!regExp1.test($storePhone1.val()) ||
		       !regExp2.test($storePhone2.val()) ||
		       !regExp3.test($storePhone3.val()) ){
		    	$("#checkStorePhone").text("유효하지 않은 전화번호").css("color","red");
				signUpCheck.storePhone1 = false;
		  }else{
				$("#checkStorePhone").text("유효한 전화번호").css("color","green");
				signUpCheck.storePhone1 = true;
		  }
	});		

	// ------------------- submit 동작 ---------------------------
	function validate(){

		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				
				var msg;
				switch(key){
				case "email" : msg="이메일이 ";  break;
				case "certificate" : msg="인증번호가 ";  break;
				case "pwd1" : case "pwd2" : msg="비밀번호가 ";  break;
				case "name" : msg="이름이 ";  break;
				case "phone2" : msg="전화번호가 ";  break;
				case "storeBusinessNo1" : msg="사업자 번호가 ";  break;
				case "storePhone1" : msg="업소 전화번호가 ";  break;
				}
				
				swal({
					  title: msg + "유효하지 않습니다.",
					  icon: "error",
					  button: "닫기",
					});
				var el = "#"+key;
				$(el).focus();
				return false;
				
				switch(key){
				case "getCtf" : msg="인증번호 받기를 ";  break;
				case "checkCtf" : msg="인증번호 확인을 ";  break;
				}
				
				swal({
					  title: msg + "실행해주세요. ",
					  icon: "error",
					  button: "닫기",
					});
				$certificate.val("");
				$certificate.focus();
				return false;
			}
		}

		$memberPhone = $("<input>", {type : "hidden", name : "memberPhone",
			value : $("#phone1").val()+ "-" + $("#phone2").val()+ "-" +$("#phone3").val()});
		
		$storePhone = $("<input>", {type : "hidden", name : "storePhone",
			value : $("#storePhone").val()+ "-" + $("#storePhone").val()+ "-" +$("#storePhone").val()});
		
		$storeAddress = $("<input>", {type : "hidden", name : "storeAddress",
			value : $("#post").val()+ "," + $("#address1").val()+ "," +$("#address2").val()});
		
		$("form[name='signUpForm']").append($memberPhone, $storePhone, $storeAddress);
	}
	</script>

</body>
</html>