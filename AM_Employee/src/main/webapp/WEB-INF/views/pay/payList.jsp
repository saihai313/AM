<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서</title>
<style>
	 #list-table *{font-size: small;}
	 #list-table td{cursor: pointer;}
	 #payList thead{background-color: #F5F4F0; color: rgba(0, 0, 0, 0.8);}
</style>
</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- ------------------------- main ---------------------------- -->
    <section class="ftco-section" id="payList">
    	<div class="container">
    	<div class="overlay"></div>
    	
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">paystub</span>
					<h2>급여 명세서 목록</h2>
				</div>
			</div>
			
			<table class="mx-auto text-center col-md-12 table table-hover" id="list-table">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="15%">발급일</th>
						<th width="40%">명세서명</th>
						<th width="20%">상태</th>
					</tr>
				</thead>
				 <tbody>
                	<c:choose>
                	
                		<c:when test="${empty payList}">
                			<tr><td colspan="5">존재하는 급여 명세서가 없습니다.</td><tr>
                		</c:when>
                		
                		<c:otherwise>
                			<c:forEach var="pay" items="${payList}">
                				<tr id="${pay.payNo }">
                					
                					<td>${pay.paystubNo }</td>
                					
                					<td>${pay.payCreateDate }</td>
                					
                					<td>
										<fmt:formatDate var="payTitle" value="${pay.payCreateDate }" pattern="YYYY년  MM월 명세서"/>
               							${payTitle }${pay.check }
                					</td>
                					
                					<td id="${pay.payStatus }">
                						<c:choose>
                							<c:when test="${pay.payStatus == 'Y' }">
                								확인 완료
                							</c:when>
                							<c:when test="${pay.payStatus == 'N' }">
                								정정 신청
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
			
			<!-- page ------------------------------------------------------------------------------->
			<div class="row mt-5">
				<div class="col text-center">
            		<div class="block-27">
		            	<ul>
		            	
			            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize }">	
				                <li><a href="?cp=1">&lt;&lt;</a></li>
				                
				                <li>
				                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage - 1) / pInfo.pagingBarSize }" integerOnly="true"/>
				                	<c:set var="prev" value="${operand1 * pInfo.pagingBarSize }"></c:set>
				                	
			                   		<a href="?cp=${prev }">&lt;</a>
				                </li>
			                </c:if>
		                
			                <c:forEach var="p" begin="${pInfo.startPage }"  end="${pInfo.endPage }">
			                	<c:choose>
			                		<c:when test="${p == pInfo.currentPage }">
			                			<li><a class="active"><span>${p }</span></a></li>
			                		</c:when>
			                		<c:otherwise>
				                		<li><a href="?cp=${p }">${p }</a></li>
					                </c:otherwise>
					        	</c:choose>
			                </c:forEach>
		                
			                <c:if test="${pInfo.maxPage > pInfo.endPage }">
				                <li>
				                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + (pInfo.pagingBarSize - 1)) / pInfo.pagingBarSize}" integerOnly="true"/>
				                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1 }"></c:set>
									<a href="?cp=${next }">&gt;</a>
				                </li>
				                
				                <!-- 맨 끝으로(>>) -->
				                <li><a href="?cp=${pInfo.maxPage }">&gt;&gt;</a></li>
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

    		// 상세 조회
			$("#list-table td").on("click", function(){
				
				var payNo = $(this).parent().attr('id');
				var paystubNo = $(this).parent().children().eq(0).text();
				var payStatus = $(this).parent().children().eq(3).attr('id');
				
				if(payStatus == 'N'){
						
					$.ajax({
						url : "rePayStub",
						data : {"payNo": payNo},
						type : "GET",
						success : function(result){
							if(result > 0){
								swal({
									  title: "폐기된 명세서",
									  text: "재발급된 명세서를 확인해주세요.",
									  icon: "info",
									  button: "닫기",
									})
							}else{
								location.href = "${contextPath}/pay/payView/" + payNo + "?cp=${pInfo.currentPage }";
							}
							
						}, error : function(){
							console.log("급여명세서 재발급 확인 실패");
						}
					
					});	
					
				}else{
					location.href = "${contextPath}/pay/payView/" + payNo + "?cp=${pInfo.currentPage }";
				}
				
			});
    		
    		
		});
	</script>

</body>
</html>