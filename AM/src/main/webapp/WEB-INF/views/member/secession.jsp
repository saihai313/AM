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
					<h2>회원 탈퇴</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1 pl-0">
				<li><a href="${contextPath}/member/updateMember">회원정보 수정</a></li>
				<li><a href="${contextPath}/member/updatePwd">비밀번호 수정</a></li>
				<li class="on"><a href="${contextPath}/member/secession">회원 탈퇴</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->
			
			<div class="row justify-content-center">
				<div class="col-md-7">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form method="POST" action="secessionAction" class="contactForm mt-5" name="updateForm" onsubmit="return validate();">

									<div class="row">
									
										<div class="col-md-4">
											<div class="form-group">
												<label class="label" for="name">이름</label> 
												<input type="text" class="form-control" value="${loginMember.memberName }" readonly>
											</div>
										</div>

										<div class="col-md-8">
											<div class="form-group">
												<label class="label" for="email">이메일</label> 
												<input type="email" class="form-control" value="${loginMember.memberEmail }" readonly>
											</div>
										</div>
										
										<div class="col-md-5 mb-3">
											<div class="form-group">
												<label class="label" for="nowPwd">현재 비밀번호</label> 
												<input type="password" class="form-control" name="memberPwd" id="memberPwd" placeholder="Now Password">
											</div>
										</div>
										<div class="col-md-7 mb-3"></div>
											
											
						<div class="panel panel-default col-md-12">

							<div class="panel-body">
								<div class="form-group pull-left">
									<label class="label"> 회원 탈퇴 약관 </label>
									<div class="col-xs-12 mt-2">
										<textarea class="form-control" readonly rows="10" cols="100">
제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4
</textarea>
									</div>
									<div class="checkbox pull-right">
										<div class="custom-checkbox">
											<div class="form-check">
												<input type="checkbox" name="agree" id="agree"
													class="form-check-input custom-control-input"> <br>
												<label class="form-check-label custom-control-label"
													for="agree">위 약관에 동의합니다.</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
									
										<div class="col-md-12 mt-5">
											<div class="form-group">
												<input type="submit" value="SECESSION" class="btn btn-primary form-control">
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
	
	// ------------------- submit 동작 ---------------------------
	function validate(){
		
		if($("#memberPwd").val().trim().length == 0){
			swal({
			  title: "현재 비밀번호를 입력해주세요.",
			  icon: "info",
			  button: "닫기",
			});
			return false;
			
		}else{
			
			if(!$("#agree").prop("checked")){
				swal({
					  title: "약관에 동의해 주세요.",
					  icon: "info",
					  button: "닫기",
					});
				return false;
				
			}else{
				return confirm("정말로 탈퇴하시겠습니까?");
			}
		}

	};
	
	
	
	
	</script>

</body>
</html>