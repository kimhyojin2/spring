<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">이게 진짜 게시글 상세보기야?</h1>
	</div>
	<!-- /.col-lg-12 -->

<table class = "table" id = "board">
<tbody>
	<tr><td>글 번호</td>
		<td>${board.bno }</td>
	</tr>
	<tr><td>제목</td>
		<td>${board.title }</td>
	</tr>
	<tr><td>내용</td>
		<td>${board.content }</td>
	</tr>
	<tr><td>작성자</td>
		<td>${board.writer }</td>
	</tr>
	<tr><td>게시일</td>
		<td><fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd" /></td>
	</tr>
	<tr><td>수정일</td>
		<td><fmt:formatDate value="${board.updatedate}" pattern="yy-MM-dd" /></td>
	</tr>
</tbody>		
</table>

</div>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>