<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 설정</title>
<style>
    	
    	/* 급여 정정 */
    
    	
       .pagination {
            justify-content: center;
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
			font-size: 10px;
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
		
		#updatePayStub{
			width:1100px;
		
		}
		
		  #my_modal {
        display: none;
        width: 300px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }

    #my_modal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    #staticBackdropLabel{
      font-family: 'S-CoreDream-8Heavy';
      font-weight: bold;
   }
</style>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> --> 
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script>
        jQuery(function($){
            $("#updatePayStub").DataTable();
        });
    </script> 

</head>
<body>

	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- ------------------------- main ---------------------------- -->
	<section class="ftco-section">
		<div class="overlay"></div>
		<div class="container">

			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center fadeInUp">
					<span class="subheading">SALARY</span>
					<h2>정정 신청</h2>
				</div>
			</div>

			<!-- ------------------------- side menu ---------------------------- -->
			 <ul class="tabType1">
			  <li><a href="${contextPath}/pay/insertPay">급여설정</a></li>
		      <li><a href="${contextPath}/management/payStubList">급여 명세서</a></li>
			  <li class="on"><a href="${contextPath}/management/requestPayStub">정정 신청</a></li>
		    </ul>
			<!-- ------------------------- side menu ---------------------------- -->


			<div class="container board-list">
		      
		      <h1>정정신청</h1>
		      
		        <div style="height:530px">
		            <table class="table table-hover table-striped" id="updatePayStub">
		               <thead>
		                    <tr>
		                         <th>글번호 </th> 

		                        <th>정정신청이유</th>
		                        <th>작성일</th>
		                        <th>명세서수정일</th>
		                        <th>상태(Y:확인, N:반려, W:대기)</th>
		                        <th>정정결과</th>
		                        <th>이름</th>
		                        <th>멤버번호</th>
		                    </tr>
		                </thead>
		                 <tbody>
		                   <c:choose>
		                      <c:when test="">
		                         <tr>
		                         <td colspan="5">알바생이 없습니다.</td>
		                         </tr>
		                      </c:when>
		                      
		                      <c:otherwise>
		                         
		                         
		                        <!--  boardList에 있는 요소를 반복접근하여
		                              board라는 변수에 저장하여 내부에서 사용
		                         -->
		                          <c:forEach var="paystubplus" items="${list}">
		                         <tr>
		                         	
		                             <td>${paystubplus.corrNo }</td> 
		               <%-- <td><a href='#' onClick="fn_view(${result.code})"><c:out value="${result.title }"/></a></td>  --%>
		                            <td>${paystubplus.corrContent }</td>
		                            <td>${paystubplus.corrCreateDt }</td>
		                            <td>${paystubplus.corrModifyDt }</td>
		                            <td>${paystubplus.corrStatus }</td>
		                            <td>${paystubplus.corrResult }</td>
		                            <td><button class="btn btn-warning contentBtn btn-rounded" type="button"  data-toggle="modal" data-target="#staticBackdrop">${paystubplus.memberName }</button></td>
		                            <%--<td>${paystubplus.memberName }</td> --%>
		                            <td id="test1">${paystubplus.memberNo }</td> 
		                            <%-- <input type="hidden" id="mid" value="${paystubplus.memberNo}"> --%>
		                            
		                         </tr>
		                         </c:forEach>
		                        
		                        
		                      </c:otherwise>
		                   </c:choose>
		                
		                
		                </tbody>
		            </table>
		          
			 
			
		
		        <hr>
		        
		        <%-- 로그인이 되어있는 경우에만 글쓰기 버튼 보이게 하기 --%>
		        <c:if test="${!empty loginMember}">
		          <a class="btn btn-primary float-right" href="../${boardList[0].boardType}/insert">글쓰기</a>
		      </c:if>
		         
       
   	    		</div>
  	    	</div>
		</div>
		
		<div id="my_modal">
   <!--  여기다 출력 -->
   			정정신청내용 : ${rList.corrContent }
   		
    <a class="modal_close_btn">닫기</a>
</div>

	</section>
	
	<!-- Modal -->
    
    
    
    
	<script>
    
/*     function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    document.getElementById('test').addEventListener('click', function() {
        // 모달창 띄우기
      
        var memberNo = $("#test1").text(); 
    	console.log("memberNo:"+memberNo)
   $.ajax({
	   url : "${contextPath}/management/request",
	   data : {"memberNo":memberNo}, 
	   type : "GET",
	   dataType : "JSON",
	   success:function(rList){
		   console.log(rList)
		  $("#my_modal").append(rList.corrContent);
        modal('my_modal');
	   },error:function(){
		   console.log("ajax 통신 실패");
 
		   
	   } */
/* 	   
   });
    });
     */
  
	   
	
</script>




	<!-- ------------------------- footer ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />



 <!-- Bootstrap core JS-->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script> 
    
   <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">급여 정정 신청</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">

                        <div class="container-fluid">

                             <div class="col-md-12">
                                <div class="form-group">
                                    <textarea name="correctionContent" id="correctionContent" cols="30" rows="7" class="form-control"></textarea>
                                </div>
                            </div>

                          </div>

                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary viewBtn" data-dismiss="modal">닫기</button>
                        <button type="button" id="correction" class="btn btn-primary viewBtn">신청하기</button>
                      </div>
                    </div>
                  </div>
                </div> 
    </body>
</html>