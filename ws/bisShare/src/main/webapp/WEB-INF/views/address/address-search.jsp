<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

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
	                <input type="text">
	                <input type="submit" value="검색" class="btn-primary" style="border-radius: 3px;" >
	            </div>
            </div>
	    
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">  
 					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" onclick="selectAll(this)"></th>
							<th>이름</th>
							<th>직위</th>
							<th>부서</th>
							<th>연락처</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>유재석</td>
							<td>부장</td>
							<td>영업3팀</td>
							<td>010-1111-2222</td>
							<td>jsyou@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>박명수</td>
							<td>차장</td>
							<td>영업3팀</td>
							<td>010-2222-3333</td>
							<td>mspark@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>정준하</td>
							<td>과장</td>
							<td>영업3팀</td>
							<td>010-3333-4444</td>
							<td>jhjung@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>정형돈</td>
							<td>대리</td>
							<td>영업3팀</td>
							<td>010-4444-5555</td>
							<td>hdjung@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>노홍철</td>
							<td>사원</td>
							<td>영업3팀</td>
							<td>010-5555-6666</td>
							<td>hcno@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>하동훈</td>
							<td>사원</td>
							<td>영업3팀</td>
							<td>010-6666-7777</td>
							<td>haha@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>길성준</td>
							<td>사원</td>
							<td>영업3팀</td>
							<td>010-7777-8888</td>
							<td>gill@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>권지용</td>
							<td>전무</td>
							<td>영업3팀</td>
							<td>010-8888-9999</td>
							<td>gd@kh.com</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>김태호</td>
							<td>이사</td>
							<td>영업3팀</td>
							<td>010-9999-0000</td>
							<td>pdkim@kh.com</td>
						</tr>
					</tbody>
    			</table>
    		</div>
    	</div>
    	
    </div>               
</div>
