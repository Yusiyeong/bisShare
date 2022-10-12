<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 수정, 삭제 이모티콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
   #reply-area{
       width: 100%;
      margin-top: 25px;
    }
   
    #reply-top > textarea{
       width: 100%;
      height: 80px;
    }

   #reply-btn{
      float: right;
     margin-top: 10px;
   }
    
   
</style>
    
 <!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >여긴 제목</h6>
              </div>
              
              <div class="card-body">
             <!-- 내용start  -->
            <div class="form-floating">
               <textarea style="height: 350px;" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">여긴 내용</textarea>
            </div>
            <!-- 내용end -->
            
            <!-- 댓글start  -->
            <div id="reply-area">
			    <!-- 댓글 목록 조회start  -->
				<div class="card" style="width: 100%; margin-bottom: 15px;">
					<div class="card-body">
						<h5 class="card-title">유시영</h5>
						<h6 class="card-subtitle mb-2 text-muted">2022.01.05 10:12</h6>
						<p class="card-text">댓글내용!!!</p>
						<!-- 수정 -->
						<a href="#" class="card-link fa fa-pencil" style="font-size:17px;"></a> 
						<!-- 삭제 -->
						<a href="#" class="card-link far fa-trash-alt" style="font-size:17px;"></a>
					</div>					
				</div>		
               <!-- 댓글 목록 조회end  -->  
                  <!-- 댓글 목록 조회start  -->
				<div class="card" style="width: 100%; margin-bottom: 15px;">
					<div class="card-body">
						<h5 class="card-title">유시영</h5>
						<h6 class="card-subtitle mb-2 text-muted">2022.01.05 10:12</h6>
						<p class="card-text">댓글내용!!!</p>
						<!-- 수정 -->
						<a href="#" class="card-link fa fa-pencil" style="font-size:17px;"></a> 
						<!-- 삭제 -->
						<a href="#" class="card-link far fa-trash-alt" style="font-size:17px;"></a>
					</div>					
				</div>		
               <!-- 댓글 목록 조회end  --> 
               <!-- 댓글 작성start  -->
               <div id="reply-top">
                  <textarea id="reply-content" class="form-control" placeholder="내용을 입력하세요."></textarea>
               </div>
               <button id="reply-btn" class="btn btn-primary">등록</button>
               <!-- 댓글 작성end  -->
               
            </div>
         <!-- 댓글end  -->
            
           </div>
        </div>
      <!-- DataTales Example End-->
     </div>
<!-- End Page Content -->