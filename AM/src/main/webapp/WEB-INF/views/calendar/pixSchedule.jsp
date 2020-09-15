<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고정스케쥴 등록</title>
<!-- 아이콘 등록 -->
<link rel="icon" type="image/png" href="${contextPath}/resources/images/icons/am.ico"/>
<style>
	 .textS{
        display: inline-block;
        font-size: 20px;
        color: white;
    }
    
    .textA{
        display: inline-block;
        font-size: 20px;
    }
    #sDiv1{
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
	
	.okBtn2{
    	margin-right: 10px; 
    }
    
     .minus, .okBtn, .okBtn3{
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
    
    .back1{
    border-radius: 15px;
    padding: 20px;
    background-color: #589167;
    color: white;
    height: 240px;
    }
    
    .back2{
    border-radius: 15px;
    padding: 20px;
    border : 3px solid #589167;
    height: 240px;
        margin-bottom: 20px;
    }
    
    *{
	    font-family: 'S-CoreDream-6Bold' !important;
	}
    
</style>
</head>
<body>

	 	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
	
	
	
	
	
	
	<%--
		해야할 것
		1. 알바생 목록 option에 넣기
		2. + 버튼을 눌렀을 때 폼 추가되기
		3. 제출 버튼을 눌렀을 때 값 넘겨받고 값 확인하기
		4. 값 어떻게 넘겨줘야할지 생각하기
		5. 파트타임이 있을 때엔 파트타임으로 시간 설정할 수 있게
	
	 --%>
	
	<div id="sDiv1">
		<h2 id="t1">고정 스케쥴 등록</h2>
		
		<div class="back1">
            <h3  class="textS">근무자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <select>
           <c:forEach var="member" items="${eList}">
					<option value="${member.memberNo}">${member.memberName}</option>
			
			</c:forEach>
            </select>
            
           <hr>
                
            <h3 class="textS">요일선택 &nbsp; &nbsp;</h3>
        
            <input type="checkbox" name="day" value="월"><label class="dayL">월</label>
            <input type="checkbox" name="day" value="화"><label class="dayL">화</label>
            <input type="checkbox" name="day" value="수"><label class="dayL">수</label>
            <input type="checkbox" name="day" value="목"><label class="dayL">목</label>
            <input type="checkbox" name="day" value="금"><label class="dayL">금</label>
            <input type="checkbox" name="day" value="토"><label class="dayL">토</label>
            <input type="checkbox" name="day" value="일"><label class="dayL">일</label>

            <hr>

            <h3 class="textS">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input type="time" name="time" value="startTime">
            ~
            <input type="time" name="time" value="endTime">

            일근무 휴게시간 0시간 포함 0 시간

          
            <button class="okBtn" type="button">수정</button>
             <button class="minus" type="button">삭제</button>
           
         </div>
         
         <hr>
        <!-- 추가 고정근무 -->
         
         <div  class="back2">
            <h3  class="textA">근무자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <select>
                <c:forEach var="member" items="${eList}">
					<option value="${member.memberNo}">${member.memberName}</option>
			
			</c:forEach>
            </select>
            
           <hr>
                
            <h3 class="textA">요일선택 &nbsp; &nbsp;</h3>
        
            <input type="checkbox" name="day" value="월"><label class="dayL">월</label>
            <input type="checkbox" name="day" value="화"><label class="dayL">화</label>
            <input type="checkbox" name="day" value="수"><label class="dayL">수</label>
            <input type="checkbox" name="day" value="목"><label class="dayL">목</label>
            <input type="checkbox" name="day" value="금"><label class="dayL">금</label>
            <input type="checkbox" name="day" value="토"><label class="dayL">토</label>
            <input type="checkbox" name="day" value="일"><label class="dayL">일</label>

            <hr>

            <h3 class="textA">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input type="time" name="time" value="startTime">
            ~
            <input type="time" name="time" value="endTime">

            일근무 휴게시간 0시간 포함 0 시간
			<button class="okBtn3" type="button">확정</button>
         
         </div>
         
         
         
         <!-- 버튼 -->
         
         
             <a class="btn btn-primary pixSubmit " href="${contextPath}/calendar/workList">돌아가기</a>
         <button class="btn btn-primary pixSubmit okBtn2" type="submit">완료</button>
        </div>
     
	
	
	
	
	 <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
     <script>
    	$(".plus").on("click", function(){
    		console.log("버튼클릭");
    		
    		var partTime =  '<div class="backColor"> <div class="div2">  <h3 class="textS">별명 &nbsp;&nbsp;&nbsp;&nbsp;</h3>  <input  type="text" id="name" style="width: 100px;">   ex) 오전파트, 오후파트          </div>    	             <h3 class="textS">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>    	             <input type="time" name="time" value="startTime">    	             ~    	             <input type="time" name="time" value="endTime">    	         	    일근무 휴게시간 0시간 포함 0 시간  </div><hr>';
  			  $(".fromMain").append(partTime);
    		
    		
    	});
    	
    	$(".minus").on("click", function(){
    		$(".fromMain").children().last().remove();
    		$(".fromMain").children().last().remove();
    	});
    	
    </script>
    
</body>
</html>