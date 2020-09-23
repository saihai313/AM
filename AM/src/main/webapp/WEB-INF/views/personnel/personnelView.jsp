<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${eInfo.memberName}님의 상세정보</title>
  <link rel="shortcut icon" href="${contextPath}/resources/images/icons/favicon.ico">
<style>
	.employeeInfo{
		
		text-align: center;
	}
	
	.bottom_btn{
		margin-bottom: 250px;
	}
	
	.employeeInfo > div{
		padding-bottom: 10px;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="employeeInfo">
		<h2>${eInfo.memberName} 님의 상세정보</h2>
		<div class="employee__email"><h4>이메일 : ${eInfo.memberEmail}</h4></div>
		<div class="employee__phone"><h4>연락처 : ${eInfo.memberPhone}</h4></div>
		<div class="employee__hourlyWage"><h4>시급 : ${eInfo.sal}</h4></div>
		<div><h4>가입일 : </h4></div>
<!-- 		<div class="employee__shift"><h4>근무조 :</h4></div>
		<div class="employee__workDay"><h4>근무시간 :</h4></div>			
		<div class="employee__workDay"><h4>근무요일 :</h4></div>	 -->		
	</div>
	<br>

	
     <div class="bottom_btn" style="text-align: center;" >
       <button id="toList" class="btn btn-primary py-2 px-3">목록으로</button>
       <button id="deleteEmployee" class="btn btn-primary py-2 px-3">직원삭제</button>
       <button id="updateHourlyWage" class="btn btn-primary py-2 px-3">시급수정</button>
     </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
		<script>	
		$("#deleteEmployee").on("click",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				
				var memberNo = ${eInfo.memberNo};
				console.log(memberNo);
				var url = "${contextPath}/personnel/delete?memberNo=" + memberNo;
				location.href= url;
				
			}else{
				var url = "${contextPath}/personnel/personnelList";
				location.href= url;
			}
				
		});
		
		$("#toList").on("click",function(){
			var personnelList = 
				"${contextPath}/personnel/personnelList";
			location.href = personnelList;			
		});
		
		$("#updateHourlyWage").on("click",function(){
			
			var memberNo = ${eInfo.memberNo};
			var sal = prompt("수정할 시급을 입력해주세요","");
			var url = "${contextPath}/personnel/updateHourlyWage?memberNo="+memberNo+"&sal="+sal;
			if(sal != null){
				
			location.href = url;			
			}
		});

		
	</script>
	    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>