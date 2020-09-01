<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
					<h2>전상아 님의 8월급여명세서</h2>
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
			        <th scope="row">기본급여</th>
			        <td>1,000,000</td>
			    </tr>
			    <tr>
			        <th scope="row">주휴수당</th>
			        <td>100,000</td>
			    </tr>
			    <tr>
			        <th scope="row">시간외 수당</th>
			        <td>50,000</td>
			    </tr>
			    <tr>
			        <th scope="row">고용보험</th>
			        <td>-50,000</td>
			    </tr>
			    
			     <tr>
			        <th scope="row">총합</th>
			        <td>1,100,000원</td>
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