<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest.jsp</title>
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script>
$(function(){      //page ready 이벤트

	//addEventListener와 동일 이벤트 여러개 추가 기능
	$("#btn1").on("click", function(){
		$.ajax({
			url : "ajax1",
			method : "get",     //post
			data : {writer : $("#writer").val()},    //"writer=" + $("#writer").val(),
			//async : false,    //동기식 호출
			dataType : "json",   //plain=text (string), json(객체), xml
			success : function(data){
				$("#result").append(data.content + "<br>");
				$("#result").append(data.writer + "<br>");
			}
		});
		$("#result").append("클릭됨<br>");
	})  //btn1 click end
	
	$("#btn2").on("click", function(){
		$.ajax({
			url : "ajax2",
			method : "post",
			data : JSON.stringify({writer : $("#writer").val()}),  //@RequestBody가 들어가면 33,34행은 셋투셋투
			contentType : "application/json",
			dataType : "json",
			success : function(data){
				//$("#result").append($("<p>").append(data.content)
				//							  .append("<br>")
				//							  .append(data.writer))
				$("#result").append($(`<p>\${data.content}<br>\${data.writer}</p>`))
				//$("#result").append($('<p>' + data.content + "<br>" + data.content + '</p>'))
			} //success end
		});  //ajax end
	}) // btn2 click end
	
	//그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트 지정
	//부모 태그에 이벤트 지정
	$("#result").on("click", "p", function(){
		$(this).remove();
	})
})   //end of $(function(){
</script>
</head>
<body>
<input name = "writer" id= "writer">
<button type = "button" id = "btn1">문자열</button>
<button type = "button" id = "btn2">파라미터(json)</button>
<div id = "result"></div>

</body>
</html>