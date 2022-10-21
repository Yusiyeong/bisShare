<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
	#address-page{
		margin-left: 630px;
		display: flex;
	}
	
	#field1{
		margin-right: 5px;
	}
	
</style>

<!-- Begin Page Content -->
<div class="container-fluid">
	
	<h1 class="h3 mb-2 text-gray-800">주소록</h1>
		
	<div class="card shadow mb-4">
	    <div class="card-header py-3">
	        <h6 class="m-0 font-weight-bold text-primary" >주소록 검색</h6>
	    </div>
       
	    <div class="card-body">
	       <form action="${root}/address/search" method="get">
	    	<div style="height: 50px;">
	            <div style="float: right;">
	            	<input type="hidden" name="p" value="1">
	           			<select id="field" name="field">
		                    <option selected value="nick">이름</option>
		                    <option value="rankName">직급</option>
		                    <option value="deptName">부서</option>
		                    <option value="phone">연락처</option>
		                    <option value="email">이메일</option>
						</select>
	                <input type="text" name="keyword" value="${keyword}">
	                <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
	            </div>
            </div>
	      
	    	
	    	<c:if test="${not empty field}">
				<script>
				window.onload = function(){
					document.querySelector('option[value=${field}]').selected = true;
				}
				</script>
			</c:if>
			
	    	
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">  
 					<thead>
						<tr>
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
								<td>${addr.nick}</td>
								<td>${addr.rankName}</td>
								<td>${addr.deptName}</td>
								<td>${addr.phone}</td>
								<td>${addr.email}</td>
							</tr>
		    			</c:forEach>
						
						
					</tbody>
    			</table>
    			
    			
    			<!-- page -->
    			<nav id="address-page">
	          		<ul class="pagination">
	          		
		          		<li class="page-item">
			          		<c:if test="${pvo.startPage ne 1}">
								<a href="${root}/address/search?p=${pvo.startPage -1}" class="page-link">이전</a>	
							</c:if>
						</li>
						
						<li class="page-item active" aria-current="page">
							<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
								<a href="${root}/address/search?p=${i}" class="page-link">${i}</a>
							</c:forEach>
						</li>
						
						<li class="page-item">
							<c:if test="${pvo.endPage ne pvo.maxPage}">
								<a href="${root}/address/search?p=${pvo.endPage +1}" class="page-link">다음</a>
							</c:if>
		          		</li>
	                                                                
	               </ul>
                </nav>
    			
    			
    			</div>
    		</div>
    	</form>
    </div>               
</div>
