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
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">최저 시급</h4>
							</div>
							<div class="card-body">
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
														<td>${CurrentSal.currentYear }</td>
														<td>${CurrentSal.currentMinSal }</td>
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
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>

</body>


</html>