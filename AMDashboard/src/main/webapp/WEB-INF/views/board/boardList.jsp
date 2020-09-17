<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
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
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th>
                          이름
                        </th>
                        <th >
                          이메일
                        </th>
                        <th >
                          가입일
                        </th>
                        <th>
                          상호명
                        </th>
                        <th>
                          가게주소
                        </th>
                        <th>
                          전화번호
                        </th>
                        <th class="text-center">
                          회원상태
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${empty storeList}">
                      <tr><td colspan="6">존재하는 회원이 없습니다.</td></tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="store" items="${storeList}">
                        <tr>
                          <td>${store.memberName }</td>
                          <td>${store.memberEmail }</td>
                          <td>${store.memberEnrollDate}</td>
                          <td>${store.storeName}</td>
                          <td>${store.storeAddress}</td>
                          <td>${store.storePhone}</td>
                          <td class="text-center">${store.memberStatus}</td>
                          
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                    </tbody>
                  </table>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card  card-plain">
              <div class="card-header">
                <h4 class="card-title"> 알바 회원 조회</h4>
              </div>
              <div class="card-body">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                       <th>
                          이름
                        </th>
                        <th >
                          이메일
                        </th>
                        <th >
                          가입일
                        </th>
                        <th>
                          상호명
                        </th>
                        <th>
                          전화번호
                        </th>
                        <th class="text-center">
                          회원상태
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    <c:when test="${empty storeList}">
                      <tr><td colspan="7">존재하는 회원이 없습니다.</td></tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="employee" items="${employeeList}">
                        <tr>
                          <td>${employee.memberName }</td>
                          <td>${employee.memberEmail }</td>
                          <td>${employee.memberEnrollDate}</td>
                          <td>${employee.storeName}</td>
                          <td>${employee.memberPhone}</td>
                          <td class="text-center">${employee.memberStatus}</td>
                          
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
  <noscript>
    <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
  </noscript>
  
</body>


</html>