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
				<div class="col-md-6 half mt-5">
					<h2 class="mb-5 text-center">AM 고객 지원센터</h2>
					<form method="POST" action="contactAction" class="appointment mt-5" name="contact" onsubmit="return validate();">
						<div class="row">
						
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" id="name" name="guestName" placeholder="이름">
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control" id="email" name="guestEmail" placeholder="이메일">
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon">
												<span class="fa fa-chevron-down"></span>
											</div>
											<select name="guestQuestion" id="question" class="form-control">
												<option value="none">문의 유형</option>
												<option value="회원가입">회원가입</option>
												<option value="사이트 이용">사이트 이용</option>
												<option value="건의 사항">건의 사항</option>
												<option value="기타 문의">기타 문의</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="guestMessage" id="message" cols="30" rows="7" class="form-control"
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
	
	<script>
	 var check = { 
				"name":false,
				"email":false,
				"question":false,
				"message":false
			};
		 
		
	function validate(){
		
		
		if($("#name").val().trim().length == 0){
			check.name = false;
		}else{
			check.name = true;
		}
		
		if($("#email").val().trim().length == 0){
			check.email = false;
		}else{
			check.email = true;
		}
		
		if($("#question").val() == "none"){
			swal({
				  title: "문의 유형을 선택해주세요.",
				  icon: "info",
				  button: "닫기",
				});
			check.question = false;
		}else{
			check.question = true;
		}
		
		if($("#message").val().trim().length == 0){
			check.message = false;
		}else{
			check.message = true;
		}
		
		for(var key in check){
			if(!check[key]){
				
				var msg;
				switch(key){
				case "name" : msg="이름을 ";  break;
				case "email" : msg="이메일을 ";  break;
				case "question" : msg="문의 유형을 ";  break;
				case "message" : msg="문의 내용을 ";  break;
				}
				
				swal({
					  title: msg + "확인해주세요.",
					  icon: "error",
					  button: "닫기",
					});
				var el = "#"+key;
				$(el).focus();
				return false;
				
			}
		}
		return true;
	};
	
	</script>

</body>
</html>