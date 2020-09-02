<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>

</style>
</head>
<body>
	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="container board-list">
	
        <div style="height:650px">
            <table class="table table-hover table-striped" id="list-table">
                <thead>
                    <tr>
                        <th>이름 </th>
                        <th>이메일 </th>
                        <th>전화번호</th>
                        <th>근무조</th>
                        <th>근무시간</th>
                     
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty boardList}">
                			<tr>
	                			<td colspan="6">직원을 추가해주세요</td>      			
                			</tr>
                		</c:when>
                		<c:otherwise>

	                			<tr>
	                				<td></td>
	                				<td></td>
	                				<td></td>
	                				<td></td>
	                				<td></td>			
	                			</tr> 		
                		</c:otherwise>
                	</c:choose>
                </tbody>
            </table>
            <div class="bottom_btn" style="text-align: center;" >
		        <a class="btn btn-primary py-3 px-4">입사</a>
		        <a class="btn btn-primary py-3 px-4">퇴사</a>
            </div>
        </div>

        <hr>
	</div>
	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>