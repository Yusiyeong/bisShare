<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
	#address-page{
		margin-left: 240px;
	}

	#img{
		width: 200px;
		height: 200px;
		display: flex;
		margin: auto;
		padding: 0px 0px 0px 10px;
	}

	#t1{
		text-align: center;
	}
	
</style>

<!-- Begin Page Content -->
<div class="container-fluid">
	
	<h1 class="h3 mb-2 text-gray-800">주소록</h1>
	<div class="row">
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >조직도</h6>
	    		</div>
	    		
	    		<div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
								<tr>
									<th><input type="checkbox" id="cbx_chkAll" /></th>
									<th>이름</th>
									<th>직급</th>
									<th>부서</th>
									<th>연락처</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="addr" items="${voList}">
									<tr>
										<td><input type="checkbox" name="chk"></td>
										<td>${addr.nick}</td>
										<td>${addr.rankName}</td>
										<td>${addr.deptName}</td>
										<td>${addr.phone}</td>
										<td>${addr.email}</td>
									</tr>
				    			</c:forEach>
								
							</tbody>
                        </table>
                        
                    </div>
                </div> <!-- card body -->
                
                <!-- page -->
    			<nav id="address-page">
	          		<ul class="pagination">
	          		
		          		<li class="page-item">
			          		<c:if test="${pvo.startPage ne 1}">
								<a href="${root}/address/search/?p=${pvo.startPage -1}" class="page-link">이전</a>	
							</c:if>
						</li>
						
						<li class="page-item active" aria-current="page">
							<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
								<a href="${root}/address/search/?p=${i}" class="page-link">${i}</a>
							</c:forEach>
						</li>
						
						<li class="page-item">
							<c:if test="${pvo.endPage ne pvo.maxPage}">
								<a href="${root}/address/search/?p=${pvo.endPage +1}" class="page-link">다음</a>
							</c:if>
		          		</li>
	                                                                
	               </ul>
                </nav>
                
			</div>
		</div>
		
		<!-- 조직도에서 직원정보가있는 행을 클릭하면 직원 상세정보뜨게 하기 -->
		<!-- <div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >상세정보를 보려면 멤버 목록을 클릭하세요</h6>
	    		</div>
			</div>
		</div> -->
		
		
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >직원상세정보</h6>
	    		</div>
	    		
	    		<div class="card-body">
		            <div class="table-responsive">
		                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                	<img id="img" src="${root}/resources/img/undraw_profile_2.svg">
		                	<c:forEach var="addr2" items="${dvoList}">
			                	<tr id="box">
			                		<td id="t1">이름:&nbsp ${addr2.nick}</td>
			                	</tr>
			                	<tr>
			                		<td id="t1">직급:&nbsp ${addr2.rankName}</td>
			                	</tr>
								<tr>
									<td id="t1">부서:&nbsp ${addr2.deptName}</td>
			                	</tr>
								<tr>
									<td id="t1">연락처:&nbsp ${addr2.phone}</td>
			                	</tr>
								<tr>
									<td id="t1">이메일:&nbsp ${addr2.email}</td>
			                	</tr>
			                	<tr>
									<td id="t1">주소:&nbsp ${addr2.address}</td>
			                	</tr>
			                	<tr>
									<td id="t1">입사일:&nbsp ${addr2.hireDate}</td>
			                	</tr>
		                	</c:forEach>
		                </table>
		            </div>
		        </div>
	    		
			</div>
		</div>
		
		
	</div> <!-- row -->
	  
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
</script>

