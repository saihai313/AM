<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  
   <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 40%; /* Could be more or less, depending on screen size */                          
        }
 
</style>
  <script>
  $( document ).ready(function() {
    $("a[name='goStoreBizCheck']").on("click", function(){
      var $_trObj = $(this).closest("tr");
      // 글번호
      var $_storeNo = $_trObj.find("td[name='storeNo']").text();
      // 한줄
    //  var $_storeNo = $_trObj.parent().children().eq(0).text();
      var modal = document.getElementById('myModal');
      modal.style.display = "block";
      
      var span = document.getElementsByClassName(" btn btn-warning")[0]; 
      span.onclick = function() {
          modal.style.display = "none";
      }

      var url = "${contextPath}/board/storeConfirm";
            console.log($_storeNo);

      
      $.ajax({
            url : url,
            type : "POST",
            dataType : "JSON",
            data : {"$_storeNo" : $_storeNo},
            success : function(storeConfirm){
              alert(storeConfirm)
              console.log(123);
              console.log(storeConfirm+"디용");
              
              console.log( $_storeNo+"오오오");
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

      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 사장 회원 조회</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th>
                          No.
                        </th>
                        <th>
                          상호명
                        </th>
                        <th>
                          사업자번호
                        </th>
                         <th >
                          가입일
                        </th>
                        <th class="text-center">
                          회원인증
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${empty confirmList}">
                      <tr><td colspan="6">존재하는 회원이 없습니다.</td></tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="store" items="${confirmList}">
                        <tr>
                          <td name="storeNo">${store.storeNo }</td>
                          <td>${store.storeName}</td>
                          <td>${store.storeBizNo}</td>
                          <td>${store.memberEnrollDate}</td>
                          <td class="text-center">
                            <c:choose>
                              <c:when test="${store.storeBizCheck ne 'Y'.charAt(0)}">
                              완료
                              </c:when>                              
                              <c:otherwise>
                               <a href="#"  name="goStoreBizCheck">확인</a>
                              </c:otherwise>
                             </c:choose>
                             
                          </td>
                          
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
   
    </div>
  </div>
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Background</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger background-color">
            <div class="badge-colors text-center">
              <span class="badge filter badge-primary active" data-color="primary"></span>
              <span class="badge filter badge-info" data-color="blue"></span>
              <span class="badge filter badge-success" data-color="green"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="adjustments-line text-center color-change">
          <span class="color-label">LIGHT MODE</span>
          <span class="badge light-badge mr-2"></span>
          <span class="badge dark-badge ml-2"></span>
          <span class="color-label">DARK MODE</span>
        </li>
        <li class="button-container">
          <a href="https://www.creative-tim.com/product/black-dashboard" target="_blank" class="btn btn-primary btn-block btn-round">Download Now</a>
          <a href="https://demos.creative-tim.com/black-dashboard/docs/1.0/getting-started/introduction.html" target="_blank" class="btn btn-default btn-block btn-round">
            Documentation
          </a>
        </li>
        <li class="header-title">Thank you for 95 shares!</li>
        <li class="button-container text-center">
          <button id="twitter" class="btn btn-round btn-info"><i class="fab fa-twitter"></i> &middot; 45</button>
          <button id="facebook" class="btn btn-round btn-info"><i class="fab fa-facebook-f"></i> &middot; 50</button>
          <br>
          <br>
          <a class="github-button" href="https://github.com/creativetimofficial/black-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star ntkme/github-buttons on GitHub">Star</a>
        </li>
      </ul>
    </div>
  </div>
 
  <noscript>
    <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
  </noscript>
   </body>

</html>


    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
		<div class="modal-content">
			<div class="col-xs-8 col-md-8">
				<h2 class="text-center">상제 정보 조회</h2>
				<p>&nbsp;</p>
				<div class="table table-responsive">
					<table class="modal-table">
						<tr>
							<th class="success">이름</th>
							<td>${store.memberName }</td>
							<th class="success">연락처</th>
							<td>${store.memberPhone}</td>
						</tr>
						<tr>
							<th class="success">이메일</th>
							<td>${store.memberEmail }</td>
							<th class="success">작성일</th>
							<td>${store.memberEnrollDate}</td>
						</tr>

						<tr>
							<th class="success">상호명</th>
							<td>${store.storeName}</td>
						</tr>
						<tr>
							<th class="success">사업자 번호</th>
							<td>${store.storeBizNo }</td>
						</tr>
						<tr>
							<th class="success">가게 번호
							<th>
							<td>${store.storePhone}</td>
						</tr>
						<tr>
							<th class="success">가게 주소</th>
							<td>${store.storeAddress}</td>
						</tr>
					</table>
				</div>

			</div>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onClick="close_pop();">

				<tr>
					<td colspan="4" class="text-center"><input type="button"
						class="btn btn-warning" value="취소" onclick=""> <input
						type="button" class="btn btn-danger" value="인증" onclick="">
					</td>
				</tr>
			</div>
		</div>

	</div>
        <!--End Modal-->
       
        
