<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
         
    	 if(confirm("삭제하시겠습니까?")) {
	         $.ajax({
	             url : url,
	             type : "get",
	             data : {"currentYear" : $_currentYear},
	             success : function(result){
	            	 if(result>0){
	                 console.log("나오나");
	                 location.reload();
	            	 }
	             }, error : function(){
	               console.log("ajax 통신 실패");
	               
	             }
	        });
    	 }

         
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
													<td colspan="6">존재하는 데이터가 없습니다.</td>
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
                                          <c:set var="now" value="<%=new java.util.Date()%>" />
										  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
										  
										   
                                          <c:forEach var="year" begin="2016" end="${sysYear}" step="1">
                                           	  <option value="${year}">${year}</option>
										  </c:forEach>
                                          
                                             
                                        </select>
                                    </td>
                                </tr>
                               
                          
                                <tr>
                                   
                                     <td>최저 임금</td>
                                    <td>
                                        <input type="text" name="currentMinSal" class="form-control" >
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
	
	<script>
		$("#selectYear").on("change", function(){
			var sel = $(this).val();
			
			$("td[name='currentYear']").each(function(index, item){
				console.log("a : " + $(item).text());
				console.log("b : " + sel);
				console.log("c : " + $(item).next().text());
				
				if($(item).text() == sel){
					$("input[name='currentMinSal']").val($(item).next().text());
				}
				
			});
		});
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>


</html>