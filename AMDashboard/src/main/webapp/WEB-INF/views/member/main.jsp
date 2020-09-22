<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--
=========================================================
* * Black Dashboard - v1.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/black-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)


* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
<title>Black Dashboard by Creative Tim</title>
</head>

<body class="">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="wrapper">
		<div class="main-panel">
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-lg-6">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">Total Shipments</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-bell-55 text-primary"></i> 763,215
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLinePurple"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">Completed Tasks</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-send text-success"></i> 12,100K
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLineGreen"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
