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

               <!-- DataTales Example -->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >사내공지</h6>
                   </div>
                   <div class="card-body">
                <!--start-->
                <!--form start-->
                  <form action="${root}/notice/list/1" method="get">
                    <!--검색버튼start-->
                    <div style="height: 50px;">
                        <div style="float: right;">
                     <select name="condition" style="height:30px;">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                     </select>
         
                            <input type="text" name="keyword" value="${keyword}">
                            <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
                        </div>
                    </div>
                    <!--검색버튼end-->
                    
               <!-- ------------------------------------------------------------------------->      
                    
               <c:if test="${not empty condition}">
                  <script>
                     window.onload = function(){
                        document.querySelector('option[value=${condition}]').selected = true;
                     }
                  </script>
               </c:if>
               
                   <!-- ------------------------------------------------------------------------->
                       
                       <!-- 테이블start -->
                       <div class="table-responsive">

                           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                               <thead>
                                   <tr>
                                       <th width="5%"></th>
                                       <th width="60%">제목</th>
                                       <th width="10%" class="text-center">작성자</th>
                                       <th width="15%" class="text-center">작성일</th>
                                       <th width="10%" class="text-center">조회수</th>
                                   </tr>
                               </thead>
                               <tbody>
                               
                               <c:forEach items="${voList}" var="x">
                                   <tr>
                                       <td class="text-center">${x.num}</td>
                                       <td><a href="${root}/notice/detail/${x.boardNo}">${x.title}</a></td>
                                       <td class="text-center">${x.writer}</td>
                                       <td class="text-center">${x.enrollDate}</td>
                                       <td class="text-center">${x.cnt}</td>
                                   </tr> 
                                   
                               </c:forEach>  
                               </tbody> 
                           </table>
                          </div>
                          <!-- 테이블end -->
                           
                     <!-- 글쓰기 버튼 start  -->
                     <c:if test="${not empty loginVo}">
                        <button class="btn btn-primary btn-sm" onclick = "location.href ='${root}/notice/write'">글쓰기</button>            
                     </c:if>
                     <!-- 글쓰기 버튼 end  -->

                               <!--페이징start-->    
                               <nav aria-label="..." style="width: 10%; margin: 0 auto;">
                                     <ul class="pagination">
                                     
                                       <c:if test="${pv.currentPage ne 1}"> 
                                           <li class="page-item">
                                     <a href="${root}/notice/list/${pv.currentPage - 1}" class="page-link">Previous</a>
                                  </li>
                              </c:if>
       
       
                               
                               <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                                  <c:choose>
                                     <c:when test="${i eq pv.currentPage}">
                                        <li class="page-item active">
                                             <a class="page-link">${i}</a>
                                        </li>
                                     </c:when>
                                     
                                     <c:otherwise>        
                                        <li class="page-item">
                                           <a href="${root}/notice/list/${i}" class="page-link">${i}</a>
                                        </li>  
                                     </c:otherwise>
                                  </c:choose>
                               </c:forEach>
                                  
       
       
                               <c:if test="${pv.currentPage ne pv.maxPage}"> 
                                 <li class="page-item">
                          			<a href="${root}/notice/list/${pv.currentPage+1}" class="page-link">Next</a>
                                 </li>
                              </c:if>
       
                                   </ul>
                               </nav>
                               <!--페이징end-->
                               
                        </form>
                       <!--form end-->
                   </div>
                   <!--end-->      
               </div>
            <!-- DataTales Example End-->
           </div>
           <!-- End Page Content -->
