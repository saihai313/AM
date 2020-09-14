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
	
	#notLogin{
		width: 100%;
		height: 800px;
		line-height: 600px;
		text-align: center;
	}
	
	
	
</style>

 
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<c:choose>
	
	<c:when test="${empty loginMember }">
		<!--  로그인 x -->
		<div id="notLogin">로그인 후 이용해주세요</div>
		</c:when>
		
		<c:otherwise>
		<!-- 로그인 o -->
	
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
				<li><a href="${contextPath}/management/payStubList">급여 명세서</a></li>
				<li><a href="${contextPath}/management/requestPayStub">정정신청</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->
			
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="wrapper px-md-4">
							<div class="row no-gutters">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
								         <!--  	<select class="form-control" style="width: 120px; display:inline-block;">
								          	
								          	</select>
								          -->
								        
										<form method="POST" action="insertPayAction" name="contactForm" class="contactForm mt-5">
										
											<div class="col-md-12 heading-section fadeInUp" id="selectEmployee">
								          		<span class="subheading">직원선택</span>
								        	</div>
										
											<div class="row">
											
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payDay">급여일</label> <input
															type="text" class="form-control" name="payDay" id="payDay"
															placeholder="일" >
															
													</div>
												</div>
												<!-- <div class="col-md-6">
													<div class="form-group">
														
															
													</div>
												</div> -->
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payTime">총 근무시간</label> <input
															type="text" class="form-control" name="payTime" id="payTime"
															placeholder="시간">
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="totalDay">총 근무 일수</label> <input
															type="text" class="form-control" name="totalDay" id="totalDay"
															placeholder="일">
													</div>
												</div>
												
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="vacaMoney">주휴수당</label> <input
															type="text" class="form-control" name="vacaMoney" id="vacaMoney"
															placeholder="원" >
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="radio">
														<label class="label">세금</label><br>
										                <input type="radio" id="tax3" name="tax" value="3.3%"> 3.3%<br>
										                <input type="radio" id="taxN" name="tax"> 미적용
										                
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
	     </c:otherwise>
	
	</c:choose>

	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
	<script>
	
	
		/* select-option에 등록할 알바생 정보 가져오기 */
		$(function(){
			$.ajax({
				url:"selectEmployee/${loginMember.memberNo}",
				dataType:"JSON",
				success:function(eList){
					console.log(eList);
					var $select = $("<select>").addClass("form-control").css({"width":"120px", "display":"inline-block"});
					
					$.each(eList, function(index, item){
						
						var $option = $("<option>").text(item.memberName).attr("value", item.memberNo);
						
						console.log($option.val());
						
						$select.append($option)
						
					});
					
					// div
					$("#selectEmployee").append($select);
						
						
				}, error: function(){
					console.log("ajax 통신 실패");
				}
				
			});
		
		
		});
		
		
		
			
			/* 주휴수당 계산
				1주 40시간 미만 주휴수당
				근로시간 / 40 * 8 * 약정시급
				
				1주 40시간 이상 주휴수당
				8 * 약정시급
			*/
			
			
			/* 급여 계산하기 */
			
			var payTime = $("#payTime"); 	 // 일일 근무시간
			var partMoney = $("#partMoney");  // 시급
			var totalDay = $("#totalDay");  // 한달 근무 일수
	       	
			var tax3 = $("#tax3");         // 세금 3.3%
			
			
			// 주휴수당 함수
			
			// function vacaMoneyCal(){}
			$("#payTime, #partMoney").on("input", function(){
				if(Number(payTime.val()) * 7 < 40){
					vacaMoney = (Number(payTime.val()) / 40) * 8 * Number(partMoney.val());
				}else{
					vacaMoney = 8 * Number(partMoney.val());
				}
				
				$("#vacaMoney").val(vacaMoney);
			});
			
			
			
			// 총 급여 구하기
			
			$("#tax3").on("click", function(){
				
			});
		
		
		
		
		
		
		
	
	</script>

</body>
</html>