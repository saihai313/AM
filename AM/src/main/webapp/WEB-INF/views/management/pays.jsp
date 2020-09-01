<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8">
<title>급여명세서</title>
    <style>
    
       .pagination {
            justify-content: center;
        }
        #searchForm{
            position: relative;
        }

        #searchForm>*{
            top : 0;
        }
        
        .boardTitle > img{
           width: 50px;
           height: 50px;
        }
          
        .board-list{ margin: 100px auto;}
        
        #list-table td{
           cursor: pointer;
        }

      .tabType1 {
         height: 50px;
         text-align: center;
         font-family: 'S-CoreDream-6Bold';
      }
      
      .tabType1 li {
         display: inline-block;
         width: 199px;
         height: 48px;
         margin-left: -4px;
         border: 1px solid #c4c4c4;
         border-left-width: 0;
      }
      
      .tabType1 li:first-child {
         margin-left: 0;
         border-left-width: 1px;
      }
      
      .tabType1 li a {
         display: block;
         height: 48px;
         text-align: center;
         line-height: 48px;
         font-size: 14px;
         color: #3A3847;
      }
      
      .tabType1 li.on {
         position: relative;
         border-color: #c4c4c4;
         background: #589168;
      }
      
      .tabType1 li.on a {
         color: #fff;
      }
      
      	table {
    width: 1210px;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    float: center;
     text-align: center;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align:center;
    
   cursor:pointer;
   
  }
  
  thead tr{
    background-color: #007a00;
    color: #ffffff;
     height: 30px;
     text-align: center;
  }
  tbody tr:nth-child(2n):hover {
    background-color: #99cd89;
    height: 30px;
    text-align: center;
  }
  tbody tr:nth-child(2n+1):hover{
    background-color: #ddeed7;
    height: 30px;
    text-align: center;
  }
   </style>


<link rel="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">


<script type="text/javascript" src="<c:url value='/js/jquery-1.11.2.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/etc/DataTables-1.10.5/media/js/jquery.dataTables.min.js' />" ></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/f2c75b7247b/integration/bootstrap/3/dataTables.bootstrap.js" ></script>
 <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> 
    <script>
        jQuery(function($){
            $("#table_id").DataTable();
        });
    </script>
   
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   <!-- ------------------------- main ---------------------------- -->
   <section class="ftco-section">
      <div class="overlay"></div>
         <div class="container">
   
         <div class="row justify-content-center pb-5">
            <div class="col-md-7 heading-section text-center fadeInUp">
               <span class="subheading">SALARY</span>
               <h2>급여 명세서</h2>
            </div>
         </div>
         
       
                  	<table id="table_id" class="hover"  >
      <thead>
        <tr>
          <th>no</th><th>이름</th><th>시급</th><th>타임</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td><td>최지은</td><td>8590</td><td>오전</td>
        </tr>
        <tr>
          <td>2</td><td>전상아</td><td>9500</td><td>오후</td>
        </tr>
        <tr>
          <td>3</td><td>김가연</td><td>2400</td><td>Amet</td>
        </tr>
        <tr>
          <td>4</td><td>김서하</td><td>3200</td><td>Amet</td>
        </tr>
        <tr>
          <td>5</td><td>박민지</td><td>6500</td><td>Amet</td>
        </tr>
        <tr>
         <td>6</td><td>이지은</td><td>7000</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>이가연</td><td>4700</td><td>Amet</td>
        </tr>
        <tr>
         <td>6</td>안녕<td></td><td>1230</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
         <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
          <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
         <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        <tr>
         <td>6</td><td>Dolor</td><td>Sit</td><td>Amet</td>
        </tr>
        
      </tbody>
    </table>
              </div>
      
              
            
             
       
             
            
          </section>
      
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   
   <script>
         // 게시글 상세보기 기능 구현
         $(function(){
            $("#list-table td").on("click", function(){
               // 글번호
               var boardNo = $(this).parent().children().eq(0).text();
               
               // 게시글 상세조회 요청 주소
               var boardUrl = "${contextPath}/board/${pInfo.boardType}/"+ boardNo + "?cp=${pInfo.currentPage}";
               
               // PathVariable 방식 : 구분되어야 하는 리소스를 호출하는 url로 사용
               // spring/board/1/500?cp=3
               
               // 파라미터(쿼리스트링) : 정렬, 필터링
               // spring/board?type=1&boardNo=500&cp=3
               
               // 게시글 상세 조회 요청
               location.href = boardUrl;
               
            });
         });
      
   </script>
   
   
   
</body>
</html>