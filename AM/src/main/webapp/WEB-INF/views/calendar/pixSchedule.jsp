<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고정스케쥴 등록</title>
<style>
	 .textS{
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
	
	.okBtn{
    	margin-right: 10px; 
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
        <form method="POST" action="" class="" name="" onsubmit="return validate();">
           
           
           
            <h3  class="textS">근무자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <select>
                <option>김알밥</option>
                <option>김알밥</option>
                <option>김알밥</option>
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

            <hr>
            <button class="btn btn-primary" type="button">+</button>
            <hr>
             <a class="btn btn-primary pixSubmit " href="${contextPath}/calendar/workList">돌아가기</a>
         <button class="btn btn-primary pixSubmit okBtn" type="submit">완료</button>
        </div>
            
        </form>
	</div>
	
	
	
	 <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>