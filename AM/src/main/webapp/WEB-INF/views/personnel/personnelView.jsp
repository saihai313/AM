<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.employeeInfo{
		
		text-align: center;
	}
	
	.bottom_btn{
		margin-bottom: 50px;
	}

	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="employeeInfo">
		<h2>${member.memberName}님의 상세정보</h2>
		<div class="employee__name"><h3>이름 :</h3></div>
		<div class="employee__email"><h3>이메일 :</h3></div>
		<div class="employee__phone"><h3>연락처 :</h3></div>
		<div class="employee__hourlyWage"><h3>이름 :</h3></div>
		<div class="employee__shift"><h3>시급 :</h3></div>
		<div class="employee__workTime"><h3>근무조 :</h3></div>
		<div class="employee__workDay"><h3>근무시간 :</h3></div>			
		<div class="employee__workDay"><h3>근무요일 :</h3></div>			
	</div>
	<br>

	
     <div class="bottom_btn" style="text-align: center;" >
       <button id="" class="btn btn-primary py-3 px-4">목록으로</button>
       <button id="deleteEmployee" class="btn btn-primary py-3 px-4">직원삭제</button>
     </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
		<script>	
		$("#deleteEmployee").on("click",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				// spring/board/1/515/delete
				location.href="${board.boardNo}/delete";
			}
				
		});
		
		
	</script>
</body>
</html>