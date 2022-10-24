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
               <c:if test="${vo.writer eq loginVo.nick}">	
	               <div style="margin-bottom: 7px; float: right;">
	                  <!-- 수정 -->
	                  <a href="${root}/notice/edit/${vo.boardNo}" class="btn btn-outline-warning btn-sm">수정</a> 
	                  <!-- 삭제 -->
	                  <a href="${root}/notice/delete/${vo.boardNo}" class="btn btn-outline-danger btn-sm">삭제</a>
               </c:if>
	                  <!-- 목록으로 -->
	                  <a onclick="history.go(-1)" style="float: right; margin-left: 3px;" class="btn btn-outline-primary btn-sm">목록으로</a>
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
            <div id="reply-list" class="card" style="width: 100%; margin-bottom: 15px;">
               <div class="card-body">
                  <h5 class="card-title">${x.writer}</h5>
                  <h6 id="enrollDate" class="card-subtitle mb-2 text-muted">${x.enrollDate}</h6>
                  <span id="edit-content" class="card-text">${x.content}</span>
                  
                   <c:if test="${x.writer eq loginVo.nick}">	
	                   <div style="float: right;">
	                       <!-- 수정 -->
	                       <a type="button" id="edit-btn" data-value="${x.replyNo}" class="card-link fa fa-pencil" style="font-size:17px;"></a> 
	                       <!-- 삭제 -->
	                       <a type="button" id="delete-btn" data-value="${x.replyNo}" class="card-link far fa-trash-alt" style="font-size:17px;"></a>
	                       
	                       <!-- 연필 클릭 시 -> 수정 생성 폼start -->
			               <div id="reply-top" hidden>
			                  <div id="enroll" class="input-group mb-3" style="height: 100px;">
			                     <input type="text" id="editText-content" name="content" style="height: 100%;"class="form-control" placeholder="Please type in the comments !">
			                     <button id="editComplete-btn" class="btn btn-outline-primary">수정하기</button>
			                  </div>
			               </div> 
			               <!-- 연필 클릭 시 -> 수정 생성 폼end -->
               
	                  </div>
                  </c:if>
                  
                </div>               
             </div>  
             </c:forEach>
            <!-- 댓글 목록 조회end  --> 
               
               <!-- 댓글 작성start  -->
               <c:if test="${not empty loginVo}">
               <div id="reply-top">
                  <div class="input-group mb-3" style="height: 100px;">
                     <input type="text" id="reply-content" name="content" style="height: 100%;"class="form-control" placeholder="Please type in the comments !">
                     <button id="reply-btn" class="btn btn-outline-primary">등록</button>
                  </div>
               </div> 
               </c:if>
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
      replyBtn.addEventListener("click" , function(){
         
         const replyContent = document.querySelector('#reply-content').value;      
         const boardNo = ${vo.boardNo};      
         const replyWriterNick = '${sessionScope.loginVo.nick}';   

         
         // 작성일
         var today = new Date();

         var year = today.getFullYear();
         var month = ('0' + (today.getMonth() + 1)).slice(-2);
         var day = ('0' + today.getDate()).slice(-2);
         var hours = ('0' + today.getHours()).slice(-2); 
         var minutes = ('0' + today.getMinutes()).slice(-2);
         var seconds = ('0' + today.getSeconds()).slice(-2); 

         var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
         
         $.ajax({
            url : "${root}/noticeReply/write" ,
            type : "POST" ,
            data : { 
               "content" : replyContent ,
               "bno" : boardNo , 
            } ,
            success : function(result){
               if(result == 'ok'){
                  alert("댓글 작성 성공 !");
                  
                  // 댓글 조회
                  const target = document.querySelector('#reply-list');
                  
                  var html = 

	                  "<div class='card' style='width: 100%; margin-bottom: 15px;'>"+
	                     "<div class='card-body'>"+
	                        "<h5 class='card-title'>"+replyWriterNick+"</h5>"+
	                        "<h6 class='card-subtitle mb-2 text-muted'>"+dateString+"</h6>"+
	                        "<span class='card-text'>"+replyContent+"</span>"+
	                        
	                         "<div style='float: right;'>"+
	                         	"<a type='button' id='edit-btn' data-value='${x.replyNo}' class='card-link fa fa-pencil' style='font-size:17px;'>"+"</a>"+ 
	                            "<a type='button' id='delete-btn' data-value='${x.replyNo}' class='card-link far fa-trash-alt' style='font-size:17px;'>"+"</a>"+
	                        "</div>"+
	                      "</div>"+         
	                   "</div>";
                      
                  $(target).prepend(html);
                  
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
   
   <script>
   /*댓글 삭제*/
   const deleteBtn = document.querySelector('#delete-btn');
   
   deleteBtn.addEventListener("click", function(){
	   
   var replyNo = document.getElementById("delete-btn").getAttribute('data-value');
   console.log(replyNo); 
   
	   $.ajax({
		   
		   url : "${root}/noticeReply/delete" ,
           type : "POST" ,
           data : { 
              "replyNo" : replyNo ,
           } ,
           success : function(result){
        	   if(result == 'ok'){
        		   alert('댓글 삭제 성공!')
        		   
        		   // 삭제된거 빼고 다시 댓글 조회
                   $("#reply-list").empty();
                   
        	   }else{
        		   alert('댓글 삭제 실패!')
        	   }
        	   
           },
           error : function(){
        	   alert("통신 에러!");
           }
		   
	   });
	   
   });
   </script>
   
   
    <script>
   /*댓글 수정*/
   /* 연필 버튼 클릭 시 -> 수정 폼 생성 */
   const editBtn = document.querySelector('#edit-btn');
   editBtn.addEventListener("click", function(){
	   
	   // 기존span 지우기
	   $("#edit-content").empty();//ysy
	   $("#enrollDate").empty();//ysy
	   
	   // 연필, 휴지통 이모티콘 숨기기 -- 추가함
	   $('a').hide();
	   
	   // 수정 폼 나타내기
	   const target = document.querySelector('#enroll');
	   $("#edit-content").append(target);//ysy
	   console.log(target)
   
   });
   
    //--------------------------------------------------

    /* text입력 후 '수정하기'버튼 누르면 수정 완료! -> 수정된거 조회*/
   const editCompleteBtn = document.querySelector('#editComplete-btn');
   
   editCompleteBtn.addEventListener("click", function(){
	   
	   // 수정하는 댓글의 replyNo 가져오기
	   var replyNo = document.getElementById("edit-btn").getAttribute('data-value');
	   console.log(replyNo); 
	   
	   // 수정하는 댓글의 text 가져오기
	   const editContent = document.querySelector('#editText-content').value;      
	   
	   // 작성일
       var today = new Date();

       var year = today.getFullYear();
       var month = ('0' + (today.getMonth() + 1)).slice(-2);
       var day = ('0' + today.getDate()).slice(-2);
       var hours = ('0' + today.getHours()).slice(-2); 
       var minutes = ('0' + today.getMinutes()).slice(-2);
       var seconds = ('0' + today.getSeconds()).slice(-2); 

       var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
       
       
	 	$.ajax({
			   
			   url : "${root}/noticeReply/edit" ,
	           type : "POST" ,
	           data : { 
	              "replyNo" : replyNo ,
	              "content" : editContent
	           } ,
	           success : function(result){
	        	   if(result == 'ok'){
	        		   alert('댓글 수정 성공!')
	        		   
	        		   // 수정 된 댓글 조회
	        		   // 1. 기존span 지우기
	        		   $("#edit-content").empty();//ysy
	        		   
	        		   //2. 수정된 것으로 조회하기
	        		   const target = document.querySelector('#enrollDate');
	                   var html = 

	                	   '<h6 id="enrollDate" class="card-subtitle mb-2 text-muted">' + dateString + '</h6>'+
	                       '<span id="edit-content" class="card-text">' + editContent + '</span>'+
	                       
	                       '<div style="float: right;">'+
	                           '<a type="button" id="edit-btn" data-value="${x.replyNo}" class="card-link fa fa-pencil" style="font-size:17px;">'+'</a>'+ 
	                           '<a type="button" id="delete-btn" data-value="${x.replyNo}" class="card-link far fa-trash-alt" style="font-size:17px;">'+'</a>'+ 
                       	   '</div>';
                        
                       	   
	                   $(target).append(html);
	                   
	        		   
	        	   }else{
	        		   alert('댓글 수정 실패!')
	        	   }
	        	   
	           },
	           error : function(){
	        	   alert("통신 에러!");
	           }
			   
		   });
	   
	   
   });
   
   </script>
   