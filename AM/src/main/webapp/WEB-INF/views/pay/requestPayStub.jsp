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
    	
    	/* 급여 정정 */
    
    	
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
		
		#updatePayStub{
			width:1100px;
		
		}
</style>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#updatePayStub").DataTable();
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
					<h2>정정 신청</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			 <ul class="tabType1">
			  <li><a href="${contextPath}/pay/insertPay">급여설정</a></li>
		      <li><a href="${contextPath}/pay/payStubList">급여 명세서</a></li>
			  <li class="on"><a href="${contextPath}/pay/requestPayStub">정정 신청</a></li>
		    </ul>
			<!-- ------------------------- side menu ---------------------------- -->


			<div class="container board-list">
		      
		      <h1>${boardList[0].boardName}</h1>
		      
		        <div style="height:530px">
		            <table class="table table-hover table-striped" id="updatePayStub">
		               <thead>
		                    <tr>
		                        <th>글번호 </th>
		                        <th>제목</th>
		                        <th>작성자</th>
		                        <th>작성일</th>
		                        <th>상태(Y:확인, N:반려, W:대기)</th>
		                    </tr>
		                </thead>
		                 <tbody>
		                   <c:choose>
		                      <c:when test="">
		                         <tr>
		                         <td colspan="5">알바생이 없습니다.</td>
		                         </tr>
		                      </c:when>
		                      
		                      <c:otherwise>
		                         
		                         
		                        <!--  boardList에 있는 요소를 반복접근하여
		                              board라는 변수에 저장하여 내부에서 사용
		                         -->
		                         <tr>
		                         	
		                            <td>1</td>
		                            <td>8월 급여명세서 정정이요</td>
		                            <td>최지은</td>
		                            <td>2020-08-28</td>
		                            <td>N</td>
		                            
		                         </tr>
		                        
		                        
		                      </c:otherwise>
		                   </c:choose>
		                
		                
		                </tbody>
		            </table>
		        </div>
		
		        <hr>
		        
		        <%-- 로그인이 되어있는 경우에만 글쓰기 버튼 보이게 하기 --%>
		        <c:if test="${!empty loginMember}">
		          <a class="btn btn-primary float-right" href="../${boardList[0].boardType}/insert">글쓰기</a>
		      </c:if>
		         
       
   	    		</div>
		</div>
	</section>


	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>