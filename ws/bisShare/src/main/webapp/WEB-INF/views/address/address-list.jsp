<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
	#address-page{
		margin-left: 240px;
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
									<td><input type="checkbox" name="chk"></td>
									<td>${addr.nick}</td>
									<td>${addr.rankNo}</td>
									<td>${addr.deptNo}</td>
									<td>${addr.phone}</td>
									<td>${addr.email}</td>
				    			</c:forEach>
							
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>유재석</td>
									<td>부장</td>
									<td>영업3팀</td>
									<td>010-1111-2222</td>
									<td>jsyou@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>박명수</td>
									<td>차장</td>
									<td>영업3팀</td>
									<td>010-2222-3333</td>
									<td>mspark@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>정준하</td>
									<td>과장</td>
									<td>영업3팀</td>
									<td>010-3333-4444</td>
									<td>jhjung@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>정형돈</td>
									<td>대리</td>
									<td>영업3팀</td>
									<td>010-4444-5555</td>
									<td>hdjung@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>노홍철</td>
									<td>사원</td>
									<td>영업3팀</td>
									<td>010-5555-6666</td>
									<td>hcno@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>하동훈</td>
									<td>사원</td>
									<td>영업3팀</td>
									<td>010-6666-7777</td>
									<td>haha@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>권지용</td>
									<td>전무</td>
									<td>영업3팀</td>
									<td>010-8888-9999</td>
									<td>gd@kh.com</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="chk"></td>
									<td>김태호</td>
									<td>이사</td>
									<td>영업3팀</td>
									<td>010-9999-0000</td>
									<td>pdkim@kh.com</td>
								</tr>
								
							</tbody>
                        </table>
                        
                    </div>
                </div> <!-- card body -->
                
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
		
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >상세정보를 보려면 멤버 목록을 클릭하세요</h6>
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