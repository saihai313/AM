<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 설정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>

		/* 급여명세서 */
    
       .pagination {
            justify-content: center;
        }
          
        .board-list{ margin: 100px auto;}
        
        #list-table td{
        	cursor: pointer;
        }

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
		
		#list-table{
			width:1100px;
		
		}
		 
		 th{
		 	background-color: bcdeb0;	
		 }
		th:nth-of-type(5) { display: none; 
				
		}   
		
		#memberno{
			display: none;
			
		}
		
		
</style>
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> --> 
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#list-table").DataTable();
        });
    </script>

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
					<span class="subheading">SALARY</span>
					<h2>급여 명세서</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			 <ul class="tabType1">
			  <li><a href="${contextPath}/pay/insertPay">급여설정</a></li>
		      <li class="on"><a href="${contextPath}/management/payStubList">급여 명세서</a></li>
			  <li><a href="${contextPath}/management/requestPayStub">정정 신청</a></li>
		    </ul>
			<!-- ------------------------- side menu ---------------------------- -->


			<div class="container board-list">
		      
		      <h1>${boardList[0].boardName}</h1>
		      
		        <div style="height:530px">
		            <table class="table table-hover table-striped" id="list-table">
		               <thead>
		                    <tr>
		                        <th>글번호 </th>
		                        <th>가게 상호명</th>		                        
		                        <th>알바생이름</th>		                      
		                        <th>급여명세서 작성일</th>		                      
		                        <th >멤버번호</th>		                      
		                        
		                    </tr>
		                </thead>
		                 <tbody>
		                   <c:choose>
		                      <c:when test="${empty paystubList }">
		                         <tr>
		                         <td colspan="5">알바생이 없습니다.</td>
		                         </tr>
		                      </c:when>
		                      
		                      <c:otherwise>
		                         
		                         
		                        <c:forEach var="paystub" items="${paystubList}">
		                        		<tr>
		                        		
		                        			<td>${paystub.payNo }</td>
		                        			<td>${paystub.storeName }</td>
		                        			<td>${paystub.memberName }</td>
		                        			<td>${paystub.payCreateDate }</td>
		                        			<td id="memberno">${ paystub.memberNo}</td>
		                        			
		                        			
		                        		
		                        		</tr>
		                        
		                        </c:forEach>
		                       
		                        
		                      </c:otherwise>
		                   </c:choose>
		                
		                
		                </tbody>
		            </table>
		        </div>
		
		        <hr>
		    <%--     
		        로그인이 되어있는 경우에만 글쓰기 버튼 보이게 하기
		        <c:if test="${!empty loginMember}">
		          <a class="btn btn-primary float-right" href="../${boardList[0].boardType}/insert">글쓰기</a>
		      </c:if> --%>
		         
       
   	    		</div>
		</div>
	</section>
	
	<script >
		$(function(){
			$("#list-table td").on("click",function(){
				console.log("클릭됨");
				
				var memberNo = $(this).parent().children().eq(0).text();
				///am1/management/payStubList/1?=500
				var payboardUrl="${contextPath}/management/bills/" + memberNo;
				location.href=payboardUrl;
				
			

			});
		});
	</script>


	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	

</body>
</html>