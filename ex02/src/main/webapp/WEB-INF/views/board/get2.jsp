<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style>
.btn{
   font-weight:bold;
   border:0px;
   background-color:#D2E1FF;   
}
.btn:hover{
   background-color:#E0EBFF;   
}
</style>
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">Board read</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">BOARD READ PAGE</div>
         <div class="panel-body">
            <form role="form" action="${pageContext.request.contextPath}/board/modify" method="get">
               <div class="form-group">
                  <label>Bno</label><input name="bno" class="form-control" value='<c:out value="${board.bno}"/>'
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label>Title</label><input name="title" class="form-control"
                     value='<c:out value="${board.title}"/>' readonly="readonly">
               </div>
               <div class="form-group">
                  <label>Content</label>
                  <textarea name="content" class="form-control" rows="3"
                     readonly="readonly"><c:out value="${board.content}" /></textarea>
               </div>
               <div class="form-group">
                  <label>Writer</label><input name="writer" class="form-control" readonly="readonly"
                     value='<c:out value="${board.writer}" />'>
               </div>
               <!-- 0906 -->
                 <%--  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> --%>
               
               <button type="submit" class="btn btn-secondary">Modify</button>
               <button type="button" formaction="${pageContext.request.contextPath}/board/delete" class="btn btn-secondary">Delete</button>
               <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}'">List</button>
            </form>
            
            <!-- 댓글등록 -->
            <div class = "panel-heading">
            	<form id = "replyForm">
            		<input type = "hidden" name = "bno" value = "${board.bno }">
            		<input name = "replyer" value = "user10">
            		<input name = "reply">
            		<button type = "button" id = "saveReply">댓글등록</button>
            	</form>
            </div>
            
            <!-- 댓글 목록 -->
            <div class = "row">
            	<div class = "col-lg-12">
            		<h1 class = "page-hedder">Comments</h1>
            		<ul class = "chat">
            			
            		</ul>
            </div></div>
            <script src = "../resources/js/reply.js"></script>
            <script>
            	let bno = "${board.bno}";
            	$(function(){
            		//등록처리
            		$("#saveReply").on("click", function(){
            			replyService.add(function (data) { 
            				$(".chat").append(makeLi(data));
                		});
            		});
            		
            		
            		
            		//목록조회
            		replyService.getList({bno:bno}, listCallback)
            		
            		//목록 콜백함수
            		function listCallback(datas)
	            		//console.log(datas);
	    				var str = "";
	    				for(i=0; i<datas.length; i++) {
	    					str += makeLi(datas[i]);
	    				}
	    				$(".chat").html(str);
	    			}
    				
            		//댓글 태그 만들기
            		function makeLi(data) {
	            		return	 '<li class="left clearfix">'
		                        + '   <div>'
		                        + '      <div class="header">'
		                        + '      <strong class="primary-font">'+ data.replyer +'</strong>'
		                        + '         <small class="pull-right text-muted">'+ data.replydate +'</small>'
		                        + '      </div>'
		                        + '      <p>'+ data.reply +'</p>'
		                        + '   </div>'         
		                        + '</li>';

            		}
            				
            	})
            </script>
            <div> </div>
         </div>
      </div>
   </div>
</div>
<br><br>
<!-- <script>
   $(document).ready(function () {
      var operForm = $('#operForm');

      $("button[data-oper='modify']").on("click", function (e) {
         operForm.attr("action", "${pageContext.request.contextPath }/board/modify").submit();
      });
      $("button[data-oper='list']").on("click", function (e) {
         operForm.find("#bno").remove();
         operForm.attr("action", "${pageContext.request.contextPath }/board/list")
         operForm.submit();
      });
   });
</script> -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>