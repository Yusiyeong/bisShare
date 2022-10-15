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
    
    
<!-- 탭 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- 눈 이모티콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <style>
        #profile-img-area{
            width: 30px;
            height: 30px;
            margin: auto;
         }
        #profile-img-area > img{
            border-radius: 20%; 
            width: 100%; 
            height: 100%;
            border: 1px solid black;
         }
         
         a { text-decoration:none !important ;
		color: black;}
		
		 a:hover { text-decoration:none !important }
    </style>
    
    
           <!-- Begin Page Content -->
	       <div class="container-fluid">
	          <!-- DataTales Example Start-->
	          <div class="card shadow mb-4">
	              <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary" >사원 조회</h6>
	              </div>
	              
	              <div class="card-body">
					<!--start-->
					<!-- 사원등록 버튼 start  -->
	               <button class="btn btn-outline-primary btn-sm" style="position: absolute;" onclick = "location.href ='${root}/admin/enroll'">사원 등록</button>            
	               <!-- 사원등록 버튼 end  -->
                  
                    <!--검색버튼start-->
                    <div style="height: 50px;">
                        <div style="position: absolute; right: 20px;">
                            Search : <input type="text">
                            <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
                        </div>
                    </div>
                    <!--검색버튼end-->
                    
					<!-- 내부start -->
					  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						  <li class="nav-item" role="presentation">
						    <button class="nav-link active btn btn-sm" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">전체</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link btn btn-sm" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">재직</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link btn btn-sm" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">퇴직</button>
						  </li>
					  </ul>
					  
					  <div class="tab-content" id="pills-tabContent">
					  	  <!-- 전체사원start -->
						  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
						    	 <!-- 테이블start -->
		                       <div class="table-responsive" style="overflow: auto">
		
				                  <div style="height: 500px; overflow: auto"> 
				                   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                               <thead>
				                                   <tr>
				                                       <th width="7%" class="text-center">사진</th>
				                                       <th width="10%" class="text-center">사원번호</th>
				                                       <th width="10%" class="text-center">이름</th>
				                                       <th width="7%" class="text-center">부서</th>
				                                       <th width="7%" class="text-center">직급</th>
				                                       <th width="20%" class="text-center">메일</th>
				                                       <th width="20%" class="text-center">연락처</th>
				                                       <th width="10%" class="text-center" style="font-size:15px;">보기/편집</th>
				                                   </tr>
				                               </thead>
				                              
				                               <tbody>
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
				                                      <img src="${root}/resources/img/undraw_profile_3.svg">
				                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">01</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">개발</td>
				                                       <td class="text-center">대리</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
				                                       <td class="text-center"><a href="${root}/admin/detail" class="far fa-eye" style="font-size:17px;"></a></td>
				                                   </tr>  
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
				                                      <img src="${root}/resources/img/undraw_profile_3.svg">
				                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">02</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">개발</td>
				                                       <td class="text-center">과장</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
													   <td class="text-center"><a href="#" class="far fa-eye" style="font-size:17px;"></a></td>				                                   
													</tr>  
				                               </tbody> 
				                           </table>
				                  </div>
		                       </div>
                       <!-- 테이블end -->
						  </div>
						  <!-- 전체사원end -->
						  
						   <!-- 재직자start -->
						   <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
						   		 <!-- 테이블start -->
		                       <div class="table-responsive" style="overflow: auto">
		
				                  <div style="height: 500px; overflow: auto"> 
				                   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                               <thead>
				                                   <tr>
				                                       <th width="7%" class="text-center">사진</th>
				                                       <th width="10%" class="text-center">사원번호</th>
				                                       <th width="10%" class="text-center">이름</th>
				                                       <th width="7%" class="text-center">부서</th>
				                                       <th width="7%" class="text-center">직급</th>
				                                       <th width="20%" class="text-center">메일</th>
				                                       <th width="20%" class="text-center">연락처</th>
				                                       <th width="10%" class="text-center" style="font-size:15px;">보기/편집</th>
				                                   </tr>
				                               </thead>
				                              
				                               <tbody>
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
						                                      <img src="${root}/resources/img/undraw_profile_3.svg">
						                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">77</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">인사</td>
				                                       <td class="text-center">과장</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
				                                       <td class="text-center"><a href="${root}/admin/detail" class="far fa-eye" style="font-size:17px;"></a></td>
				                                   </tr>  
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
				                                      <img src="${root}/resources/img/undraw_profile_3.svg">
				                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">24</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">개발</td>
				                                       <td class="text-center">과장</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
													   <td class="text-center"><a href="#" class="far fa-eye" style="font-size:17px;"></a></td>				                                   
												  </tr>  
				                               </tbody> 
				                           </table>
				                  </div>
		                       </div>
                       <!-- 테이블end -->
						   </div>
						   <!-- 재직자end-->
						   
						   <!-- 퇴직자start -->
						   <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
						   		 <!-- 테이블start -->
		                       <div class="table-responsive" style="overflow: auto">
		
				                  <div style="height: 500px; overflow: auto"> 
				                   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                               <thead>
				                                   <tr>
				                                       <th width="7%" class="text-center">사진</th>
				                                       <th width="10%" class="text-center">사원번호</th>
				                                       <th width="10%" class="text-center">이름</th>
				                                       <th width="7%" class="text-center">부서</th>
				                                       <th width="7%" class="text-center">직급</th>
				                                       <th width="20%" class="text-center">메일</th>
				                                       <th width="20%" class="text-center">연락처</th>
				                                       <th width="10%" class="text-center" style="font-size:15px;">보기/편집</th>
				                                   </tr>
				                               </thead>
				                              
				                               <tbody>
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
				                                      <img src="${root}/resources/img/undraw_profile_3.svg">
				                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">01</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">개발</td>
				                                       <td class="text-center">대리</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
				                                       <td class="text-center"><a href="${root}/admin/detail" class="far fa-eye" style="font-size:17px;"></a></td>
				                                   </tr>  
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
				                                      <img src="${root}/resources/img/undraw_profile_3.svg">
				                                   </div>
				                                       </td>
				                                       
				                                       <td class="text-center">02</td>
				                                       <td class="text-center">유시영</td>
				                                       <td class="text-center">개발</td>
				                                       <td class="text-center">과장</td>
				                                       <td class="text-center">kh1234@google.com</td>
				                                       <td class="text-center">010-4039-8988</td>
													   <td class="text-center"><a href="#" class="far fa-eye" style="font-size:17px;"></a></td>				                                   
												</tr>  
				                               </tbody> 
				                           </table>
				                  </div>
		                       </div>
                       <!-- 테이블end -->
						   </div>
						   <!-- 퇴직자end -->
					  </div>
					<!-- 내부end -->
					
					<!--end-->
				  </div>
	
			  </div>
			<!-- DataTales Example End-->
		  </div>
		 <!-- End Page Content -->
  
           <script>
           var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
           triggerTabList.forEach(function (triggerEl) {
             var tabTrigger = new bootstrap.Tab(triggerEl)

             triggerEl.addEventListener('click', function (event) {
               event.preventDefault()
               tabTrigger.show()
             })
           })
           </script>