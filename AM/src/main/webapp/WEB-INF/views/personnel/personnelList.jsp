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
	
		<h1>${boardList[0].boardName}</h1>
	
        <div style="height:650px">
            <table class="table table-hover table-striped" id="list-table">
                <thead>
                    <tr>
                        <th>번호 </th>
                        <th>이름 </th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>퇴사여부</th>
                        <th></th>
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
            <div class="bottom_btn" style="display: flex;" >
		        <button >입사</button>
		        <button >퇴사</button>
            </div>
        </div>

        <hr>

	<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>