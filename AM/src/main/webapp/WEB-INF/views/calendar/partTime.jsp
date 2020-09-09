<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트타임 등록</title>
<style>
 .textS{
        display: inline-block;
        padding-left: 8px;
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
    #backColor{
        background-color: rgb(52 187 75 / 53%);
            height: 150px;
    }
    #div2{
    	    padding-top: 30px;
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
		1. 시간 넘어가는 데이터 확인하기
		2. + 버튼 눌렀을 때 폼 추가
		3. - 누르면 해당 폼 삭제 
	
	 --%>
	   <div id="sDiv1">
	   <hr>
		<h2 id="t1">파크 타임 생성</h2>
		
        <form method="POST" action="" class="" name="" onsubmit="return validate();">
           <div id="backColor">
           <div id="div2">
            <h3 class="textS">별명 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input  type="text" id="name" style="width: 100px;">
            ex) 오전파트, 오후파트
        </div>
            <h3 class="textS">시간선택 &nbsp;&nbsp;&nbsp;&nbsp;</h3>
            <input type="time" name="time" value="startTime">
            ~
            <input type="time" name="time" value="endTime">

            일근무 휴게시간 0시간 포함 0 시간

        </div>
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