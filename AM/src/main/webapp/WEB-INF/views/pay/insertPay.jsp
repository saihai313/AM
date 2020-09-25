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

	#inputTable{
		width:1100px;
	}
	
	#notLogin{
		width: 100%;
		height: 800px;
		line-height: 600px;
		text-align: center;
	}
	
	#outer{
		/* background-color: #d7ebc2; */
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
			
			<div class="container board-list">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="wrapper px-md-4">
							<div class="row no-gutters">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
								         <!--  	<select class="form-control" style="width: 120px; display:inline-block;">
								          	
								          	</select>
								          -->
								        
										<form method="POST" action="insertPayAction" name="contactForm" class="contactForm mt-5" 
													style="font-family: 'S-CoreDream-6Bold';" onsubmit="return validate();">
											
											<div class="row">
													
													
												<div class="col-md-6">
													<div class="form-group">	
										        		<span class="label">등록일</span> 
										        		<input  type="date" class="form-control" name="payDate" id="payDate">
										        	</div>
										       	</div> 
										        
										        <div class="col-md-6">
										        	<div class="form-group">
														<div class="label" id="selectEmployee">
									          				<div class="subheading">직원선택</div>
										        		</div>
										        	</div>	
								        		</div>
											
											
											
											
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payPayment">급여일</label>
														<span id="paymentCheck"></span> 
														<input
															type="text" class="form-control" name="payPayment" id="payPayment"
															placeholder="일" >
															
													</div>
												</div>
												
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payTime">총 근무시간</label> <input
															type="text" class="form-control" name="payTime" id="payTime"
															placeholder="시간">
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payDay">총 근무 일수</label> <input
															type="text" class="form-control" name="payDay" id="payDay"
															placeholder="일">
													</div>
												</div>
												
												
												
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="payExtra">주휴수당</label> <input
															type="text" class="form-control" name="payExtra" id="payExtra"
															placeholder="원" >
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="radio">
														<label class="label">세금</label><br>
										                <input type="radio" class="radio" id="tax3" name="tax" value="0.033"> 3.3%<br>
										                <input type="radio" class="radio" id="taxN" name="tax" value="0"> 미적용
										                
										            </div>
									            </div>
									            
									            
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="paySal">총 지급액</label> <input
															type="text" class="form-control" name="paySal" id="paySal"
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
	/* @ */
		
		var $select = $("<select>").addClass("form-control").css({"width":"120px", "display":"inline-block", "margin-top":"8px"}).attr("name","memberNo");
		var $option;
		
		// 옵션 벨류 값
		var memberNo = "";
		
		// 총 근무일수, 총 근무시간 담을 변수 선언
		var $payTime;
		var $payDay;
		var $paySal;
		var $payExtra;
	
		/* 알바생 이름, 번호 가져오기 */
		$(function(){
			$.ajax({
				url:"selectEmployeeList/${loginEmployer.storeNo}",
				dataType:"JSON",
				success:function(eList){
					console.log(eList);
					$select.append($("<option>").text("선택").attr("selected", true));
					$.each(eList, function(index, item){
						
						$option = $("<option>").text(item.memberName).attr("value", item.memberNo);
						
						console.log("option : " + $option.val());
						
						$select.append($option);
					});
					// div
					$("#selectEmployee").append($select);
				}, error: function(){
					console.log("ajax 통신 실패");
				}
			});
			
			
			// selected 된 알바생 이번달 총 근무시간, 총 근무일수 조회!
			$select.on("click", function(){
				
				var payDate = $("#payDate").val();
				console.log("1 : " + payDate);
				
				memberNo = $(this).prop("seleted",true).val();
				
				$.ajax({
					url:"selectEmployeeWork",
					data:{"memberNo": memberNo, "payDate":payDate},
					dataType : "JSON",
					success:function(wc){
						console.log(wc);
						if(wc != null){
							$payDay = $("#payDay").val(wc.workStart);
							$payTime = $("#payTime").val(wc.workEnd);
							
							console.log($payDay + " + " + $payTime);
							
						}else{
							payDay = $("#payDay").val(0);
							payTime = $("#payTime").val(0);
						}
					}, error:function(){
						console.log("ajax 통신 실패");	
					}
				});
				
				// 주휴수당에 필요한 알바생의 주당 총 근무 시간 조회
				
				var payCreateDate = $("#payDate").val();
				
				$.ajax({
					url : "selectOnePay",
					data : {"memberNo" : memberNo, "payCreateDate": payCreateDate},
					dataType : "json",
					success : function(pay){
						if(pay != null){
							$paySal = $("#paySal").val(pay.paySal);
							$payExtra = $("#payExtra").val(pay.payExtra);
							
							$("input[name=tax]").on("change",function(){
								$paySal = $("#paySal").val("");
								if($("#tax3").prop("checked")){
									$("#paySal").val(Math.floor(pay.paySal - (pay.paySal * $(this).val())));
								}else{
									$("#paySal").val(pay.paySal);
								}
							});
							
		
							
						}else{
							$paySal = $("#paySal").val(0);
							$payExtra = $("#payExtra").val(0);
						}
					}, error : function(){
						console.log("ajax 통신 실패");
					}
				});
			});
		});
		
		
		var check = { 
				"payPayment":false,
			};
		
		var $payP = $("#payPayment");
			
		$payP.on("input", function(){
			var regExp = /^\d{1,}$/;
			
			if(!regExp.test($(this).val())){
				check.payPayment = false;
			}else{
				check.payPayment = true;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
			}
			
		});
		
		
		
		
		function validate(){

		
			for(var key in check){
				if(!check[key]){
					
					var msg;
					switch(key){
					case "payPayment" : msg="급여일이";  break;
					
					}
					console.log(msg)
					
					swal({
						  title: msg + " 유효하지 않습니다.",
						  icon: "error",
						  button: "닫기"
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