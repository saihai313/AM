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
.pagination {
           justify-content: center;
       }
      /*  #searchForm{
           position: relative;
       }

       #searchForm>*{
           top : 0;
       }
       
       .boardTitle > img{
          width: 50px;
          height: 50px; 
       }*/
         
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
	
	#updateBtn{
		float : right;
	}
	
	#inputTable{
		width:1100px;
	}
	
	input{
		text-align:right;
		width:85px;
	}
</style>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#inputTable").DataTable();
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
					<h2>급여 설정</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			<ul class="tabType1">
				<li class="on"><a href="${contextPath}/pay/payList">급여설정</a></li>
				<li><a href="${contextPath}/pay/payStubList">급여 명세서</a></li>
				<li><a href="${contextPath}/pay/updatePayStub">정정신청</a></li>
			</ul>
			<!-- ------------------------- side menu ---------------------------- -->
			<div class="container board-list">

			 <div style="height:530px">
                <table id="inputTable" class="table table-hover table-striped">
                        <thead>
                        	<tr>
                            	<th>No.</th>
                            	<th>이름</th>
                            	<th>급여일</th>
                            	<th>근무시간</th>
                            	<th>시급</th>
                            	<th>주휴수당</th>
                            	<th>총 일한시간</th>
                            	<th>총 일수</th>
                            	<th>총 지급액</th>
                            	<th></th>
                            </tr>
                        </thead>
                         <tbody>
		                   <c:choose>
		                      <c:when test="">
		                         <tr>
		                         <td colspan="9">알바생이 없습니다.</td>
		                         </tr>
		                      </c:when>
		                      
		                      <c:otherwise>
		                         
		                         
		                        <!--  boardList에 있는 요소를 반복접근하여
		                              board라는 변수에 저장하여 내부에서 사용
		                         -->
		                         <tr>
		                         	<!-- 예시 -->
		                            <td>1</td>
		                            <td>최지은</td>
		                            <td><input type="text" name="day">일</td>
		                            <td><input type="text" name="time">시간</td>
		                            <td><input type="text" name="partMoney">원</td>
		                            <td><input type="text" name="vacaMoney">원</td>
		                            <td><input type="number" name="totalTime">시간</td>
		                            <td><input type="number" name="totalDay">일</td>
		                            <td><input type="text" name="totalMoney">원</td>
		                            <td><button id="updateBtn" class="btn btn-primary">수정</button></td>
		                         </tr>
		                         <tr>
		                         	
		                            <td>99</td>
		                            <td>전상아</td>
		                            <td>
		                            	<input type="text" value="10">일
		                            </td>
		                            <td><input type="text" value="10">시간</td>
		                            <td><input type="text" value="9000">원</td>
		                            <td><input type="text" value="10380">원</td>
		                            <td><input type="number" value="20">시간</td>
		                            <td><input type="number" value="30">일</td>
		                            <td><input type="text" value="550,000"></td>
		                            <td><button id="updateBtn" class="btn btn-primary">수정</button></td>
		                         </tr>
		                         <tr>
		                         	
		                            <td>2</td>
		                            <td>지은</td>
		                            <td>
		                            	<input type="text" value="10">일
		                            </td>
		                            <td><input type="text" value="10">시간</td>
		                            <td><input type="text" value="9000">원</td>
		                            <td><input type="text" value="10380">원</td>
		                            <td><input type="number" value="20">시간</td>
		                            <td><input type="number" value="30">일</td>
		                            <td><input type="text" value="550,000"></td>
		                            <td><button id="updateBtn" class="btn btn-primary">수정</button></td>
		                         </tr>
		                         <tr>
		                         	
		                            <td>3</td>
		                            <td>상아</td>
		                            <td>
		                            	<input type="text" value="10">일
		                            </td>
		                            <td><input type="text" value="10">시간</td>
		                            <td><input type="text" value="9000">원</td>
		                            <td><input type="text" value="10380">원</td>
		                            <td><input type="number" value="20">시간</td>
		                            <td><input type="number" value="30">일</td>
		                            <td><input type="text" value="550,000"></td>
		                            <td><button id="updateBtn" class="btn btn-primary">수정</button></td>
		                         </tr>
		                         <tr>
		                         	
		                            <td>98</td>
		                            <td>김길동</td>
		                            <td>
		                            	<input type="text" value="10">일
		                            </td>
		                            <td><input type="text" value="10">시간</td>
		                            <td><input type="text" value="9000">원</td>
		                            <td><input type="text" value="10380">원</td>
		                            <td><input type="number" value="20">시간</td>
		                            <td><input type="number" value="30">일</td>
		                            <td><input type="text" value="1,550,000"></td>
		                            <td><button id="updateBtn" class="btn btn-primary">수정</button></td>
		                         </tr>
		                        
		                      </c:otherwise>
		                   </c:choose>
		                
		                
		                </tbody>
                </table>
            </div>
		      
                   
        </div>
        
   
		       
		</div>
	</section>

	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>