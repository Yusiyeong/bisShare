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
	               
                   <!--form start-->
         			<form action="${root}/admin/inList" method="get" enctype="multipart/form-data">
                    <!--검색버튼start-->
                    <div style="height: 50px;">
                        <div style="float: right;">

							<select name="condition" style="height:30px;">
								<option value="nick">닉네임</option>
								<option value="email">메일</option>
								<option value="phone">연락처</option>
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
	
                    
					<!-- 내부start -->
					   <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						  <li class="nav-item" role="presentation">
 							<a class="nav-link btn btn-sm" aria-current="page" href="${root}/admin/list">전체</a>
 						  </li>
						  <li class="nav-item" role="presentation">
							<a class="nav-link active btn btn-sm" aria-current="page" href="${root}/admin/inList">재직</a>
						  </li>
						  <li class="nav-item" role="presentation">
							<a class="nav-link  btn btn-sm" aria-current="page" href="${root}/admin/outList">퇴직</a>						  
						  </li>
					  </ul>
					  
					  
					  <div class="tab-content" id="pills-tabContent">
					  	  <!-- 전체사원start -->
						  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
				    	 <!-- 테이블start -->
		                       <div class="table-responsive" style="height: 530px; overflow: auto;">
				                  <div style="height: ; overflow: auto"> 
				                   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				                               <thead>
				                                   <tr>
				                                       <th width="7%" class="text-center">사진</th>
				                                       <th width="10%" class="text-center">사번</th>
				                                       <th width="10%" class="text-center">닉네임</th>
				                                       <th width="7%" class="text-center">부서</th>
				                                       <th width="7%" class="text-center">직급</th>
				                                       <th width="20%" class="text-center">메일</th>
				                                       <th width="20%" class="text-center">연락처</th>
				                                       <th width="10%" class="text-center" style="font-size:14px;">보기/편집</th>
				                                   </tr>
				                               </thead>
				                               <tbody>
				                               
				                               <c:forEach items="${voList}" var="x">
				                                   <tr>
				                                       <td class="text-center">
				                                          <div id="profile-img-area">
					                                          <c:if test="${not empty x.profilePath}">
					                                      		<img src="${root}/resources/profile/${x.profilePath}">
					                                      	  </c:if>
					                                      	  <c:if test="${empty x.profilePath}">
					                                      	  	<img src="${root}/resources/img/guest.png">
					                                      	  </c:if>
				                                   		  </div>
				                                       </td>
				                                       
				                                       <td class="text-center">${x.empNo}</td>
				                                       <td class="text-center">${x.nick}</td>
				                                       <td class="text-center">${x.rankNo}</td>
				                                       <td class="text-center">${x.deptNo}</td>
				                                       <td class="text-center">${x.email}</td>
				                                       <td class="text-center">${x.phone}</td>
				                                       <td class="text-center"><a href="${root}/admin/detail/${x.empNo}" class="far fa-eye" style="font-size:17px;"></a></td>
				                                   </tr>  
			                                  </c:forEach>
			                               
			                                  </tbody> 
			                           </table>
				                  </div>
		                       </div>
                       
                       <!-- 테이블end -->
						  </div>
                      
						  <!-- 전체사원end -->
						  
		
		  	</div>
			<!-- 내부end -->
			   </form>
                     <!--form end-->
			<!--end-->
		  </div>

	  </div>
	<!-- DataTales Example End-->
  </div>
 <!-- End Page Content -->
  
  
