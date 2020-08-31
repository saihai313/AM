<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
	table {
    width: 1200px;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    float: center;
     text-align: center;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #007a00;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #99cd89;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #ddeed7;
  }
  #page{
  float: center;
  }
</style>
</head>
<body>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	

	
   <section class="ftco-section bg-light" id="login">
		<div class="overlay"></div>
		<div class="container">
			
			
				
				<div class="searchone">
						<table id="table_id" class="display">
      <thead>
        <tr>
          <th>급여명세서</th><th>no</th><th>이름</th><th>시급</th><th>타임</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td></td><td>1</td><td>최지은</td><td>8590</td><td>오전</td>
        </tr>
        <tr>
          <td></td><td>2</td><td>전상아</td><td>9500</td><td>오후</td>
        </tr>
        <tr>
          <td></td><td>3</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td></td><td>4</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td></td><td>5</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td></td><td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
      </tbody>
    </table>
		</div>			
				</div>
		</div>
			
	</section>
 
    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />



<script>
$(document).ready(function() {
    $("#table_id").DataTable();
} );
</script>


</body>
</html>