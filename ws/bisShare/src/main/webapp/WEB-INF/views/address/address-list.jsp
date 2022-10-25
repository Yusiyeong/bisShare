<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>
	#address-page{
		margin-left: 365px;
	}

	#img{
		width: 200px;
		height: 170px;
		display: flex;
		margin: auto auto 10px;
	}

	#t1{
		text-align: center;
	}
	
	#page{
		text-align: center;
	}
	
	#page>a{
		margin: 0px 10px 0px 10px;
		margin-bottom: 40px;
	}

	td>a{
		color: gray;
	}
	
	#test1{
		display: none;
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
	    		<form action="${root}/address/list" method="get">
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
										<td><a href="javascript:doDisplay();">${addr.nick}</a></td>
										<td><a href="javascript:doDisplay();">${addr.rankName}</a></td>
										<td><a href="javascript:doDisplay();">${addr.deptName}</a></td>
										<td><a href="javascript:doDisplay();">${addr.phone}</a></td>
										<td><a href="javascript:doDisplay();">${addr.email}</a></td>
									</tr>
				    			</c:forEach>
								
							</tbody>
                        </table>
                        
                    </div>
                </div> <!-- card body -->
                
                <!-- page -->
    				<div id="page">
		          		<c:if test="${pvo.startPage ne 1}">
							<a href="${root}/address/list/${pvo.startPage -1}" class="btn btn-outline-primary">이전</a>	
						</c:if>
					
						<c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" var="i">
							<a href="${root}/address/list/${i}" class="btn btn-primary">${i}</a>
						</c:forEach>
					
						<c:if test="${pvo.endPage ne pvo.maxPage}">
							<a href="${root}/address/list/${pvo.endPage +1}" class="btn btn-outline-primary">다음</a>
						</c:if>
    				</div>
                
			</div>
		</div>
		
		
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >직원 상세정보</h6>
	    		</div>
	    		
	    		<div class="card-body" id="test1">
		            <div class="table-responsive">
		                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                	<img id="img" src="${root}/resources/img/guest.png">
		                	<c:forEach var="addr2" items="${dvoList}">
			                	<tr>
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
	    		</form>
	    		
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


<script type="text/javascript"> 
	var bDisplay = true; function doDisplay(){ 	
	    var con = document.getElementById("test1"); 
	    if(con.style.display=='block'){ 		
	        con.style.display = 'none'; 	
	    }else{ 		
	        con.style.display = 'block'; 	
	    } 
	} 
	
</script> 
