<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadajax.jsp</title>
</head>
<body>
<div>
<form name="frm">
   <input type="text" name="writer"/>
   <input type="text" name="content"/>
</form>

<input type="file" name="uploadFile" multiple="multiple"/>

</div>
<button type="button" id="uploadBtn">upload</button>

<!-- jQuery 501페이지-->
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script>
$(function(){
   
   var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");         //회원가입, 등록 등에 자주 쓰임
   var maxSize = 5242880; //5MB

   function checkExtension(fileName, fileSize) {

      if (fileSize >= maxSize) {
         alert("파일 사이즈 초과");
         return false;
      }

      if (regex.test(fileName)) {
         alert("해당 종류의 파일은 업로드할 수 없습니다.");
         return false;
      }
      return true;
   }
   
   $("#uploadBtn").on("click", function(e){
      var formData = new FormData(document.frm);
      var inputfile = $("input[name='uploadFile']"); //form을 감싸고 document.frm만 해주면 주석된 부분 일일이 안써줘도 됨??
      var files = inputFile[0].files;
      for(i=0; i<files.length; i++){
         if( !checkExtension(files[i].name, file[i].size))
            return;
         formData.append("uploadFile", files[i]);   
      }
      //formData
      $.ajax({
         processData : false,   //필수
         contentType : false,   //필수
         url: "uploadAjaxAction",
         data: formData,
         method: "post",
         success : function(result){
            alert("Uploaded");
         }
      });
   });
});

</script>
</body>
</html>