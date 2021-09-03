<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">이게 진짜 게시판이야?</h1>
	</div>
	<!-- /.col-lg-12 -->
	
	<table class = "table" id = "board">
	<thead>
		<tr><th>글 번호</th><th>제목</th><th>내용</th><th>작성자</th><th>작성일</th><th>수정일</th>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno }</td>
				<td><a href="get?bno=${board.bno }">${board.title }</a></td>
				<td>${board.content }</td>
				<td>${board.writer }</td>
				<!-- jstl formatdate 구글링 -->
				<td><fmt:formatDate value="${board.regdate}" pattern="yy-MM-dd" /></td>
				<td><fmt:formatDate value="${board.updatedate}" pattern="yy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
</div>
<script>
$(function(){
	$("#board").DataTable();
})
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>