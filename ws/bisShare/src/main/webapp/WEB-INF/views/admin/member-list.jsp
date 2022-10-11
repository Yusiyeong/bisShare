<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
    
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
    </style>
    
    
		<!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- DataTales Example -->
               <div class="card shadow mb-4">
                   <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary" >사원 관리</h6>
                   </div>
                   <div class="card-body">
         
        			<!-- 사원등록 버튼 start  -->
					<button class="btn btn-primary btn-sm" style="position: absolute;" onclick = "location.href ='${root}/admin/enroll'">사원 등록</button>				
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
                                       <th width="7%" class="text-center">사진</th>
                                       <th width="10%" class="text-center">사원번호</th>
                                       <th width="10%" class="text-center">이름</th>
                                       <th width="10%" class="text-center">부서</th>
                                       <th width="10%" class="text-center">직급</th>
                                       <th width="20%" class="text-center">메일</th>
	                                   <th width="20%" class="text-center">연락처</th>
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
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                 <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                 <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
	                                </tr>  
	                                <tr>
	                                    <td class="text-center">
	                                       <div id="profile-img-area">
								              <img src="${root}/resources/img/undraw_profile_3.svg">
								           </div>
	                                    </td>
	                                    
	                                    <td class="text-center">01</td>
	                                    <td class="text-center">유시영</td>
	                                    <td class="text-center">개발1팀</td>
	                                    <td class="text-center">대리</td>
	                                    <td class="text-center">kh1234@google.com</td>
	                                    <td class="text-center">010-4039-8988</td>
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
           
  
           