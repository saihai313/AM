<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서</title>
<style>
	 #list-table * {font-size: small;}
	 #list-table td {cursor: pointer;}
	 #correctionList thead {background-color: #F5F4F0; color: rgba(0, 0, 0, 0.8);}
	 #staticBackdropLabel, #corrModalLabel {font-family: 'S-CoreDream-8Heavy'; font-weight: bold;}
	.modalTable * , #correctionList textarea {font-size: small !important; font-family: 'S-CoreDream-4Regular';}
	.modalTable td:first-child {width: 50%;}
	#payCorrTable tr , #payCorrReTable tr {border-bottom: 1px solid #F5F4F0;}
	#payTitle {text-align: center; font-weight: bold; font-family:'S-CoreDream-6Bold'; font-size: larger;}
	.viewBtn{font-family: 'S-CoreDream-6Bold';}
	.payTitle{text-align: center; font-weight: bold; font-size: 1em !important;}
	#correctionList textarea:focus {border: 1px solid #FEEBB6;}
	
}
	
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
    <section class="ftco-section" id="correctionList">
    	<div class="container">
    	<div class="overlay"></div>
    	
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">payCorrction</span>
					<h2>급여 정정 신청 목록</h2>
				</div>
			</div>
			
			<table class="mx-auto text-center col-md-12 table table-hover" id="list-table">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="15%">신청일</th>
						<th width="30%">해당 명세서명</th>
						<th width="15%">신청 결과</th>
						<th width="15%">상태</th>
					</tr>
				</thead>
				 <tbody>
                	<c:choose>
                	
                		<c:when test="${empty correctionList}">
                			<tr><td colspan="5">존재하는 급여 정정 신청이 없습니다.</td><tr>
                		</c:when>
                		
                		<c:otherwise>
                			<c:forEach var="correction" items="${correctionList }">
                				<tr id="${correction.correctionNo }">
                					
                					<td>${correction.tempNo }</td>
                					
                					<td>${correction.correctionCreateDate }</td>
                					
                					<td>
										<fmt:formatDate var="payTitle" value="${correction.correctionCreateDate }" pattern="YYYY년  MM월 명세서"/>
               							${payTitle }
                					</td>
                					
                					<td>
                						<c:choose>
                							<c:when test="${correction.correctionStatus == 'Y' }">
                								정정 승인
                							</c:when>
                							<c:when test="${correction.correctionStatus == 'N' }">
                								정정 반려
                							</c:when>
                							<c:otherwise/>
                						</c:choose>
                					</td>
                						
                					<td>
                						<c:choose>
                							<c:when test="${correction.correctionResult == 'Y' }">
                								확인 완료
                							</c:when>
                							<c:when test="${correction.correctionResult == 'N' }">
                								정정 재신청
                							</c:when>
                							<c:otherwise/>
                						</c:choose>
                					</td>
                				</tr>
                			</c:forEach>
                		</c:otherwise>
                		
                	</c:choose>
                	
                </tbody>
			</table>
			
			<!-- Modal ------------------------------------------------------------------------------->
				<div class="modal fade bd-example-modal-lg" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">급여 정정 신청 확인</h5>
				        <button type="button" class="close dis" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        
				        <div class="container-fluid">
							
							<div class="mx-auto pr-5 pl-5 pt-3 pb-3 col-md-6" style="border: 30px solid #F5F4F0">
							      <table class="mx-auto table table-borderless table-sm col-md-12 p-5 modalTable">
									<tr>
										<td colspan="2" class="payTitle pb-3" style="color: #589167">급여 명세서</td>
									</tr>
									<tr>
										<td>급여 지급일</td>
										<td id="payCreateDate"></td>
									</tr>
									<tr>
										<td>총 근무시간</td>
										<td id="payTime"></td>
									</tr>
									<tr>
										<td>총 근무일수</td>
										<td id="payDay"></td>
									</tr>
									<tr>
										<td>주휴수당</td>
										<td id="payExtra"></td>
									</tr>
									<tr>
										<td colspan="2" id="paySal" class="payTitle"></td>
									</tr>
								</table>
							</div>
							
							<hr>
							
							<div id="payCorrWrapper" class="row justify-content-center">
							
								<div id="payCorr" class="col-md-6">
									<table class="mx-auto table table table-borderless table-sm col-md-10 modalTable" id="payCorrTable">
										<tr>
											<td colspan="2" class="payTitle pb-3" style="color: #589167">급여 정정 신청</td>
										</tr>
										<tr id="createDT">
											<td>정정 신청일</td>
											<td id="correctionCreateDate"></td>
										</tr>
										<tr id="modifyDT">
											<td>정정 수정일</td>
											<td id="correctionModifyDate"></td>
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
											<textarea name="correctionContent" id="correctionContent" cols="30" rows="7" 
											class="form-control" style="resize: none;" readonly="readonly"></textarea>
										</div>
									</div>
								</div>
								
								
								<div id="payCorrRe" class="col-md-6">
									<table class="mx-auto table table table-borderless table-sm col-md-10 modalTable" id="payCorrReTable">
										<tr>
											<td colspan="2" class="payTitle pb-3" style="color: #589167">급여 반려 이유</td>
										</tr>
										<tr id="reCreateDate">
											<td>반려 작성일</td>
											<td id="reDate"></td>
										</tr>
										<tr>
											<td>TO</td>
											<td>${loginMember.memberName }</td>
										</tr>
										<tr>
											<td>FROM</td>
											<td>${loginStore.storeName }</td>
										</tr>
										<tr id="reBlank" style="color: transparent;">
											<td>공백</td>
											<td>공백</td>
										</tr>
								     </table>
								      
								     <div class="col-md-12">
										<div class="form-group">
											<textarea name="reContent" id="reContent" cols="30" rows="7" 
											class="form-control" style="resize: none;" readonly="readonly"></textarea>
										</div>
									</div>
								</div>
								
							</div>
							
					
						  </div>
				        
				      </div>
				      <div class="modal-footer">
		
				        <button type="button" id="corrUpdate" class="btn btn-primary viewBtn">수정</button>
				        <button type="button" id="corrDelete" class="btn btn-primary viewBtn">삭제</button>
				        
				        <button type="button" id="corrUpComplete" class="btn btn-primary viewBtn">수정완료</button>
				        
						<button type="button" id="corrComplete" class="btn btn-primary viewBtn">확인 완료</button>
						<button type="button" id="corrReCorr" class="btn btn-primary viewBtn">정정 재신청</button>
						
						<button type="button" class="btn btn-secondary viewBtn dis" data-dismiss="modal">닫기</button>
						
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<!-- Modal(재신청용) ------------------------------------------------------------------------------->
				<div class="modal fade" id="corrModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="corrModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="corrModalLabel">급여 정정 재신청</h5>
				        <button type="button" class="close dis" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        
				        <div class="container-fluid">
						     <table class="table table-borderless table-sm col-md-12" id="modalTable">
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
									<textarea name="corrReContent" id="corrReContent" 
									style="resize: none;" cols="30" rows="7" class="form-control"></textarea>
								</div>
							</div>
						   
						  </div>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary viewBtn dis" data-dismiss="modal">닫기</button>
				        <button type="button" id="correction" class="btn btn-primary viewBtn">신청하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
			<!-- page ------------------------------------------------------------------------------->
			<div class="row mt-5">
				<div class="col text-center">
            		<div class="block-27">
		            	<ul>
		            	
			            	<c:if test="${pInfo2.currentPage > pInfo2.pagingBarSize }">	
				                <li><a href="?cp=1">&lt;&lt;</a></li>
				                
				                <li>
				                	<fmt:parseNumber var="operand1" value="${(pInfo2.currentPage - 1) / pInfo2.pagingBarSize }" integerOnly="true"/>
				                	<c:set var="prev" value="${operand1 * pInfo2.pagingBarSize }"></c:set>
				                	
			                   		<a href="?cp=${prev }">&lt;</a>
				                </li>
			                </c:if>
		                
			                <c:forEach var="p" begin="${pInfo2.startPage }"  end="${pInfo2.endPage }">
			                	<c:choose>
			                		<c:when test="${p == pInfo2.currentPage }">
			                			<li><a class="active"><span>${p }</span></a></li>
			                		</c:when>
			                		<c:otherwise>
				                		<li><a href="?cp=${p }">${p }</a></li>
					                </c:otherwise>
					        	</c:choose>
			                </c:forEach>
		                
			                <c:if test="${pInfo2.maxPage > pInfo2.endPage }">
				                <li>
				                	<fmt:parseNumber var="operand2" value="${(pInfo2.currentPage + (pInfo2.pagingBarSize - 1)) / pInfo2.pagingBarSize}" integerOnly="true"/>
				                	<c:set var="next" value="${operand2 * pInfo2.pagingBarSize + 1 }"></c:set>
									<a href="?cp=${next }">&gt;</a>
				                </li>
				                
				                <!-- 맨 끝으로(>>) -->
				                <li><a href="?cp=${pInfo2.maxPage }">&gt;&gt;</a></li>
			                </c:if>
			                
		           		 </ul>
	           		</div>
	           	</div>
        	</div>	     
			
    	</div>
	</section>
    
    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
    
		$(function(){
	    var correctionNo;
		var payNo;
		var correctionCreateDate;
			
			// 모달 닫을 때, 새로고침
			$(".dis").on("click", function(){
				location.reload();
			});
			
			
			// 정정 반려 이유
			$("#reBlank").hide();
			$("#payCorrRe").hide();
			
			// 정정 삭제/수정/수정 완료
			$("#corrDelete").hide();
			$("#corrUpdate").hide();
			
			$("#modifyDT").hide();
			$("#corrUpComplete").hide();
			
			// 정정 신청 반려 이유 확인 후, 확인/재신청
			$("#corrComplete").hide();
			$("#corrReCorr").hide();
			
			
			// 급여 정정 신청 세부조회
			$("#list-table td").on("click", function(){
				
				correctionNo = $(this).parent().attr('id');
				correctionCreateDate = $(this).parent().children().eq(1).text();
				console.log(correctionNo + '세부');
				
				$.ajax({
					url : "correctionView",
					data : {"correctionNo": correctionNo},
					dataType: "JSON",
					type : "GET",
					success : function(map){

						if(map != null){
							
							payNo = map.pay.payNo;
							
							$("#payCreateDate").append(map.pay.payCreateDate)
							$("#payTime").append(map.pay.payTime)
							$("#payDay").append(map.pay.payDay)
							$("#payExtra").append(map.pay.payExtra)
							$("#paySal").append("총 급여&nbsp;&nbsp;&nbsp;&nbsp;" + map.pay.paySalary + " ₩")
							
							$("#correctionCreateDate").append(map.payCorr.correctionCreateDate)
							if(map.payCorr.correctionModifyDate != null){
								$("#modifyDT").show();
								$("#correctionModifyDate").append(map.payCorr.correctionModifyDate);
								$("#reBlank").show();
							}
							$("#correctionContent").append(map.payCorr.correctionContent)
							
							// 사장님 정정신청 확인 전(수정, 삭제)
							if(map.payCorr.correctionStatus == 'W'){
								$("#corrDelete").show();
								$("#corrUpdate").show();
								
								$("#payCorr").removeAttr("class");
								$("#payCorrRe").remove();
								
							// 사장님 정정신청 확인 후(반려 사유 확인)
							}else if(map.payCorr.correctionStatus == 'N'){
								$("#payCorrRe").show();
								$("#reDate").append(map.payCorrRe.corrRejectionDate)
								$("#reContent").append(map.payCorrRe.corrRejectionContent)
								
								if(map.payCorr.correctionResult == 'W'){
									$("#corrComplete").show();
									$("#corrReCorr").show();
								}
								
							}
							
							$("#staticBackdrop").modal("show");
						}
						
					}, error : function(){
						console.log("급여 정정 신청 세부조회 실패");
					}
				});
			});
			
			
			// 급여 정정 신청 삭제
			$("#corrDelete").on("click", function(){
				
				swal({
					  title: "급여 정정 신청 삭제 확인",
					  text: "급여 정정 신청 삭제 시, 급여 명세서가 확인 완료 처리됩니다.",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  
						$.ajax({
							url : "correctionDelete",
							data : {"correctionNo": correctionNo, "payNo": payNo},
							dataType: "JSON",
							type : "GET",
							success : function(result){
								
								if(result > 0){
									$("#staticBackdrop").modal("hide");
									swal("급여 정정 신청 삭제 완료!", {icon: "success",});
									location.reload();
								}
								
							}, error : function(){
								swal("급여 정정 신청 삭제 실패", {icon: "error",});
							}
						}); 
					   
					  } else {
					    swal("예정대로 급여 정정 신청이 진행됩니다.");
					  }
				});
				
			});
			
			
			// 급여 정정 신청 수정_화면
			$("#corrUpdate").on("click", function(){
				var now = new Date();
				var year = now.getFullYear();
				var month = now.getMonth() + 1;
				var date = now.getDate();
				var hour = now.getHours();
				var min = now.getMinutes();
				
				var nowDate = year+"/"+month+"/"+date+" "+hour+":"+min;
				
				$("#corrUpdate").hide();
				$("#corrDelete").hide();
				
				$("#modifyDT").show();
				$("#correctionModifyDate").text("");
				$("#correctionModifyDate").append(nowDate);
				
				$("#correctionContent").attr("readonly", false)
				$("#corrUpComplete").show();
				
			});
			
			
			// 급여 정정 신청 수정_동작
			$("#corrUpComplete").on("click", function(){
				var correctionContent = $("#correctionContent").val();
				console.log(correctionContent);
				$.ajax({
					url : "correctionUpdate",
					data : {"correctionNo": correctionNo, "correctionContent" : correctionContent, "correctionCreateDate" : correctionCreateDate},
					dataType: "JSON",
					type : "GET",
					success : function(result){
						
						if(result != null){
							
							$("#correctionContent").attr("readonly", true)
							$("#corrUpComplete").hide();
							
							$("#corrUpdate").show();
							$("#corrDelete").show();
							
							swal("급여 정정 신청 수정 완료!", {icon: "success",});
						}
						
					}, error : function(){
						swal("급여 정정 신청 수정 실패", {icon: "error",});
					}
				}); 
				
			});
			
			
			
			
			// 정정 신청 결과 확인 후, 확인 완료
			$("#corrComplete").on("click", function(){
				console.log(payNo);
				console.log(correctionNo);
				
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
							url : "payReConfirm",
							data : {"payNo": payNo, "correctionNo" : correctionNo},
							type : "GET",
							success : function(result){
								console.log(result);
								
								if(result > 0){
									$("#staticBackdrop").modal("hide");
									swal("급여 확인완료!", {icon: "success",});
									location.reload();
								}
								
							}, error : function(){
								swal("급여 확인 완료 실패!", {icon: "error",});
							}
						}); 
						  
					   
					  } else {
					    swal("급여를 다시 한번 살펴봐주세요.");
					  }
					});
				
			});
			
			// 정정 신청 결과 확인 후, 정정 재신청_화면
			$("#corrReCorr").on("click", function(){
				
				$("#staticBackdrop").modal("hide"); 
				$("#corrModal").modal("show");
			});
			
			
			// 정정 신청 결과 확인 후, 정정 재신청_동작
			$("#correction").on("click", function(){
				
				console.log($("#corrReContent").val());
				console.log(correctionNo + '재신청');
				
				$.ajax({
					url : "payReCorrection",
					data : { "payNo" : payNo, "correctionContent" : $("#corrReContent").val(), "correctionNo" : correctionNo },
					dataType: "JSON",
					type : "GET",
					success : function(result){
						
						if(result > 0){
							swal("급여 정정 재신청 완료!", {icon: "success",});
							
							$("#corrModal").modal("hide");
							$("#staticBackdrop").modal("show"); 
							
						}else{
							swal("급여 정정 재신청 완료!", {icon: "fail",});
						}
						
					}, error : function(){
						swal("급여 정정 재신청 실패", {icon: "error",});
					}
				}); 
				
			});
			
		});
	</script>

</body>
</html>