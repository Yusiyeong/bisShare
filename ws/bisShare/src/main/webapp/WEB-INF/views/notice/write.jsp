<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<script>
$(document).ready(function() {
     $('#summernote').summernote({
           placeholder: 'content',
           minHeight: 370,
           maxHeight: null,
           focus: true, 
           lang : 'ko-KR'
     });
   });
</script>



		<!-- Begin Page Content -->
            <div class="container-fluid">
               <!-- DataTales Example Start-->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >글 작성</h6>
                   </div>
                   <div class="card-body">
	                   	  <form method="post" action="">
					         <input type="text" name="title" style="width: 84%;" placeholder=" title"/>
					         <input class="btn btn-secondary btn-sm" value="취소" style="float: right; width: 7%;" onclick=""/> 
					         <input class="btn btn-primary btn-sm" type="submit" value="작성" style="float: right; width: 7%; margin-right: 8px;" onclick="goWrite(this.form)"/> 
					         <br><br> 
					         <textarea id="summernote" name="content"></textarea>
					      </form>
					      
                   </div>

				</div>
				<!-- DataTales Example End-->
			</div>
		<!-- End Page Content -->