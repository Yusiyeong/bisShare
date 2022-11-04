<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<c:if test = "${!empty sessionScope.alertMsg}">
	<script>
		alert("${sessionScope.alertMsg}");
	</script>
	<c:remove var="alertMsg"></c:remove>
</c:if>


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
								
								<nav>
								  <div class="nav nav-tabs" id="nav-tab" role="tablist">
								    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">회의</button>
								    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">휴가</button>
								    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">반차</button>
								    <button class="nav-link" id="nav-out-tab" data-bs-toggle="tab" data-bs-target="#nav-out" type="button" role="tab" aria-controls="nav-out" aria-selected="false">외근</button>								    
								    <button class="nav-link" id="nav-ect-tab" data-bs-toggle="tab" data-bs-target="#nav-ect" type="button" role="tab" aria-controls="nav-ect" aria-selected="false">기타</button>
								  </div>
								</nav>
								<div class="tab-content" id="nav-tabContent">
								
								  <!-- 회의 -->
								  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${cvoList}" var="x">
											<c:if test="${x.cateNo eq 2}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${x.star eq 'N'}">
																<h5 id="star${x.calNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.star eq 'Y'}">
																<h5 id="star${x.calNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${x.calNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${root}/calendar/star`,
																			data: {
																				calNo : '${x.calNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${x.calNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${x.calNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${root}/calendar/detail/${x.calNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.title}</h5>
														  <h5 class="card-title">${x.startDate}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${x.content}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>
									
								</div>
								<!-- 회의 끝 -->
								 
								  <!-- 휴가 -->
								  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${cvoList}" var="x">
											<c:if test="${x.cateNo eq 3}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${x.star eq 'N'}">
																<h5 id="star${x.calNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.star eq 'Y'}">
																<h5 id="star${x.calNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${x.calNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${root}/calendar/star`,
																			data: {
																				calNo : '${x.calNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${x.calNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${x.calNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${root}/calendar/detail/${x.calNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.title}</h5>
														  <h5 class="card-title">${x.startDate} ~ ${x.endDate}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${x.content}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 휴가 끝 -->
								  
								  <!-- 반차 -->
								  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${cvoList}" var="x">
											<c:if test="${x.cateNo eq 4}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${x.star eq 'N'}">
																<h5 id="star${x.calNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.star eq 'Y'}">
																<h5 id="star${x.calNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${x.calNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${root}/calendar/star`,
																			data: {
																				calNo : '${x.calNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${x.calNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${x.calNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${root}/calendar/detail/${x.calNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.title}</h5>
														  <h5 class="card-title">${x.startDate}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${x.content}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 반차 끝-->
								  
								  <!-- 외근 -->
								  <div class="tab-pane fade" id="nav-out" role="tabpanel" aria-labelledby="nav-out-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${cvoList}" var="x">
											<c:if test="${x.cateNo eq 5}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${x.star eq 'N'}">
																<h5 id="star${x.calNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.star eq 'Y'}">
																<h5 id="star${x.calNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${x.calNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${root}/calendar/star`,
																			data: {
																				calNo : '${x.calNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${x.calNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${x.calNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title" onclick="location.href='${root}/calendar/detail/${x.calNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.title}</h5>
														  <h5 class="card-title">${x.startDate}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${x.content}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 외근 끝-->
								  
								  <!-- 기타 -->
								  <div class="tab-pane fade" id="nav-ect" role="tabpanel" aria-labelledby="nav-ect-tab" tabindex="0">
								  
									  <div class ="d-flex flex-wrap w-100">
										<c:forEach items="${cvoList}" var="x">
											<c:if test="${x.cateNo eq 1}">
											
											<div class="row">
												<div class="col-md-4">
													<div class="card" style="width: 21rem; height: 10rem; margin: 20px;">
														<div class="card-body">
															<c:if test="${x.star eq 'N'}">
																<h5 id="star${x.calNo}"  style="float: right;">☆</h5>
																</c:if>
																<c:if test="${x.star eq 'Y'}">
																<h5 id="star${x.calNo}" style="float: right;">★</h5>
																</c:if>
																<script>
																		$('#star${x.calNo}').on('click', function() {
																			console.log('adfadsf');
																			$.ajax({
																			type: "get",
																			url: `${root}/calendar/star`,
																			data: {
																				calNo : '${x.calNo}'
																			},
																			success: function (check) {
																				if(check == 'Y'){
																					document.querySelector('#star${x.calNo}').innerHTML='★';
																				}else if(check =='N'){
																					document.querySelector('#star${x.calNo}').innerHTML='☆';
																				}
																			}
																			});
																		});
																</script>
														  <h5 class="card-title"  onclick="location.href='${root}/calendar/detail/${x.calNo}'" style="overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">${x.title}</h5>
														  <h5 class="card-title">${x.startDate}</h5>
														  <h6 class="card-subtitle mb-2 text-muted">${x.writer}</h6>
														  <p class="card-text" style='overflow:hidden; white-space:nowrap; text-overflow:ellipsis;'>${x.content}</p>
														</div>
													 </div>
												</div>
											</div>
	
											</c:if>
										</c:forEach>
									</div>

								  </div>
								  <!-- 기타 끝-->
								  
								</div><!-- tab content -->
								
								</div><!-- tab -->
						  	  
 								</div> 
									
								</div>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->



		
	