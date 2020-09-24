<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script> 

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
    width: 250px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #00ac00;
     color: #fff;
     text-align: center;
}
table.type07 td {
    width: 450px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
#correction{
   float: right;
}
#btnArea > button{
   float: right;
}
{
   text-align: center;
}
{
	text-align: center;
}
</style>

</head>
<body>

   <!-- ------------------------- header ---------------------------- -->
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

   <!-- ------------------------- main ---------------------------- -->
   <section class="ftco-section">
      <div class="overlay">
      
      
        <div class="container board-list">
            
            <div class="row justify-content-center p-5 col-md-10 mx-auto" style="border: 50px solid #F5F4F0">
               
              <!--  <div class="row justify-content-center pb-5">
                  <div class="col-md-12 heading-section text-center fadeInUp">
                     <span class="subheading">Salary</span>
                     <h2> 급여명세서</h2>
                  </div>
              </div> -->
               
               
               <!-- 제목  -->
               <div class="col-md-10 text-center mb-5">
                  <fmt:formatDate var="payTitle" value="${plus.payCreateDate }" pattern="YYYY년  MM월 명세서"/>
                       <h1 style="font-family: 'S-CoreDream-6Bold';">${payTitle }</h1>
                  <hr>
               </div>
               <form action="../../pay/updatePayAction/${payNo}" method="post" class="contactForm">

	               <div class="row" style="width: 500px; font-family: 'S-CoreDream-6Bold';">
			               <!-- 내용  -->
			               <div class="col-md-12">
			               <table class="col-md-12 p-5 table table-borderless mx-auto">
			                <tr>
			                     <td>이름</td>
			                     <td>${plus.memberName }</td>
			                  </tr>
			                  <tr>
			                     <td>근무 가게</td>
			                     <td>${plus.storeName }</td>
			                  </tr>
			                  <tr>
			                     <td>시급</td>
			                     <td><fmt:formatNumber value="${plus.employeeSal }" pattern="#,###" />₩</td>
			                  </tr>
			                  <tr>
			                     <td>급여지급일</td>
			                     <td><input class="form-control" style="width: 100px;" type="number" name="payPayment" value="${plus.payPayment }"></td>
			                  </tr>
			                  <tr>
			                     <td>총 근무시간</td>
			                     <td>
			                     	<input class="form-control" style="width: 100px;" type="number" name="payTime" value="${plus.payTime}">
			                     </td>
			                  </tr>
			                  <tr>
			                     <td>총 근무일수</td>
			                     <td><input class="form-control" style="width: 100px;" type="number" name="payDay" value="${plus.payDay }"></td>
			                  </tr>
			                  <tr>
			                     <td>주휴수당</td>
			                     <td><input class="form-control" style="width: 100px;" type="number" name="payExtra" value="${plus.payExtra }"></td>
			                  </tr>
			                  
			               </table>
			               </div>
			               
			               
			               
		               
			               <div class="col-md-12 row mt-5 mb-5 justify-content-center" id="total-sal">
			                  <h3 id="total"><span >총 급여</span> &nbsp;
			                     <span style="float: right;"><input class="form-control" style="width: 100px;" type="number" name="paySal" value="${plus.paySal }"></span>
			                  	 
			                  </h3>
			               </div>
			               
			               <div id="btnArea" class="col-12">
			               	<button id="updateBtn" class=" ml-2 btn btn-lg  btn-primary viewBtn">수정하기</button>
			               	<button type="button" class="btn btn-lg  btn-primary viewBtn" onclick="history.back();">목록으로</button>
			               </div>
			                            
		              
		
	               
	              </div>

              </form>
            </div>
         </div>
      </div>
   </section>
   
  
   
   
   
   <!-- ------------------------- footer ---------------------------- -->
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   

</body>
</html>

