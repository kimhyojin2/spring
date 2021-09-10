<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">게시글 등록</h1>
   </div>
   <form action="register" method="post" enctype="multipart/form-data">
      <input name="writer" value="${board.writer}"/>
      <input name="title" value="${board.title}"/>
      <input name="content" value="${board.content}"/>
      <button>등록</button>
      <input type="file" name="uploadFile" multiple="multiple"/>
   </form>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>