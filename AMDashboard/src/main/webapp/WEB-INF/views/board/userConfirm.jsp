<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 40%; /* Could be more or less, depending on screen size */
}

.text1 {
	color: black;
}

.modal1 {
	width: 700px;
	height: 550px;
}
</style>
<script>
  $( document ).ready(function() {
    $("a[name='goStoreBizCheck']").on("click", function(){
      var $_trObj = $(this).closest("tr");
      // 글번호
      var $_storeNo = $_trObj.find("td[name='storeNo']").text();
      // 한줄
    //  var $_storeNo = $_trObj.parent().children().eq(0).text();
      var modal = document.getElementById('myModal');
      modal.style.display = "block";
      
      var span = document.getElementsByClassName(" btn btn-warning")[0]; 
      span.onclick = function() {
          modal.style.display = "none";
      }

      var url = "${contextPath}/board/storeConfirm";
            console.log($_storeNo);

      
      $.ajax({
            url : url,
            type : "POST",
            dataType : "JSON",
            data : {"storeNo" : $_storeNo},
            success : function(storeConfirm){
              console.log(123);
              console.log(storeConfirm+"디용");
              
              console.log( $_storeNo+"오오오");
            
        	$("#name").text(storeConfirm[0].memberName);
        	$("#memberPhone").text(storeConfirm[0].memberPhone);
        	$("#storeName").text(storeConfirm[0].storeName);
        	$("#memberEnrollDate").text(storeConfirm[0].memberEnrollDate);
        	$("#memberEmail").text(storeConfirm[0].memberEmail);
        	$("#storeBizNo").text(storeConfirm[0].storeBizNo);
        	$("#storePhone").text(storeConfirm[0].storePhone);
        	$("#storeAddress").text(storeConfirm[0].storeAddress);
        	
        	$storeNo = $("<input>", {type : "hidden", name : "storeNo",  id : "storeNo",
				value : storeConfirm[0].storeNo });
        	$(".storeNo").append($storeNo);
            }, error : function(){
              console.log("ajax 통신 실패");
            }
       });
      
    });
  });
  
 
  </script>
</head>
<body class="">
	<div class="wrapper">
		<div class="main-panel">

			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">사장 회원 조회</h4>
							</div>
							<div class="card-body">
								<table class="table tablesorter " id="">
									<thead class=" text-primary">
										<tr>
											<th>No.</th>
											<th>상호명</th>
											<th>사업자번호</th>
											<th>가입일</th>
											<th class="text-center">회원인증</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty confirmList}">
												<tr>
													<td colspan="6">존재하는 회원이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="store" items="${confirmList}">
													<tr>
														<td name="storeNo">${store.storeNo }</td>
														<td>${store.storeName}</td>
														<td>${store.storeBizNo}</td>
														<td>${store.memberEnrollDate}</td>
														<td class="text-center"><c:choose>
																<c:when test="${store.storeBizCheck eq 'Y'.charAt(0)}">
                              완료
                              </c:when>
																<c:otherwise>
																	<a href="#" name="goStoreBizCheck">확인</a>
																</c:otherwise>
															</c:choose></td>

													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content modal1">
			<div>
				<h2 class="text-center text1">상세 정보 조회</h2>
				<p>&nbsp;</p>
				<div class="table table-responsive storeNo">
					<table class="modal-table">
						<tr>
							<th class="success">이름</th>
							<td id="name">${store.memberName }</td>
							<th class="success">연락처</th>
							<td id="memberPhone">${store.memberPhone }</td>
						</tr>
						<tr>
							<th class="success">상호명</th>
							<td id="storeName">${store.storeName }</td>

							<th class="success">작성일</th>
							<td id="memberEnrollDate">${store.memberEnrollDate }</td>
						</tr>

						<tr>
							<th class="success">이메일</th>
							<td id="memberEmail">${store.memberEmail }</td>
						</tr>
						<tr>
							<th class="success">사업자 번호</th>
							<td id="storeBizNo">${store.storeBizNo }</td>
						</tr>
						<tr>
							<th class="success">가게 번호</th>
							<td id="storePhone">${store.storePhone }</td>
						</tr>
						<tr>
							<th class="success">가게 주소</th>
							<td id="storeAddress">${store.storeAddress }</td>
						</tr>
					</table>
				</div>

			</div>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="">

				<tr>
					<td colspan="4" class="text-center"><input type="button"
						class="btn btn-warning" value="취소" onclick=""> <input
						type="button" class="btn btn-danger auth" id="auth" value="인증">
					</td>
				</tr>
			</div>
		</div>

	</div>

	<!--End Modal-->
	<script>
       $("#auth").on("click", function(){
    	    
    	   var storeNo = $("#storeNo").val();
    	   
    	   console.log("인증 눌렀을떄" +storeNo);
    	      $.ajax({
    	            url : "${contextPath}/board/auth",
    	            type : "POST",
    	            dataType : "text",
    	            data : {"storeNo" : storeNo},
    	            success : function(result){
    	            	
		    		alert("인증이 완료되었습니다!","","success"); 
		    			
    	            	location.href = "${contextPath}/board/userConfirm";
    	            }, error : function(){
    	              console.log("ASDSADSADajax 통신 실패");
    	            }
    	       });
    		  
    		  
    		  
    		  
    	  });
       </script>
</body>

</html>