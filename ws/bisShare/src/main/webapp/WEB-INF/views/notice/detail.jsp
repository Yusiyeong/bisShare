<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}"/>
    
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
                  <h6 class="m-0 font-weight-bold text-primary" >사내 공지</h6>
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
                    
                     <h5>${vo.title}</h5>

                     <hr>

                     <div for="exampleFormControlInput1" class="form-label"> 작성자: ${vo.writer}</d>
                     <div for="exampleFormControlInput1" class="form-label"> 작성일: ${vo.enrollDate}</div>
                     <div for="exampleFormControlInput1" class="form-label"> 조회수: ${vo.cnt}</div> 
                  </div>
                </div>
               <!--end-->
             
             <!-- 내용start  -->
            <div class="form-floating">
               <textarea style="height: 350px;" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">${vo.content}</textarea>
            </div>
            <!-- 내용end -->
           
            <br>

            <!-- 댓글start  -->
            <div id="reply-area">

           <!-- 댓글 목록 조회start  -->
           <c:forEach items="${replyList}" var="x">
            <div class="card" style="width: 100%; margin-bottom: 15px;">
               <div class="card-body">
                  <h5 class="card-title">${x.writer}</h5>
                  <h6 class="card-subtitle mb-2 text-muted">${x.enrollDate}</h6>
                  <span class="card-text">${x.content}</span>
                  
              	  <div style="float: right;">
                       <!-- 수정 -->
                     <a href="#" class="card-link fa fa-pencil" style="font-size:17px;"></a> 
                     <!-- 삭제 -->
                     <a href="#" class="card-link far fa-trash-alt" style="font-size:17px;"></a>
                  </div>
                </div>               
             </div>  
             </c:forEach>
            <!-- 댓글 목록 조회end  --> 
               
               <!-- 댓글 작성start  -->
               <div id="reply-top">
	               <div class="input-group mb-3" style="height: 100px;">
	                  <input type="text" id="reply-content" name="content" style="height: 100%;"class="form-control" placeholder="Please type in the comments !">
	                  <button id="reply-btn" class="btn btn-outline-primary">등록</button>
	               </div>
               </div>
               <!-- 댓글 작성end  -->
               
            </div>
         <!-- 댓글end  -->
           </div>
        </div>
      <!-- DataTales Example End-->
     </div>
<!-- End Page Content -->


	<script>
	
	/* 댓글 작성 + 조회 에이잭스 */
	 const replyBtn = document.querySelector('#reply-btn');
	
	 replyBtn.addEventListener('click' , function(){
			
			const replyContent = document.querySelector('#reply-content').value;		
			const boardNo = ${vo.boardNo};		
			const replyWriterNick = '${sessionScope.loginVo.nick}';		
			
			$.ajax({
				url : "${root}/noticeReply/write" ,
				type : "POST" ,
				data : { 
					"content" : replyContent ,
					"bno" : boardNo		
				} ,
				success : function(result){
					if(result == 'ok'){
						alert("댓글 작성 성공 !");
						
						// 댓글 조회
						const target = document.querySelector('#reply-list');
						$(target).prepend( replyContent + replyWriterNick);

						document.querySelector('#reply-content').value = '';
					}else{
						alert("댓글 작성 실패!");
					}
				} ,
				error : function(){
					alert("통신 에러!");
				}
			});
		});
	
	</script>
	
	