<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
 
 
      <!-- Begin Page Content -->
            <div class="container-fluid">
               <!-- DataTales Example Start-->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >글 작성</h6>
                   </div>
                   <div class="card-body">
                   <!-- form start -->
                     <form method="post" action="">
                     
                        <input type="text" name="title" style="width: 84%;" placeholder=" title"/>
                        
                        <a onclick="history.go(-1)" class="btn btn-secondary btn-sm" style="float: right; width: 7%;">취소</a> 
                        <input type="submit" value="작성" class="btn btn-primary btn-sm" style="float: right; width: 7%; margin-right: 8px;" onclick="goWrite(this.form)"/> 
                       
                        <br><br> 
                        
                        <textarea class="summernote" name="content"></textarea>
                        
                     </form>
                     <!-- form end -->
                   </div>

            </div>
            <!-- DataTales Example End-->
         </div>
      <!-- End Page Content -->
      

<script>
$('.summernote').summernote({
   height: 700,               
   minHeight: null,          
   maxHeight: null,             
   focus: true,             
   lang: "ko-KR",            // 한글 설정
   placeholder: 'content',      //placeholder 설정
   callbacks : {
      onImageUpload : function(files) {
         var reader = new FileReader();
         reader.readAsDataURL(files[0]);
         reader.onload = function() {
            const url = reader.result;
            $.ajax({
               data : {img : url},
               url : "${root}/notice/imgUpload",
               method : "POST",
               success : function(path) {
                  console.log('success');
                  const imgNode = document.createElement('img');
                  imgNode.setAttribute('src',path);
                  $('.summernote').summernote('insertNode',imgNode);
               }//success
            });//ajax
         };//function
      }//onImageUpload
   }//callbacks
   
});


</script>