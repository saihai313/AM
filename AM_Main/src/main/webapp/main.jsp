<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AM_Albeit Management</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/flaticon.css">
	<link rel="stylesheet" href="resources/css/style.css">

	<style>
		.nav-top{font-family: 'S-CoreDream-4Regular' !important;}
		#ftco-navbar{font-family: 'S-CoreDream-6Bold' !important;}

		#main-slide{ 
			border-top: 3px  solid #dddbdb; 
			border-bottom: 3px  solid #dddbdb; 
		}
		.main-text{font-family: 'S-CoreDream-4Regular' !important;}
		.main-title{font-family: 'S-CoreDream-6Bold' !important;}
		
    #selectSite{
      font-family: 'S-CoreDream-8Heavy';
      background-color: ;
    }
   .btn{font-family: 'S-CoreDream-8Heavy'; font-size: 1em;}

	</style>
	
  </head>
  <body>

  	<div class="wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2 nav-top">
							<a href="company/contact" class="mr-2"><span class="fa mr-1"></span>고객센터&nbsp;&nbsp;</a> 
							<a href="tel://12345678" class="mr-2"><span class="fa fa-phone mr-1"></span>+ 1234-5678</a> 
							<a href="mailto:AlbeitManagement@gmail.com"><span class="fa fa-paper-plane mr-1"></span> AlbeitManagement@gmail.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>
    

    <div class="hero-wrap" style="background-image: url('resources/images/main_img.png'); background-size: 80%" data-stellar-background-ratio="0.5" id="main-slide"> 
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center">
          <div class="col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text">
          	  <img src="resources/images/main_logo.png" width="80%">

	            <div class="ml-5">
                  <h4 class="mt-3 mb-4"  id="selectSite">접속할 사이트를 선택해주세요.</h4>
                  <p>
                    <a href="../am" class="btn btn-primary py-3 px-4 pl-5 pr-5 mr-3">사장님</a>
                    <a href="../am_employee" class="btn btn-primary py-3 px-4  pl-5 pr-5">알바생</a> 
                  </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section bg-light" style="padding-top: 6em">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-10 heading-section text-center ftco-animate">
          	<span class="subheading">Services</span>
            <h2>제공하는 서비스</h2>
          </div>
        </div>
    	</div>
    	<div class="container-fluid px-0">
    		<div class="row no-gutters">
    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img" style="background-image: url(images/services-1.jpg);"></div>
    					<div class="text">
    						<h2>Relation Problem</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img" style="background-image: url(images/services-2.jpg);"></div>
    					<div class="text">
    						<h2>Couples Counseling</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>

    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img order-md-last" style="background-image: url(images/services-3.jpg);"></div>
    					<div class="text">
    						<h2>Depression Treatment</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img order-md-last" style="background-image: url(images/services-4.jpg);"></div>
    					<div class="text">
    						<h2>Family Problem</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>

    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img" style="background-image: url(images/services-5.jpg);"></div>
    					<div class="text">
    						<h2>Personal Problem</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-6">
    				<div class="services-wrap d-flex">
    					<div class="img" style="background-image: url(images/services-6.jpg);"></div>
    					<div class="text">
    						<h2>Business Problem</h2>
    						<p></p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

   
   <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.animateNumber.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
  <script type="text/javascript" src="resources/js/jquery.magnific-popup.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.stellar.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery.waypoints.min.js"></script>
  <script type="text/javascript" src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script type="text/javascript" src="resources/js/scrollax.min.js"></script>
  
  <script type="text/javascript" src="resources/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script type="text/javascript" src="resources/js/calendar.js"></script>
    
  </body>
</html>