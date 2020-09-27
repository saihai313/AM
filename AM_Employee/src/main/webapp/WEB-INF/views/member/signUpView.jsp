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
		<div class="container" style="padding-top: 6em;">

			<div class="contact-wrap w-100 p-md-5 p-4 justify-content-center col-md-12">
				
				<div class="row">
					<div class="col-md-12 heading-section text-center fadeInUp">
						<span class="subheading">JOIN US</span>
						<h2>회원가입</h2>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-md-12 p-4">
					<form method="POST" action="signUp2" class="contactForm mt-5 justify-content-center" name="signUpForm" onsubmit="return validate();">
					
						<div class="row justify-content-center">
						<!-- ------------------------------------------------------------------- -->
								<div class="col-md-6">
									<div class="row">
									
										<div class="col-md-2"></div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="email">이메일</label> 
												<input type="email" class="form-control" name="memberEmail" id="email" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group pt-5">
												<button type="button" id="certificate" class="btn btn-primary checkBtn">인증 확인</button>
											</div>
										</div>
										
									</div>
								</div>
						<!-- ------------------------------------------------------------------- -->
						</div>
						
						
						<div class="row justify-content-center">
							<div class="col-md-5 mt-5">
								<div class="form-group">
									<button type="submit" class="btn btn-primary form-control">NEXT</button>
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
				"email": false,
				"check": false
			};
	 
	var $email = $("#email");
	var $check = $("#certificate");

	// 인증 검사
	$check.on("click", function(){
		signUpCheck.check = true;
		
		if($email.val().trim().length == 0){
			
			swal({
				  title: "이메일을 입력해주세요.",
				  icon: "info",
				  button: "닫기",
				});
			$email.focus()
			signUpCheck.email = false;
			
		}else{

			$.ajax({
				url : "certificate",
				data : {"memberEmail": $email.val()},
				type : "GET",
				dataType : "JSON",
				success : function(result){
					console.log(result)
					
					var title;
					var text;
					var icon;
					
					if(result == null){
						title = "이메일 확인";
						text = "등록되지 않은 이메일 입니다.";
						icon = "error";
						signUpCheck.email = false;
					  
					}else{
						
						if(result.authCheck == 'N'){
							title = "인증 확인";
							text = "인증 메일을 확인해 주세요.";
							icon = "info";
							signUpCheck.email = false;
							
						}else if(result.authCheck == 'Y'){
							title = "인증 완료";
							text = "회원가입을 진행해주세요.";
							icon = "success";
							signUpCheck.email = true;
							
						}else{
							title = "중복된 이메일";
							text = "이미 가입된 이메일 입니다.";
							icon = "error";
							signUpCheck.email = false;
						}
					}
					swal({
						  title: title,
						  text : text,
						  icon: icon,
						  button: "닫기",
						});
					
				}, error : function(){
					console.log("Ajax 통신 실패");
				}
			});
			
		}
		
	});
	
	function validate(){

		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				
				var msg;
				switch(key){
				case "email" : msg = "이메일을 확인해주세요"; break;
				case "check" : msg = "인증 확인버튼을 클릭해주세요."; break;	
				}
				
				swal({
					  title: "인증 확인",
					  text : msg,
					  icon: "error",
					  button: "닫기",
					});
				
				return false;
			}
		}

	};
	</script>

</body>
</html>