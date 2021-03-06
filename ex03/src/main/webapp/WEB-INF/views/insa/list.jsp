<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<h1>사원등록</h1>
<form action = "list" method = "post">
	firstName<input name = "firstName"><br>
	lastName<input name = "lastName"><br>
	email<input name = "email"><br>
	phoneNumber<input name = "phoneNumber"><br>
	hireDate<input name = "hireDate"><br>
	jobid<select name = "jobId">
			<option value = "">선택</option>
			<c:forEach items = "${jobs }" var = "job">
				<option value = "${job.jobId }">${job.jobTitle }</option>
			</c:forEach>
		</select><br>
	salary<input name = "salary"><br>
	commissionPct<input name = "commissionPct"><br>
	managerId<input name = "managerId">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#empModal">검색</button><br>
	departmentId<input name = "departmentId"><br>
	<button>등록</button>
</form>

<div class="modal" tabindex="-1" id = "#empModal">
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