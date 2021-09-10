<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
	.require {
		color : red;
	}
	.emp {
		cursor : pointer;
	}
	.emp:hover {
		color : purple;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script>
$(function(){
	function validation(){
		if(frm.lastName.value == "") {
			alert("이름입력");
			frm.lastName.focus();
			return false;
		}
		return true;
	}
	//등록버튼
	$("#btnResgister").on("click", function(){
		if(validation()){
			frm.submit();
		}
	})
	
	
	//매니저 검색
	$("#btnEmpSearch").on("click", function(){
		//검색 페이지를 ajax -> 모달 바디 넣고 -> 모달
		$.ajax({
			url : "empSearch",
			success : function(data){
				$("#empModal .modal-body").html(data);
				$('#empModal').modal('show');
			}
		});
	});
	//매니저 단건검색
	$("#managerId").on("keydown", function(e){
		$('#name').val("");
		if($("#managerId").val() == "")
			return;
		if(e.keyCode == 13) {
			e.preventDefault();
			$.ajax({
				url : "ajaxEmp",
				data : {employeeId : $("#managerId").val()},
				success : function(data) {
					if(data) {
						$("#name").val(data.firstName)
					} else {
						$("#btnEmpSearch").click();
					}
				}
			});
		}
	})
	
	document.addEventListener('keydown', function(event)) {
		if()
	}
});
</script>
<h1>사원등록</h1>
<form name = "frm" action = "${not empty emp ? 'insertEmp' : 'updateEmp'} method = "post">
	<c:if test = "${not empty emp}">
		<input name = "employeeId" value = "${emp.employeeId}">
	</c:if>
	firstName<input name = "firstName" value = "${emp.firstName}"><br>
	lastName<input name = "lastName" value = "${emp.lastName}"><br>
	email<input name = "email" value = "${emp.email}"><span id = "result"></span><br>
	phoneNumber<input name = "phoneNumber" value = "${emp.phoneNumber}"><br>
	hireDate<input name = "hireDate" value = "${emp.hireDate}"><br>
	jobid<select name = "jobId">
			<option value = "">선택</option>
			<c:forEach items = "${jobs }" var = "job">
				<option value = "${job.jobId }">${job.jobTitle }</option>
			</c:forEach>
		</select><br>
	salary<input name = "salary"><br>
	commissionPct<input name = "commissionPct"><br>
	managerId<input name = "managerId" id = "managerId"><input id = "name">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" id = "btnEmpSearch">검색</button><br>
	departmentId<input name = "departmentId"><br>
	<button type = "button" id = "btnResgister">등록</button>
</form>

<div class="modal" tabindex="-1" id = "empModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>