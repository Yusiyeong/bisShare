<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style>

	#tab{
		margin:auto;
		width: 90%;
	}
	
	.card{
		margin-top: 20px;
	}

	

</style>

<!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정 조회</h6>
              </div>
              
              <div class="card-body">
								<!--start-->
								<!-- Page Heading -->
								<div id="tab">
								
									<ul class="nav nav-tabs" id="myTab" role="tablist">
									  <li class="nav-item" role="presentation">
									    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#one-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">회의</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#two-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">휴가</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#three-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">반차</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#four-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">외근</button>
									  </li>
									  <li class="nav-item" role="presentation">
									    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#five-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">기타</button>
									  </li>
									</ul>
									
									<div class="tab-content" id="myTabContent">
									
								<div class ="d-flex flex-wrap w-100">
									<c:forEach items="${cvoList}" var="x">

										<div class="row">
											<div class="col-md-4">
												<div class="tab-pane fade show active cate${x.cateNo}" id="one-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;" onclick="location.href='${root}/calendar/detail/${x.calNo}'">
													<div class="card-body">
													  <h5 class="card-title">${x.title}</h5>
													  <h5 class="card-title">${x.startDate}</h5>
													  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
													  <p class="card-text">${x.content}</p>
													</div>
												  </div>
												</div>
											</div>
										</div>

									</c:forEach>
								</div>
									  
									  
									  <div class="tab-pane fade" id="two-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
									  	<div class="card" style="width: 18rem; height: 10rem;">
										  <div class="card-body">
										    <h5 class="card-title">휴가</h5>
										    <h5 class="card-title">2022.10.25 ~ 2022.10.25</h5>
										    <h6 class="card-subtitle mb-2 text-muted">박서영</h6>
										    <p class="card-text">속세를 떠납니다</p>
										  </div>
										</div>
									  </div>
									  
									  
									  <div class="tab-pane fade" id="three-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
									  	<div class="card" style="width: 18rem; height: 10rem;">
										  <div class="card-body">
										    <h5 class="card-title">오후 반차</h5>
										    <h5 class="card-title">2022.10.25</h5>
										    <h6 class="card-subtitle mb-2 text-muted">박한솔</h6>
										    <p class="card-text">오후 업무는 다음날 확인 가능합니다</p>
										  </div>
										</div>
									  </div>
									  
									  
									  <div class="tab-pane fade" id="four-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
									  	<div class="card" style="width: 18rem; height: 10rem;">
										  <div class="card-body">
										    <h5 class="card-title">외근</h5>
										    <h5 class="card-title">2022.10.25</h5>
										    <h6 class="card-subtitle mb-2 text-muted">유시영</h6>
										    <p class="card-text">외근 나갑니다</p>
										  </div>
										</div>
									  </div>
									  
									  
									  <div class="tab-pane fade" id="five-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
									  	<div class="card" style="width: 18rem; height: 10rem;">
										  <div class="card-body">
										    <h5 class="card-title">가을 체육대회</h5>
										    <h5 class="card-title">2022.10.25</h5>
										    <h6 class="card-subtitle mb-2 text-muted">인사팀</h6>
										    <p class="card-text">회사 가을 체육대회 있습니다.</p>
										  </div>
										</div>
									  </div>
									  
									  	  
									</div>
									
								</div>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->



		
	