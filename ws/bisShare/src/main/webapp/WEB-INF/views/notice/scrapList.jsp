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
		              <button class="deleteButtonAll btn btn-outline-primary btn-sm">전체 선택</button>
		              <button class="deleteButton btn btn-outline-primary btn-sm" style="margin-left: 10px">삭제</button> 
		            </div>
					<!-- 선택end -->
					
					<!-- 테이블start -->
                       <div class="table-responsive" style="height: 530px; overflow: auto;">

                           <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                               <thead>
                                   <tr>
                                       <th width="5%"></th>
                                       <th width="60%">게시글</th>
                                       <th width="10%" class="text-center">작성자</th>
                                       <th width="15%" class="text-center">스크랩일</th>
                                   </tr>
                               </thead>
                               <tbody>
                               
                               <c:forEach items="${voList}" var="x">
                                   <tr>
                                       <td class="text-center">
                                       		<input type="checkbox" name="ckNo" value="">
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