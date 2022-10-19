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
                       <h6 class="m-0 font-weight-bold text-primary" >블라인드 게시판</h6>
                   </div>
                   <div class="card-body">
 					<!--start-->
                    <!--검색버튼start-->
                    <div style="height: 50px;">
                        <div style="float: right;">
							<select name="condition" style="height:30px;">
								<option value="title">제목</option>
								<option value="content">내용</option>
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
                                       <th width="10%" class="text-center">작성일</th>
                                       <th width="10%" class="text-center">조회수</th>
                                   </tr>
                               </thead>
                              
                               <tbody>
                                   <tr>
                                       <td class="text-center">1</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>   
                                   <tr>
                                       <td class="text-center">2</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                                   <tr>
                                       <td class="text-center">3</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                                   <tr>
                                       <td class="text-center">4</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                                   <tr>
                                       <td class="text-center">5</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                                   <tr>
                                       <td class="text-center">6</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                                   <tr>
                                       <td class="text-center">7</td>
                                       <td><a href="${root}/blind/detail">엘레베이터 왜 고장 났나요</a></td>
                                       <td class="text-center">익명</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>  
                               </tbody> 
                           </table>
                          </div>
                          <!-- 테이블end -->
                           
							<!-- 글쓰기 버튼 start  -->
							<button class="btn btn-primary btn-sm" onclick = "location.href ='${root}/blind/write'">글쓰기</button>				
							<!-- 글쓰기 버튼 end  -->

                               <!--페이징start-->                                 
                                   <nav aria-label="..." style="float: right;">
                                   		<ul class="pagination">
                                           <li class="page-item disabled">
                                               <a class="page-link">Previous</a>
                                           </li>
                                           <li class="page-item"><a class="page-link" href="#">1</a></li>
                                           <li class="page-item active" aria-current="page">
                                               <a class="page-link" href="#">2</a>
                                           </li>
                                           <li class="page-item"><a class="page-link" href="#">3</a></li>                                               
                                           <li class="page-item">
                                               <a class="page-link" href="#">Next</a>
                                           </li>
                                       </ul>
                                   </nav>
                               <!--페이징end-->
                               
                   </div>
                   <!--end-->      
               </div>
			   <!-- DataTales Example End-->
           </div>
           <!-- End Page Content -->

