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
					<h2>회원정보 수정</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1 pl-0">
				<li class="on"><a href="${contextPath}/member/updateMember">회원정보
						수정</a></li>
				<li><a href="${contextPath}/member/updatePwd">비밀번호 수정</a></li>
				<li><a href="${contextPath}/member/secession">회원 탈퇴</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->


			<div class="row justify-content-center">
				<div class="col-md-7">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form method="POST" action="updateMemberAction" class="contactForm mt-5" name="updateForm" onsubmit="return validate();">

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
										
										<div class="col-md-4">
											<div class="form-group">
												<label class="label" for="store">근무지</label> 
												<input type="text" class="form-control" value="${loginStore.storeName }" readonly>
											</div>
										</div>

										<div class="col-md-8">
											<div class="form-group">
												<label class="label" for="enroll">근무지 주소</label> 
												<input type="text" class="form-control" value="${loginStore.storeAddress }" readonly>
											</div>
										</div>
										
										<c:set var="phone" value="${fn:split(loginMember.memberPhone, '-')}"/>
										<div class="col-md-5">
											<div class="form-group">
												<label class="label" for="phone">전화번호</label>

												<div class="form-row">
													<div class="col-md-4">
														<div class="form-group">
															<select class="form-control" id="phone1" name="phone1" required>
																<option <c:if test="${phone[0]=='010' }">selected</c:if>>010</option>
																<option <c:if test="${phone[0]=='011' }">selected</c:if>>011</option>
																<option <c:if test="${phone[0]=='016' }">selected</c:if>>016</option>
																<option <c:if test="${phone[0]=='017' }">selected</c:if>>017</option>
																<option <c:if test="${phone[0]=='019' }">selected</c:if>>019</option>
															</select>
														</div>
													</div>
							
													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone" id="phone2" maxlength="4" name="phone2"  value="${phone[1] }" required>
														</div>
													</div>

													<div class="col-md-4">
														<div class="form-group">
															<input type="number" class="form-control phone" id="phone3" maxlength="4" name="phone3"  value="${phone[2] }" required>
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
	
	var phone = true;
	
	// ------------------- 전화번호 ---------------------------
 	$(".phone").on("input",function(){
 		
		if ($(this).val().length > $(this).prop("maxLength")){
		  $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
		}
		    var regExp1 =  /^\d{3,4}$/; 
		    var regExp2 =  /^\d{4,4}$/; 
		    
		    if(!regExp1.test($("#phone2").val()) || !regExp2.test($("#phone2").val())){
		    	$("#checkPhone").text("유효하지 않은 전화번호").css("color","red");
				phone = false;
		  }else{
				$("#checkPhone").text("유효한 전화번호").css("color","green");
				phone = true;
		  }
	});
	
	// ------------------- submit 동작 ---------------------------
	function validate(){
		
		if(phone == false){
			swal({
				  title: " 전화번호가 유효하지 않습니다.",
				  icon: "error",
				  button: "닫기",
				});
			return false;
		}
		

		$memberPhone = $("<input>", {type : "hidden", name : "memberPhone",
			value : $("#phone1").val()+ "-" + $("#phone2").val()+ "-" +$("#phone3").val()});
		
		$("form[name='updateForm']").append($memberPhone);
	}
	
	</script>

</body>
</html>