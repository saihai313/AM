<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>급여 명세서</title>
<style>

	#payView tr{
		border-bottom: 1px solid #F5F4F0;
		font-family: 'S-CoreDream-4Regular';
	}
	
	#total{
		font-family: 'S-CoreDream-4Regular';
		font-weight: bold;
	}
	
	#total span:first-child{
		margin-right: 2em;
	}
	
	#payView td:first-child{
		width: 30%;
		text-align: right;
	}
	
	#payView td:last-child{
		width: 70%;
		text-align: center;
	}
	
	#backToList{
		font-family: 'S-CoreDream-8Heavy';
		font-weight: bold;
		color: #589168 !important;
	}
	
	#complete *{
		padding: 1em 8em 1em 8em;
		font-family: 'S-CoreDream-8Heavy';
		font-weight: bold;
		background-color: #F5F4F0 !important;
		vertical-align: middle;
	}
	
	.viewBtn{font-family: 'S-CoreDream-6Bold';}
	
	#staticBackdropLabel{
		font-family: 'S-CoreDream-8Heavy';
		font-weight: bold;
	}
	
	#modalTable{
		font-size: small; 
		border-bottom: 1px solid #F5F4F0;
	}
	
	#payView textarea:focus {border: 1px solid #FEEBB6;}
	
	#corrCompleteLine{
		font-family: 'S-CoreDream-8Heavy';
		background-color: #589168;
		color: white;
	}
	
	.viewTable{font-size: small;}
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
	
	
    <section class="ftco-section" id="payView">
    	<div class="container">
  
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">paystub</span>
					<h2>급여 명세서</h2>
				</div>
			</div>
				
			<div class="row justify-content-center p-5 col-md-12 mx-auto" style="border: 50px solid #F5F4F0">
					
					<!-- 제목  -->
					<div class="col-md-10 text-center mb-5">
						<fmt:formatDate var="payTitle" value="${payView.payCreateDate }" pattern="YYYY년  MM월 명세서"/>
               			<h1 style="font-weight: bold;">${payTitle }</h1>
						<hr>
					</div>
					
					<div class="row">
					
					<!-- 내용  -->
					<table class="col-md-5 ml-5 table table-bordered mx-auto viewTable">
						<tr>
							<td>이름</td> 
							<td>${loginMember.memberName }</td>
							
						</tr>
						<tr>
							<td>근무 가게</td>
							<td>${loginStore.storeName }</td>
						</tr>
						<tr>
							<td>급여지급일</td>
							<td>${payView.payCreateDate }</td>
						</tr>
						<tr>
							<td>총 근무시간</td>
							<td>${payView.payTime}</td>
						</tr>
						<tr>
							<td>총 근무일수</td>
							<td>${payView.payDay }</td>
						</tr>
						<tr>
							<td>주휴수당</td>
							<td>${payView.payExtra }</td>
						</tr>
					</table>

					<table class="col-md-6 table mx-auto viewTable text-center">
						<thead class="thead-light">
							<tr>
								<th width="25%">근무일</th>
								<th width="25%">시작 시간</th>
								<th width="25%">종료 시간</th>
								<th width="25%">근무시간</th>
							</tr>
						</thead>
						 <tbody>
		                	<c:choose>
		                	
		                		<c:when test="${empty payWorkList}">
		                			<tr><td colspan="4">존재하는 근무 스케줄이 없습니다.</td><tr>
		                		</c:when>
		                		
		                		<c:otherwise>
		                			<c:forEach var="work" items="${payWorkList}">
		                				<tr>
		                					<td class="text-center">${work.workDay }</td>
		                					<td>${work.workStart }</td>
		                					<td>${work.workEnd  }</td>
		                					<td>${work.workEnd - work.workStart }</td>
		                				</tr>
		                			</c:forEach>
		                		</c:otherwise>
		                		
		                	</c:choose>
		                	
		                </tbody>
					</table>
					
					<div class="col-md-12 row mt-5 mb-5 justify-content-center" id="total-sal">
						<h3 id="total">
							<span>총 급여</span>
							<span>${payView.paySalary } ₩</span>
						
						</h3>
					</div>
					
					<div class="col-md-10 row mt-5 mb-3 pt-3 justify-content-center  mx-auto " id="corrCompleteLine">
						<p>급여 정정이 신청된 명세서입니다.</p>
					</div>
					
					<c:choose>
						<c:when test="${payView.payStatus == 'W' }">
							<div class="col-md-10 row mt-5 mb-3 mx-auto">
								<div class="col-md-6">
									<button type="button" id="confirm" class="btn btn-primary form-control m-1 viewBtn">확인 완료</button>
								</div>
								<div class="col-md-6">
									<button type="button" id="confirm2" class="btn btn-primary form-control m-1 viewBtn"
									        data-toggle="modal" data-target="#staticBackdrop">정정 신청</button>
								</div>
							</div>
						</c:when>
						<c:otherwise/>
					</c:choose>
					
					<div class="col-md-10 mx-auto">
						<a id="backToList" class="btn float-right" href="<c:url value="../payList">
							<c:param name="cp" value="${param.cp }"/></c:url>">
							목록으로
						</a>
					</div>

				</div>
				
			
				<!-- Modal ------------------------------------------------------------------------------->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">급여 정정 신청</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        
				        <div class="container-fluid">
				        
								
						      <table class="table table-borderless table-sm col-md-12" id="modalTable">
								<tr>
									<td>급여지급일</td>
									<td>${payView.payCreateDate }</td>
								</tr>	
								<tr>
									<td>명세서명</td>
									<td>${payTitle }</td>
								</tr>
								<tr>
									<td>TO</td>
									<td>${loginStore.storeName }</td>
								</tr>
								<tr>
									<td>FROM</td>
									<td>${loginMember.memberName }</td>
								</tr>
							
						      </table>
						      
						     <div class="col-md-12">
								<div class="form-group">
									<textarea name="correctionContent" id="correctionContent" cols="30" rows="7" class="form-control" style="resize: none;"></textarea>
								</div>
							</div>
						   
						  </div>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary viewBtn" data-dismiss="modal">닫기</button>
				        <button type="button" id="correction" class="btn btn-primary viewBtn">신청하기</button>
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
    	
	    $(function(){
	    	
	    	var payStatus = "${payView.payStatus}";
	    	if(payStatus != 'N' ){
	    		$("#corrCompleteLine").hide();
	    	}else{
	    		$("#corrCompleteLine").show();
	    	}
	    
	    	// 확인 완료
			$("#confirm").on("click", function(){
				
				swal({
					  title: "급여에 이상이 없습니까?",
					  text: "급여 확인 완료 후, 급여 정정신청이 불가합니다.",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  
						$.ajax({
							url : "payConfirm/${payView.payNo}",
							type : "GET",
							success : function(result){
								console.log(result);
								
								if(result > 0){
									$("#confirm").remove();
									$("#confirm2").remove();
									
									swal("급여 확인완료!", {icon: "success",});
								}
								
							}, error : function(){
								swal("급여 확인실패!", {icon: "error",});
							}
						}); 
						  
					   
					  } else {
					    swal("급여를 다시 한번 살펴봐주세요.");
					  }
					});
				
				});
	    	
	    	
			// 정정 신청
			$("#correction").on("click", function(){
				
				$.ajax({
					url : "payCorrection/${payView.payNo}",
					data : {"correctionContent": $("#correctionContent").val()},
					type : "GET",
					success : function(result){
						console.log(result);
						
						if(result > 0){
							$("#confirm").remove();
							$("#confirm2").remove();
							$("#corrCompleteLine").show();
							
							$("#staticBackdrop").modal("hide");
							
							swal({
								  title: "정정 신청 완료",
								  text: "사장님이 정정 신청을 확인할 때까지 기다려주세요.",
								  icon: "info",
								  button: "닫기",
								})
								
						}
						
					}, error : function(){
						console.log("급여 정정 실패");
					}
				
				});
			});
			
			
		});
    	
    	
	</script>

</body>
</html>