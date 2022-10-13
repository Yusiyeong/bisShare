<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
    
    <!-- 검색 이모티콘 -->
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
      <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- DataTales Example -->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >자료실</h6>
                   </div>
                   <div class="card-body">

                   
                        <!--검색버튼start-->
                       <div style="height: 50px;">
                           <div style="float: right;">
                               Search : <input type="text">
                               <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
                           </div>
                       </div>
                       <!--검색버튼end-->
                       
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
                                       <td data-toggle="modal" data-target="#listSelect">인사이동 공지입니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>   
                                   <tr>
                                       <td class="text-center">2</td>
                                       <td>식권발급 관련 안내드립니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">17</td>
                                   </tr>     
                                   <tr>
                                       <td class="text-center">3</td>
                                       <td>7월 일정을 공유합니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">30</td>
                                   </tr>         
                                   <tr>
                                       <td class="text-center">4</td>
                                       <td>3층 엘레베이터 고장 관련</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">24</td>
                                   </tr>   
                                   <tr>
                                       <td class="text-center">5</td>
                                       <td>전체 사원들에게 알려드립니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">7</td>
                                   </tr>     
                                   <tr>
                                       <td class="text-center">6</td>
                                       <td>인사이동 공지입니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">5</td>
                                   </tr> 
                                   <tr>
                                       <td class="text-center">7</td>
                                       <td>식권발급 관련 안내드립니다.</td>
                                       <td class="text-center">유시영</td>
                                       <td class="text-center">2022.01.05</td>
                                       <td class="text-center">11</td>
                                   </tr>
                                   
                               </tbody> 
                           </table>
                           </div>
                           <!-- 테이블end -->
                     
                     	<!-- 행 조회 모달창 start-->
                        <!--  Modal-->
                        <div class="modal fade" id="listSelect" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">제목</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    
                                    <div class="modal-body">
                                    <!-- start -->
                                   <div class="input-group mb-3">
										아래 파일을 클릭하면 다운이 진행 됩니다.
								   </div>

								    <div class="input-group mb-2">
										<a href="">다운로드 할 파일이름1</a>
									</div>   
									  <div class="input-group mb-2">
										<a href="">다운로드 할 파일이름2</a>
									</div>  
									
									
									 <div class="input-group mb-3" style="height: 100px;">
										 <textarea type="text" class="form-control"  style="height: 100px;" placeholder="내용"></textarea>
								     </div>                    
                                    <!-- end -->
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>                
                          <!-- 행 조회 모달창 end-->
                     
                  <!------------------------------ ----------------------------------------------------------- ----------------------------- ----------------------------- -->
                     
	                     <!-- 업로드 버튼 start  -->
	                     <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#uploadModal">파일 업로드</button>            
	                     <!-- 업로드 버튼 end  -->
                        
                        <!-- 파일 업로드 모달창 start-->
                        <!--  Modal-->
                        <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">파일 업로드</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    
                                    <div class="modal-body">
                                    <!-- start -->
                                   <div class="input-group mb-3">
									  <input type="text" class="form-control" placeholder="제목을 입력하세요.">
								   </div>

								    <div class="input-group mb-3">
										<input type="file">
									</div>              
									
									 <div class="input-group mb-3" style="height: 100px;">
										 <textarea type="text" class="form-control"  style="height: 100px;" placeholder="내용을 입력하세요."></textarea>
								     </div>                    
                                    <!-- end -->
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                        <a class="btn btn-primary" type="submit">업로드</a>
                                    </div>
                                </div>
                            </div>
                        </div>                
                          <!-- 파일 업로드 모달창 end-->
            

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
               </div>

           </div>
           <!-- /.container-fluid -->
           
           
        
