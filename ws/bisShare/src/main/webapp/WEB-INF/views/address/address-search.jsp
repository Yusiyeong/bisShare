<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
	#address-page{
		margin-left: 630px;
	}
	
	#field1{
		margin-right: 5px;
	}

	#field2{
		margin-right: 10px;
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
	    	<div style="height: 50px;">
	            <div style="float: right;">
	            <form action="/test/address/search" method="get">
	            	<input type="hidden" name="p" value="1">
                   	<tr>
                   		<td>
                   			<select id="field1" name="field1" class="btn-link" style="color: black;">
	                            <option selected value="dept">부서검색</option>
	                            <option value="dept1">인사</option>
	                            <option value="dept2">개발</option>
	                            <option value="dept3">영업</option>
							</select>
                   		</td>
		             </tr>
		             <tr>
                   		<td>
                   			<select id="field2" name="field2" class="btn-link" style="color: black;">
	                            <option selected value="rank">직급검색</option>
	                            <option value="rank1">사원</option>
	                            <option value="rank2">주임</option>
	                            <option value="rank3">대리</option>
	                            <option value="rank4">과장</option>
	                            <option value="rank5">차장</option>
	                            <option value="rank6">부장</option>
	                            <option value="rank7">이사</option>
	                            <option value="rank8">대표</option>
							</select>
                   		</td>
		             </tr>
	                <input type="text" name="keyword" value="${keyword}">
	                <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
	            	</form>
	            </div>
            </div>
	    	
	    	<c:if test="${not empty field1}">
				<script>
				window.onload = function(){
					document.querySelector('option[value=${field1}]').selected = true;
				}
				</script>
			</c:if>
			
			<c:if test="${not empty field2}">
				<script>
				window.onload = function(){
					document.querySelector('option[value=${field2}]').selected = true;
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
	                      <a class="page-link" href="">이전</a>
	                  </li>
	                   <li class="page-item"><a class="page-link" href="">1</a></li>
	                  
	                  <li class="page-item"><a class="page-link" href="">2</a></li>
	                  
	                  <li class="page-item"><a class="page-link" href="">3</a></li>
	                  
	                  <li class="page-item active" aria-current="page">
	                      <a class="page-link" href="">4</a>
	                  </li>
	                  
	                  <li class="page-item"><a class="page-link" href="">5</a></li>
	                                                                
	                  <li class="page-item">
	                      <a class="page-link" href="">다음</a>
	                  </li>
	               </ul>
                </nav>
    			
    		</div>
    	</div>
    	
    </div>               
</div>
