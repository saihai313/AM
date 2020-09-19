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
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">뉴스 등록</h4>
							</div>
							
							<form action="${contextPath }/board/insertNews" onsubmit="return validate();">
		                        <table class="table">
		                            <tbody>
		                            <tr style="line-height:32px;">
		                                <td>기사 제목</td>
		                                <td>
		                                    <input type="text" name="title" class="form-control" value="">
		                                </td>
		                                 <td>회원 구분</td>
		                                <td>
		                                    <select id="memberselect" name="memberType">
		                                    	<option value="R">사장 정보</option>
		                                    	<option value="A">알바 정보</option>
		                                    	<option selected>--선택-- </option>
		                                    </select>
		                                </td>
		                            </tr>
		                           
		                      
		                            <tr>
		                               
		                                 <td>기사 링크</td>
		                                <td>
		                                    <input type="text" name="address" class="form-control" value="">
		                                </td>
		                            </tr>
		                           
		                            </tbody>
		                            
		                        </table>
                         <div class="text-center mt-3">
					        <button type="submit" class="btn btn-info">등록</button>
					    </div>
                        </form>
                  
						</div>
						 <div class="pt-3"></div>
 
            <div class="card">
                <div class="card-header"><i class="fas fa-square"></i> 뉴스 정보 조회</div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                           <table class="table tablesorter " id="">
									<thead class=" text-primary">
										<tr>
											<th>No.</th>
											<th>기사 제목</th>
											<th>기사 링크</th>
											<th>등록일</th>
											<th>회원 구분</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty selectnews}">
												<tr>
													<td colspan="6">존재하는 회원이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="newsBoard" items="${selectnews}">
													<tr>
														<td>${newsBoard.newsNo }</td>
														<td>${newsBoard.title }</td>
														<td>${newsBoard.address}</td>
														<td>${newsBoard.createDate}</td>
														<td class="text-center">${newsBoard.memberType}</td>

													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
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
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>


<script>
 function validate(){
	 
		$memberType =$("<input>", {type : "hidden", name : "memberType", 
			value : $("")});
	
		$("form[name='deleteCalendarForm']").append($memberType);
 }
</script>
</body>


</html>