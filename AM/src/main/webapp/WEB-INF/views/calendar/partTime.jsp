<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트타임 등록</title>
<!-- 아이콘 등록 -->
<link rel="icon" type="image/png" href="${contextPath}/resources/images/icons/am.ico"/>
<style>
	*{
	    font-family: 'S-CoreDream-6Bold' !important;
	}

 .textS{
        display: inline-block;
        padding-left: 8px;
            font-size: 20px;
              color: white;
    }
    
    .textS2{
        display: inline-block;
        padding-left: 8px;
            font-size: 20px;
    }
    .sDiv1{
    	margin: 70px;
    	
    
    }
    
   #t1{
   	padding-bottom: 60px;
   	font-weight: bold;
       
   }
	
	.dayL{
		padding-right: 10px;
	}
	
	.pixSubmit{
		float: right;
	}
    .backColor{
            border: 4px solid rgb(88 145 103);
    height: 150px;
    border-radius: 10px;
        padding-left: 20px;
    }
     .backColor2{
    border: 4px solid rgb(88 145 103);
    background-color : rgb(88 145 103);
    height: 150px;
    border-radius: 10px;
        padding-left: 20px;
        color: white;
    }
    .div2{
    	    padding-top: 30px;
    }
    
        
    .bm{
    	padding-right: 40px;
    }
    
    .okBtn2{
   		 margin-right: 10px;
    }
    .minus, .okBtn{
    	width: 50px;
    	height: 40px;
    float: right;
    background-color: white;
    border-radius: 10px;
    font-weight: bolder;
    font-size: 15px;
    margin-right: 10px;
    margin-top: 20px; 
    }
