<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
    
<!-- alert 띄우기 위함 -->
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
<c:remove var="alertMsg" scope="session"/>

<c:if test="${not empty alertMsg}">
	 <script>
	 	alert('${alertMsg}');
	 </script>
</c:if>


<style>
   
    #reply-top > textarea{
       width: 100%;
      height: 80px;
    }
    
    a { text-decoration:none !important ;color: blue;}

    a:hover { text-decoration:none !important }
  
</style>
    
 <!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >파일 업로드</h6>
              </div>
              
              <div class="card-body">
               
               <!--start-->
               <div class="mb-3">
                  <div style="margin-bottom: 12px; font-size: 13px;">
                     
               <!--수정, 삭제 버튼start-->
               <c:if test="${vo.writer eq loginVo.nick}">	
	               <div style="margin-bottom: 7px; float: right;">
	                  <!-- 수정 -->
	                  <a href="${root}/cloud/edit/${vo.boardNo}" class="btn btn-outline-warning btn-sm">수정</a> 
	                  <!-- 삭제 -->
	                  <a href="${root}/cloud/delete/${vo.boardNo}" class="btn btn-outline-danger btn-sm">삭제</a>
               </c:if>
	                  <!-- 목록으로 -->
	                  <a href="${root}/cloud/list/1" style="float: right; margin-left: 3px;" class="btn btn-outline-primary btn-sm">목록으로</a>
	               </div>
               <!--수정, 삭제 버튼end-->
                    
                     <h5>${vo.title}</h5>

                     <hr>

                     <div for="exampleFormControlInput1" class="form-label"> 작성자: ${vo.writer}</d>
                     <div for="exampleFormControlInput1" class="form-label"> 작성일: ${vo.enrollDate}</div>
                     <div for="exampleFormControlInput1" class="form-label"> 조회수: ${vo.cnt}</div> 
                     
                     <div for="exampleFormControlInput1" class="form-label" style="margin-top: 30px;">
                     	아래 파일을 클릭하여 다운 받으세요.
                     </div>
                     
		                <div class="form-control" id="floatingTextarea">
		                	파일: <a href="${root}/cloud/download/${vo.profilePath}"> ${vo.profilePath}</a>
		                </div>
		              
                     
                  </div>
                </div>
               <!--end-->
             
             <!-- 내용start  -->
            <div class="form-floating">
               <div style="height: 350px; overflow: auto;" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">${vo.content}</div>
            </div>
            <!-- 내용end -->
           
            <br>
 			
 			<script>
               document.querySelector('#floatingTextarea').innerHtml = ${vo.content};
            </script>
            
           </div>
        </div>
      <!-- DataTales Example End-->
     </div>
<!-- End Page Content -->

   