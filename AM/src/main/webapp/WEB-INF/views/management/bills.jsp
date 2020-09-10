<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 

<style>


.tabType1 {
	height: 50px;
	text-align: center;
	font-family: 'S-CoreDream-6Bold';
}





.tabType1 li.on a {
	color: #fff;
}
table.type07 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}
table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #007a00;
}
table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}
table.type07 tbody th {
    width: 300px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #00ac00;
     color: #fff;
     text-align: center;
}
table.type07 td {
    width: 600px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

#correction{
	float: right;
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
					<span class="subheading">급여명세서</span>
					<h2> 급여명세서</h2>
				</div>
			</div>
				<table class="type07">
				
				<div class="billscontent">
			    <thead>
			    <tr>
			        <th scope="cols">지급항목</th>
			        <th scope="cols"></th>
			    </tr>
			    </thead>
			    <tbody>
			     <tr>
			        <th scope="row">총근무일</th>
			        <td>${plus.payDay}일</td>
			    </tr>
			    <tr>
			        <th scope="row">시급</th>
			        <td>${plus.payExtra}원</td>
			    </tr>
			    <tr>
			        <th scope="row">주휴수당</th>
			        <td>${plus.payExtra}원</td>
			    </tr>
			     <tr>
			        <th scope="row">급여 지급일</th>
			        <td>${plus.payPayment}일</td>
			    </tr>
			    <tr>
			        <th scope="row">총근무일</th>
			        <td>${plus.payDay}일</td>
			    </tr>
			    <tr>
			        <th scope="row">총근무시간</th>
			        <td>${plus.payTime}시간</td>
			    </tr>
			    
			     <tr>
			        <th scope="row">총급여</th>
			        <td>${plus.paySal}원</td>
			    </tr>
			    </tbody>
			</table>
			<button type="button" class="btn btn-outline-success" id="correction">수정</button>
		</div>	
		</div>
	</section>


	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script >
		("#correction").on("click",function(){
			
		})
	</script>

</body>
</html>