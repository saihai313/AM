<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
								<form method="POST" action="updatePwdAction" class="contactForm mt-5" name="updateForm" onsubmit="return validate();">

									<div class="row">
									
										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="name">이름</label> 
												<input type="text" class="form-control" value="${loginMember.memberName }" readonly>
											</div>
										</div>

										<div class="col-md-7">
											<div class="form-group">
												<label class="label" for="email">이메일</label> 
												<input type="email" class="form-control" value="${loginMember.memberEmail }" readonly>
											</div>
										</div>
										
										<div class="col-md-5 mb-5">
											<div class="form-group">
												<label class="label" for="nowPwd">현재 비밀번호</label> 
												<input type="password" class="form-control" name="nowPwd" id="nowPwd" placeholder="Now Password">
											</div>
										</div>
										<div class="col-md-7 mb-5"></div>
										
									
										
										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd1">새 비밀번호</label> 
												<input type="password" class="form-control" name="newPwd" id="pwd1" placeholder="Password">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkPwd1">&nbsp;</span>
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="pwd2">새 비밀번호 확인</label> 
												<input type="password" class="form-control" id="pwd2" placeholder="Password Check">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group pt-5 checkSpan">
												<span id="checkPwd2">&nbsp;</span>
											</div>
										</div>


										<div class="col-md-12 mt-5">
											<div class="form-group">
												<input type="submit" value="CHANGE" class="btn btn-primary form-control">
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
	
	<script>
	 var signUpCheck = { 
			 	"nowPwd":false,
				"pwd1":false,
				"pwd2":false
			};
		 
		var $nowPwd = $("#nowPwd");
		var $pwd1 = $("#pwd1");
		var $pwd2 = $("#pwd2");
		var $pwd = $("#pwd1, #pwd2");
		
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
	
	// ------------------- submit 동작 ---------------------------
	function validate(){

		if($("#nowPwd").val().trim().length == 0){
			signUpCheck.nowPwd = false;
		}else{
			signUpCheck.nowPwd = true;
		}
		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				
				var msg;
				switch(key){
				case "nowPwd" : msg="현재 비밀번호를 ";  break;
				case "pwd1" : msg="새 비밀번호를 ";  break;
				case "pwd2" : msg="새 비밀번호 확인을 ";  break;
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
	}
	
	
	</script>

</body>
</html>