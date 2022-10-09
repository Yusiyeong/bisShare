<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
    
		<!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- DataTales Example -->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >사원 관리</h6>
                   </div>
                   <div class="card-body">
         
        			<!-- 사원등록 버튼 start  -->
					<button class="btn btn-primary btn-sm" style="position: absolute;" onclick = "">사원 등록</button>				
					<!-- 사원등록 버튼 end  -->
						
						
                       <!--검색버튼start-->
                     
                       <div style="height: 50px;">
                           <div style="position: absolute; right: 20px;">
                               Search : <input type="text">
                               <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
                           </div>
                       </div>
                       <!--검색버튼end-->
                       
                       <div class="table-responsive" style="overflow: auto">

						<!-- 사원관리 테이블start -->
						<div style="height: 500px; overflow: auto"> 
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
                                       <td>인사이동 공지입니다.</td>
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
                                   <tr>
                                       <td class="text-center">1</td>
                                       <td>인사이동 공지입니다.</td>
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
                    	<!-- 사원관리 테이블end -->
                           
                       </div>
                   </div>
               </div>

  </div>
           <!-- /.container-fluid -->

