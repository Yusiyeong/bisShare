<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#comment_list{
	margin: 20px;

}


</style>
    
 <!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >제목</h6>
              </div>
              
              <div class="card-body">
				 <!-- 내용start  -->
				<div class="form-floating">
					<textarea style="height: 350px;" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">아직 미완성</textarea>
				</div>
				<!-- 내용end -->
				
				<!-- 댓글start  -->
				<div class="form-floating" id="comment_list">
					<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
				</div>
				<!-- 댓글end  -->
			  </div>
		  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->
