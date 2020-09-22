<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>
  $(document).ready(function(){
	  $("img[name='deleteIcon']").on("click",function(){
		  var $_trObj = $(this).closest("tr");
	    var $_currentYear = $_trObj.find("td[name='currentYear']").text();
	    var url = "${contextPath}/board/deleteSal";
         console.log($_currentYear);

         $.ajax({
             url : url,
             type : "POST",
             dataType : "text",
             data : {"currentYear" : $_currentYear},
             success : function(result){
            	 console.log(되나연);
            	 alert("삭제하시겠습니까?","","success");
               location.href = "${contextPath}/board/deleteSal";
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
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title"> 최저 시급 조회</h4>
							</div>
							<div class="card-body">
							<form action="${contextPath }/board/deleteSal" onsubmit="return validate();">
								<table class="table tablesorter " id="">
									<thead class=" text-primary">
										<tr class="text-center">
											<th>년도</th>
											<th>시급</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty selectSal}">
												<tr>
													<td colspan="6">존재하는 회원이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="CurrentSal" items="${selectSal}">
													<tr class="text-center">
														<td name="currentYear">${CurrentSal.currentYear }</td>
														<td>${CurrentSal.currentMinSal }</td>
														<td>
														    <img name="deleteIcon" type="submit" src="${contextPath}/resources/assets/img/delete.ico" style=width:20px; height:20px; >
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								</form>
							</div>
						</div>
					</div>
					  <div class="col-md-6">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 시급 등록</h4>
              </div>
              <div class="card-body">
                      <form action="${contextPath }/board/insertSal" onsubmit="return validate();">
                            <table class="table">
                                <tbody>
                                <tr style="line-height:32px;">
                                    <td>년도</td>
                                     <td>
                                        <select id="selectYear" name="currentYear">
                                          <option selected>--선택-- </option>
                                          <option value="2016">2016</option>
                                          <option value="2017">2017</option>
                                          <option value="2018">2018</option>
                                          <option value="2019">2019</option>
                                          <option value="2020">2020</option>
                                          <option value="2021">2021</option>
                                          <option value="2022">2022</option>
                                          <option value="2023">2023</option>
                                          <option value="2024">2024</option>
                                          <option value="2024">2025</option>
                                          <option value="2024">2026</option>
                                          <option value="2024">2027</option>
                                          <option value="2024">2028</option>
                                          <option value="2024">2029</option>
                                          <option value="2024">2030</option>
                                             
                                        </select>
                                    </td>
                                </tr>
                               
                          
                                <tr>
                                   
                                     <td>최저 임금</td>
                                    <td>
                                        <input type="text" name="currentMinSal" class="form-control" value="">
                                    </td>
                                </tr>
                               
                                </tbody>
                                
                            </table>
                         <div class="text-center mt-3">
                  <button type="submit" class="btn btn-info">등록</button>
              </div>
                        </form>
              </div>
            </div>
          </div>
				</div>
			</div>
			 <div class="content">
        <div class="row">
        
        </div>
      </div>

		</div>
	</div>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>

</body>


</html>