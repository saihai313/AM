<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
	#login label{
		font-family: 'S-CoreDream-6Bold' !important;
		color: rgba(0, 0, 0, 0.8) !important;
		font-size: small !important;
	}
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
    <section class="ftco-section bg-light" id="login">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center">
			
				<div class="col-md-4" >
					<a class="mb-2" href="${contextPath}">
						<img src="${contextPath}/resources/images/main_logo.png" width="80%" class="mx-auto d-block"> 
					</a>
					<form action="loginAction" class="appointment mt-5">
						<div class="row">
						
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" name="memberEmail" class="form-control" placeholder="이메일">
								</div>
							</div>
							
							<div class="col-md-12 mb-1">
								<div class="form-group">
									<input type="text" name="memberPwd" class="form-control" placeholder="비밀번호">
								</div>
							</div>
							
							<div class="col-md-12 mb-2">
								<div class="form-group">
									<label>
										<input type="checkbox" name="saveE" class="mr-2" 
										
											<c:if test="${!empty cookie.saveId.value}">
													checked
												</c:if>
										
										>아이디 저장
									</label>
								</div>
							</div>

							<div class="col-md-12">
								<div class="form-group">
									<button type="submit" class="btn btn-primary py-3 px-4">LOGIN</button>
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