</style>
</head>
<body>

	 	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
	<%--
		해야할 것
		1. 시간 넘어가는 데이터 확인하기
		2. + 버튼 눌렀을 때 폼 추가
		3. - 누르면 해당 폼 삭제 
	
	 --%>
	   <div class="sDiv1">
	   <hr>
		<h2 id="t1">파트 타임 생성</h2>
		
        <form method="POST" action="${contextPath}/calendar/updatePartTime" class="" name="updatePartTimForm">
       
       <c:choose>
       	
       	
       	<c:when test="${!empty pList}">
       	<%-- 파트타임 목록이 존재하는 경우 --%>
       		 <div class='fromMain'>
       		<c:forEach items="${pList}" var="p">
       		
       		<c:if test="${p.partStart <10}">
			 <c:set var="start" value="0${p.partStart}"/>								
			</c:if>
			
			<c:if test="${p.partStart >=10}">
			 <c:set var="start" value="${p.partStart}"/>								
			</c:if>
       		
       			<c:if test="${p.partEnd <10}">
			 <c:set var="end" value="0${p.partEnd}"/>								
			</c:if>
			
			<c:if test="${p.partEnd >=10}">
				
			 <c:set var="end" value="${p.partEnd}"/>								
			</c:if>
       		
       		
       		
       		
       		
           <div class="backColor2">
           <div class="div2">
       		 <input type="hidden" value="${p.partNo}"name="partNo">
            <h3 class="textS bm">별명 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input  type="text" id="name" name="partName" style="width: 100px;" value="${p.partName}">
            ex) 오전파트, 오후파트
        </div>
            <h3 class="textS">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input type="time" name="partStart" value="${start}:00" value2="startTime" >
            ~
            <input type="time" name="partEnd" value="${end}:00" value2="endTime" >
            
		
		            일근무 휴게시간 0시간 포함 0 시간
		
	 	<button class="minus" type="button">삭제</button>
         <button class="okBtn" type="button">수정</button>
        </div>
        
            <hr>
            
          </c:forEach>  
            
          </div>
          
        
       	
       	
       	
       	</c:when>
       
       </c:choose>
        
          
            
        </form>
    
          
	</div>
	
	<div class="sDiv1">
	    <hr>
         <form method="POST" action="" class="" name="" onsubmit="return validate();">
        <div class='fromMain insertForm'>
           <div class="backColor">
           <div class="div2">
            <h3 class="textS2 bm">별명 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input  type="text" id="name" style="width: 100px;">
            ex) 오전파트, 오후파트
        </div>
            <h3 class="textS2">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input type="time"  name="partStart" value="startTime" >
            ~
            <input type="time"  name="partEnd" value="endTime">

            일근무 휴게시간 0시간 포함 0 시간

        </div>
            <hr>
          </div>
            <button class="btn btn-primary plus" type="button">+</button>
            <button class="btn btn-primary minus2" type="button">-</button>
            <hr>
         <a class="btn btn-primary pixSubmit " href="${contextPath}/calendar/workList">돌아가기</a>
         <button class="btn btn-primary pixSubmit okBtn2" type="submit">완료</button>
        </form>
	</div>
	
	 <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
    
    	// 파트목록 수정 버튼
    	$(".okBtn").on("click", function(){
    		
    		console.log("이름" +$(this).parent().children(".div2").find("input[id=name]").val());
    		console.log("시작" + $(this).parent().find("input[name=partStart]").val().substr(0,2));
    		console.log("끝" + $(this).parent().find("input[name=partEnd]").val().substr(0,2));
    		console.log("파트번호" + $(this).parent().find("input[name=partNo]").val());
    		
    		if(confirm("정말 수정하시겠습니까?")){
    			
    			console.log("출력 " + $(this).parent().children(".div2").find("input[id=name]").val());
    			
    			var name = $(this).parent().children(".div2").find("input[id=name]").val();
    			var start = $(this).parent().find("input[name=partStart]").val().substr(0,2);
    			var end = $(this).parent().find("input[name=partEnd]").val().substr(0,2);
    			var partNo = $(this).parent().find("input[name=partNo]").val();
    			
    			
    			$.ajax({
    				url : "${contextPath}/calendar/partTimeUpdate",
    				type : "POST",
    				data : {"partName" : name,
    						"partNo" : partNo,
    						"partStart" : start,
    						"partEnd" : end},
    				dataType : "text",
    				success : function(result){
    					// 0 실패, 1 성공
    					
    					alert(result);
    					
    					//location.href = "${contextPath}/calendar/partTime";
    				},
    				error : function(){
    					console.log("통신 실패");
    				}
    				
    				
    			});
    				
    				
    			
    		}
    		
    		
    	});
    	
    	
    	// 파트타임 목록 부분 삭제 버튼
    	$(".minus").on("click", function(){
    		
    		if(confirm("정말 삭제하시겠습니까?")){
    			
    			console.log("출력 " + $(this).parent().children(".div2").find("input[id=name]").val());
    			
    			var name = $(this).parent().children(".div2").find("input[id=name]").val();
    			
    			
    			$.ajax({
    				url : "${contextPath}/calendar/partTimeDelete",
    				type : "POST",
    				data : {"partName" : name},
    				dataType : "text",
    				success : function(result){
    					// 0 실패, 1 성공
    					
    					alert(result);
    					
    					location.href = "${contextPath}/calendar/partTime";
    				},
    				error : function(){
    					console.log("통신 실패");
    				}
    				
    				
    			});
    				
    				
    			
    		}
    		
    		
    	});
    	
    	
    	
    //--------------------------------------------------------------------------------------------
    
    	
    // 삽입부분 입력 폼 추가	
   	$(".plus").on("click", function(){
   		console.log("버튼클릭");
   		
   		var partTime =  '<div class="backColor"> <div class="div2">  <h3 class="textS2 bm">별명 &nbsp;&nbsp;&nbsp;&nbsp;</h3>  <input  type="text" id="name" style="width: 100px;">   ex) 오전파트, 오후파트          </div>    	             <h3 class="textS2">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>    	             <input type="time"  name="partStart" value="startTime">    	             ~    	             <input type="time"  name="partEnd" value="endTime">    	         	    일근무 휴게시간 0시간 포함 0 시간  </div><hr>';
 			  $(".insertForm").append(partTime);
   		
   		
   	});
    	
    // 삽입부분 입력 폼 삭제
	$(".minus2").on("click", function(){
    	
    		
    		
    		$(".insertForm").children().last().remove();
    		$(".insertForm").children().last().remove();
    	});
    	
    </script>
</body>
</html>