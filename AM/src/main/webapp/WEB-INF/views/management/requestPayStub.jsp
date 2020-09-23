<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 설정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    	
    	/* 급여 정정 */
    
    	
        .board-list{ margin: 40px auto;}
        
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
   #month{
   	width: 150px;
   }
   
   #correctionContent{
   	  display:inline-block;	
   	  width: 400px;
   	  height: 400px;
   }
   
   
   
</style>


	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
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
				<div class="col-md-7 heading-section  text-center fadeInUp">
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
			
		      
		        <div style="height:530px">
		            <table class="table table-hover tabType1 table-striped" id="updatePayStub">
		              <select id="month" class="custom-select custom-select-sm" >
						  <option id="all">월별 검색</option>
						  <option value="01">01</option>
						  <option value="02">02</option>
						  <option value="03">03</option>
						  <option value="04">04</option>
						  <option value="05">05</option>
						  <option value="06">06</option>
						  <option value="07">07</option>
						  <option value="08">08</option>
						  <option value="09">09</option>
						  <option value="10">10</option>
						  <option value="11">11</option>
						  <option value="12">12</option>
					</select>
		               <thead>
		                    <tr>
		                         <th>글번호 </th> 

		                       
		                        <th>작성일</th>
		                        <th>명세서수정일</th>
		                        <th>상태(Y:확인, N:반려, W:대기)</th>
		                        <th>이름</th>
		                     
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
		                           
		                            <td>${paystubplus.corrCreateDt }</td>
		                            <td class="mddate">${paystubplus.corrModifyDt }</td>
		                            <td >${paystubplus.corrStatus }</td>
		                            <td><button id="test" class="btn btn-warning contentBtn btn-rounded nameBtn" type="button"  data-toggle="modal" data-target="#staticBackdrop">${paystubplus.memberName }</button></td>
		                            <%--<td>${paystubplus.memberName }</td> --%>
		                            
		                            <%-- <input type="hidden" id="mid" value="${paystubplus.memberNo}"> --%>
		                            
		                         </tr>
		                         </c:forEach>
		                        
		                        
		                      </c:otherwise>
		                   </c:choose>
		                
		                
		                </tbody>
		            </table>
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

                        <div class="container-fluid" id="content">
                        
                        
									정정신청내용 : 
                             <div class="col-md-12">
                                <div class="form-group">
                                
                                	
                                    <textarea id="correctionContent" cols="30" rows="7"  class="form-control" readonly="readonly">
                                    		
                                    </textarea>
                                </div>
                            </div>

                          </div>

                      </div>
                      <div class="modal-footer">
                      	
                        <button type="button" class="btn btn-secondary viewBtn" data-dismiss="modal">확인</button>
                       <!--  <button type="button" id="correction" class="btn btn-primary viewBtn">반려</button> -->
		                <button type="button" id="correction" data-dismiss="modal" class="btn btn-warning contentBtn btn-rounded " data-toggle="modal" data-target="#static">반려이유작성</button>
		                <!--class="btn btn-warning contentBtn btn-rounded"  -->
                      </div>
                    </div>
                  </div>
                </div> 
                
               
       <!--  모달2-->
       
          <div class="modal fade" id="static" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">급여 정정 신청</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">

                        <div class="container-fluid" id="content">
                        
                        
									정정신청내용 : 
                             <div class="col-md-12">
                                <div class="form-group">
                                
                                	
                                    <textarea name="correctionContent" id="correctionContent2" cols="30" rows="7" class="form-control"></textarea>
                                </div>
                            </div>

                          </div>

                      </div>
                      <div class="modal-footer">
                      	<input type="hidden" id="corr">
                        <button type="button" class="btn btn-secondary viewBtn" data-dismiss="modal">확인</button>
                        <button type="button"data-dismiss="modal" id="transmit" class="btn btn-primary viewBtn">반려내용전송</button>
                      </div>
                    </div>
                  </div>
                </div> 
                         
         <script>
         $(".nameBtn").click(function(){
        	 var memberNo = $("#test1").text(); 
        	 var corrNo=$(this).parent().parent().children().eq(0).text();
        	 $("#corr").val(corrNo);
        	 var corrContent= $("#rList.corrContent").text();
        	 
         	console.log("corrNo:"+corrNo)
         	   $.ajax({
	   url : "${contextPath}/management/request",
	   dataType : "JSON",
	   data : {"corrNo":corrNo
		   }, 
	   type : "GET",	
	   
	   success:function(rList){
		   console.log(rList)
		   console.log(rList.corrContent)
		  $("#staticBackdrop").append(rList.corrContent);
		   $("#correctionContent").val(rList.corrContent);
    
	   },error:function(){
		   console.log("ajax 통신 실패");
 
		   
	   } 
 	   
   });
        });
         
       
         
         $("#transmit").click(function(){
        	var corrNo=$("#transmit").parent().children().eq(0).val();
        	var corrReContent=$("#correctionContent2").val();
        	console.log("^^ : " + corrNo);
        	 $.ajax({
        		url : "transmit" ,
        		data :{"corrNo" : corrNo,"corrReContent":corrReContent},
        		 success:function(result){
    					
    				   if(result>0){
    						alert("반려되었습니다.");
    						location.href = "requestPayStub";
    				   }else{
    					   alert("실패했습니다");
    					   location.href = "requestPayStub";
    				   }
    				  
                   
    			   },error:function(){	
    				   console.log("ajax 통신 실패");
    		 
    			   } 
        	 });
         });
        
         
        $("#month").change(function(){
        	 var month=$(this).val();
        	 
        	 console.log(month);
        	 
        	 if($("#all").prop("selected")){
          		location.href="${contextPath}/management/payStubList";
          	 }
        	 
        	 
        	 $.ajax({
        		 url:"select",
        		 data:{"month":month},
        		 dataType: "json",
        		 type : "GET",		 
        		 success:function(list){
        			$tbody = $("#updatePayStub > tbody");
        			 console.log(list);
        			 console.log($tbody);
        			
        			
        			$tbody.html("");
        			
        			 $.each(list, function(index, item){
       					$tr = $("<tr>");
               			
       					$td1 = $("<td>").text(item.corrNo);
       					$td2 = $("<td>").text(item.corrCreateDt);
       					$td3 = $("<td>").addClass("mddate").text(item.corrModifyDt);
       					$td4 = $("<td>").text(item.corrStatus);
       					
       					
       					
       					$td6btn = $("<button id='test' class='mt-2 btn btn-warning contentBtn btn-rounded nameBtn' type='button' data-toggle='modal' data-target='#staticBackdrop'>");	
       					$td6 = $("<td>");
       					/* $td6.append(item.memberName); */
       					$td6btn.append(item.memberName);
       					$tr.append($td1, $td2, $td3, $td4, $td6btn);
               			$tbody.append($tr);
               			
               			$("#correctionContent").val(item.corrContent);
               			
               			
        			 });
        		 },error:function(){
        			 location.reload();
        		 }
        	 });
         });
    </script>  
    </body>
</html>