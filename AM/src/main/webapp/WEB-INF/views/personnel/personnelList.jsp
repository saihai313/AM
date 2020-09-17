<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style>
	#notLogin{
		width: 100%;
		height: 800px;
		line-height: 600px;
		text-align: center;
	}
	
	#list-table td{
		cursor: pointer;
	}
	
	#list-table tr{
		cursor: default;
	}
	.bottom_btn{
		padding-top: 20px;
	}
</style>

</head>
<body>
	<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<c:choose>
		<c:when test="${empty loginMember.memberName }">
			<!--  로그인 x -->
			<div id="notLogin">로그인 후 이용해주세요</div>
		</c:when>
		
		<c:when test="${!empty loginMember.memberName }">
			<div class="container board-list">
			
		        <div style="height:650px">
		            <table class="table table-hover table-striped" id="list-table">
		                <thead>
		                    <tr>
		                    	<th></th>
		                        <th>이름 </th>
		                        <th>이메일 </th>
		                        <th>전화번호</th>
		                     	<th>시급</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:choose>
		                		<c:when test="${empty personnelList}">
		                			<tr>
			                			<td colspan="5">직원을 추가해주세요</td>      			
		                			</tr>
		                		</c:when>
		                		<c:otherwise>
		                			<c:forEach var="personnelList" items="${personnelList}">
			                			<tr>
			                				<!-- <td><input type="checkbox" name="toDelete"></td> -->
			                				<td class="toView"><input type="hidden" name="memberNo" value="${personnelList.memberNo}"></td>
			                				<td class="toView">${personnelList.memberName}</td>
			                				<td class="toView">${personnelList.memberEmail}</td>
			                				<td class="toView">${personnelList.memberPhone}</td>
			                				<td class="toView">${personnelList.sal}원</td>
			                			</tr>
			                		</c:forEach>
			                	</c:otherwise>
		                	</c:choose>
		                </tbody>
		            </table>
		            <div class="bottom_btn" style="text-align: center;" >
				        <button id="addEmployee" class="btn btn-primary py-3 px-4">직원추가</button>
		            </div>
		        </div>
		
		        <hr>
			</div>
		</c:when>
	</c:choose>
	<!-- ------------------------- footer ---------------------------- -->

   	<script>
   		$("#addEmployee").click(function(){
   			swal({
   			  content: {
   			    element: "input",
   			    attributes: {
   			      placeholder: "추가 할 직원의 이메일을 입력해주세요.",
   			      type: "email",
   			    },
   			  },
   			});
   		});
   		

   		
   		
		$(function(){
			$("#list-table .toView").on("click", function(){
			
				var memberNo = $(this).parent().children().eq(0).children().eq(0).val();
				console.log(memberNo);
				var boardUrl = 
					"${contextPath}/personnel/personnelView";	
					
				$form = $("<form>", {"action" : boardUrl, "id" : "tmpForm","method":"post"});
				$form.append($("<input>", {"type" : "hidden", "name" : "memberNo","value":memberNo}));
				$("#list-table").after($form);
					
				$("#tmpForm").submit();
				//location.href = boardUrl;
			});
		});	
   		
   		
   	</script>
<!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>