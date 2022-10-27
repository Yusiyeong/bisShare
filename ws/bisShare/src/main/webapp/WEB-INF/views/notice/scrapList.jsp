<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
a { text-decoration:none !important ;
color: gray;}

a:hover { text-decoration:none !important }
</style>


    <!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >스크랩 목록</h6>
              </div>
              
              <div class="card-body">
					<!--start-->
					
					<!-- 선택start -->
					<div class="deleteCheck" style="margin-bottom: 15px;">
		              <!-- <button class="deleteButtonAll btn btn-outline-primary btn-sm">전체 선택</button> -->
		              <button class="deleteButton btn btn-outline-primary btn-sm" style="margin-left: 10px" onclick="deleteValue();">삭제</button> 
		            </div>
					<!-- 선택end -->
					
					<!-- 테이블start -->
                       <div class="table-responsive" style="height: 530px; overflow: auto;">

                           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                               <thead>
                                   <tr>
                                       <th width="5%" class="text-center">
                                       		<input type="checkbox" id="allCheck" name="allCheck">
                                       </th>
                                       <th width="60%">게시글</th>
                                       <th width="10%" class="text-center">작성자</th>
                                       <th width="15%" class="text-center">스크랩일</th>
                                   </tr>
                               </thead>
                               <tbody>
                               
                               <c:forEach items="${voList}" var="x">
                                   <tr>
                                       <td class="text-center">
                                       		<input type="checkbox" name="RowCheck" value="${x.scrapNo}">
                                       </td>
                                       <td><a href="${root}/notice/detail/${x.boardNo}">${x.title}</a></td>
                                       <td class="text-center">${x.writer}</td>
                                       <td class="text-center">${x.scrapDate}</td>
                                   </tr> 
                               </c:forEach>  
                               


                               </tbody> 
                           </table>
                          </div>
                          <!-- 테이블end -->
                           
					<!--end-->
			  </div>

		  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->



	<script>
	// 스크랩 목록 삭제
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");    // 선택삭제
	    var rowCnt = chkObj.length;  
	
	    // 전체선택
	    $("input[name='allCheck']").click(function(){
	        var chk_listArr = $("input[name='RowCheck']");  // 선택삭제 모음
	        for(var i=0; i<chk_listArr.length; i++){
	            chk_listArr[i].checked = this.checked;
	        }//for
	
	    })//allCheck
	
	    // 선택삭제
	    $("input[name='RowCheck']").click(function(){
	
	        if($("input[name='RowCheck']:checked").length == rowCnt){
	            $("input[name='allCheck']")[0].checked = true;
	        }else{
	            $("input[name='allCheck']")[0].checked = false;
	        }
	
	    })//RowCheck
	       
	});//function
	
	// 삭제 버튼
	function deleteValue(){
	    var valueArr = new Array();
	    var list = $("input[name='RowCheck']");     // 선택삭제
	    for(var i=0; i<list.length; i++){
	        if(list[i].checked){
	            valueArr.push(list[i].value);
	        }//if
	    }//for
	
	    if(valueArr.length == 0){
	        alert("선택 된 글이 없습니다.");
	    }else{
	        var chk = confirm("정말 삭제 하시겠습니까?");
	        $.ajax({
	            type : "POST",
	            url : "${root}/notice/scrapDelete",   
	            traditional : true,
	            data : {'valueArr' : valueArr},
	            success : function(result){
	                if(result = 1){
	                    alert("삭제 성공");
	                    location.reload();
	                }else{
	                    alert("삭제 실패");
	                }
	
	            },  
	            error : function(){
	                       alert("통신 에러");
	            		}//error
	
	        })//ajax
	
	
	    }//else
	
	}//function
	     
	
	</script>
