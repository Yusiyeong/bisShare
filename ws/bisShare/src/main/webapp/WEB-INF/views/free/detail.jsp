<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 수정, 삭제 이모티콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                  <h6 class="m-0 font-weight-bold text-primary" >자유 게시판</h6>
              </div>
              
              <div class="card-body">
               
               <!--start-->
               <div class="mb-3">
                  <div style="margin-bottom: 12px; font-size: 13px;">
                     
               <!--수정, 삭제 버튼start-->
               <div style="margin-bottom: 7px; float: right;">
                  <!-- 수정 -->
                  <a href="#" class="btn btn-outline-warning btn-sm">수정</a> 
                  <!-- 삭제 -->
                  <a href="#" class="btn btn-outline-danger btn-sm">삭제</a>
                  <a href="" class="btn btn-outline-primary btn-sm">목록으로</a>
               </div>
               <!--수정, 삭제 버튼end-->

                    
                     <h5>아이스 아메리카노 라떼 샷 추가</h5>

                     <hr>

                     <div for="exampleFormControlInput1" class="form-label"> 작성자: 유시영</d>
                     <div for="exampleFormControlInput1" class="form-label"> 작성일: 2022.01.05</div>
                     <div for="exampleFormControlInput1" class="form-label"> 조회수: 777</div> 
                  </div>
                </div>
               <!--end-->
             
             <!-- 내용start  -->
            <div class="form-floating">
               <textarea style="height: 350px;" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">여긴 내용</textarea>
            </div>
            <!-- 내용end -->
           
            <br>

            <!-- 댓글start  -->
            <div id="reply-area">
            
               <!-- 댓글 작성start  -->
                  <div id="reply-top">
   
                  <div class="input-group mb-3" style="height: 100px;">
                     <input type="text" style="height: 100%;"class="form-control" placeholder="Please type in the comments !">
                     <button class="btn btn-outline-primary">등록</button>
                  </div>
   
                  </div>
                  <!-- 댓글 작성end  -->
   
   
                 <!-- 댓글 목록 조회start  -->
                  <div class="card" style="width: 100%; margin-bottom: 15px;">
                     <div class="card-body">
                        <h5 class="card-title">유시영</h5>
                        <h6 class="card-subtitle mb-2 text-muted">2022.01.05 10:12</h6>
                        <span class="card-text">댓글내용!!!</span>
                    <div style="float: right;">
                             <!-- 수정 -->
                           <a href="#" class="card-link fa fa-pencil" style="font-size:17px;"></a> 
                           <!-- 삭제 -->
                           <a href="#" class="card-link far fa-trash-alt" style="font-size:17px;"></a>
                        </div>
                     </div>               
                  </div>      
                  <!-- 댓글 목록 조회end  --> 
                     
               
            </div>
         <!-- 댓글end  -->
            
           </div>
        </div>
      <!-- DataTales Example End-->
     </div>
<!-- End Page Content -->