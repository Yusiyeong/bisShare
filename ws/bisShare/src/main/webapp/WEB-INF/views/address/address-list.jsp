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

	#img2{
		width: 20px;
		height: 20px;
		margin-bottom: 3px;
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
	
	.addrList{
		display: none;
	}
	
	.tree{
	  margin-top: 5px;  
	}
	.tree, .tree ul{
	  list-style: none;  /* 기본 리스트 스타일 제거 */
	  padding-left:10px;
	}
	.tree *:before{
	  width:15px;
	  height:15px;
	  display:inline-block;
	}
	.tree label{
	  cursor: pointer;
	  font-family: NotoSansKrMedium, sans-serif !important;
	  font-size: 16px;
	  color: #0055CC;
	}	

	.tree label:hover{
	  color: #00AACC;
	}
	.tree label:before{
	  color: forestgreen;
	  content: '-'
	}
	.tree label.lastTree:before{
	  content:'*';
	}
	.tree label:hover:before{
	  content: '-'
	}
	.tree label.lastTree:hover:before{
	  content:'*';
	}
	.tree input[type="checkbox"] {
	  display: none;
	}
	.tree input[type="checkbox"]:checked~ul {
	  display: none;
	}
	.tree input[type="checkbox"]:checked+label:before{
	  content: '+'
	}
	.tree input[type="checkbox"]:checked+label:hover:before{
	  content: '+'
	}
	
	.tree input[type="checkbox"]:checked+label.lastTree:before{
	  content: '*';
	}
	.tree input[type="checkbox"]:checked+label.lastTree:hover:before{
	  content: '*';
	}	

	#label{
		flex-direction: column;
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
                        <table id="addrList" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tbody>
								
								<%-- <c:forEach var="addr" items="${voList}" varStatus="st">
									<tr>
										<td><input type="checkbox" name="chk"></td>
										<td><a href="javascript:doDisplay(${st.index});">${addr.nick}</a></td>
										<td><a href="javascript:doDisplay(${st.index});">${addr.rankName}</a></td>
										<td><a href="javascript:doDisplay(${st.index});">${addr.deptName}</a></td>
										<td><a href="javascript:doDisplay(${st.index});">${addr.phone}</a></td>
										<td><a href="javascript:doDisplay(${st.index});">${addr.email}</a></td>
									</tr>
				    			</c:forEach> --%>
				    			
								<ul class="tree">
								  <li>
								    <input type="checkbox" id="root">
								    <label for="root">비즈쉐어 (테스트용)</label>
								    <ul>
								      <li>
							          	<input type="checkbox" id="node0">
								      	<label for="node0" class="lastTree"><img id="img2" src="${root}/resources/img/guest.png">대표</label>
							          </li> 
								      
								      <li>
								        <input type="checkbox" id="node1">
								        <label for="node1">인사부</label>
								        <ul>
								          <li>
								          	<c:forEach var="addr" items="${voList}" varStatus="st">
								           	 <input type="checkbox" id="node11">
											 <div id="label">
												 <label for="node11" class="lastTree"><img id="img2" src="${root}/resources/img/guest.png"><a href="javascript:doDisplay(${st.index});"> ${addr.nick} ${addr.rankName}</a>
												 </label>
											 </div>
				    						</c:forEach>
								          </li> 
								        </ul>
								       
								      <li>
								        <input type="checkbox" id="node2">
								        <label for="node2">개발부</label>
								        <ul>
								          <li>
								          	<c:forEach var="addr" items="${voList}" varStatus="st">
								           	 <input type="checkbox" id="node21">
											 <div id="label">
												 <label for="node21" class="lastTree"><img id="img2" src="${root}/resources/img/guest.png"><a href="javascript:doDisplay(${st.index});"> ${addr.nick} ${addr.rankName}</a></label>
											 </div>
				    						</c:forEach>
								          </li> 
								        </ul> <!-- node 2x -->
								      <li>
								        <input type="checkbox" id="node3">
								        <label for="node3">영업부</label>
								        <ul>
								          <li>
								          	<c:forEach var="addr" items="${voList}" varStatus="st">
									            <input type="checkbox" id="node31">
												<div id="label">
													<label for="node31" class="lastTree"><img id="img2" src="${root}/resources/img/guest.png"><a href="javascript:doDisplay(${st.index});"> ${addr.nick} ${addr.rankName}</a></label>
												</div>
				    						</c:forEach>
								          </li>
								        </ul> <!-- node 3x -->
								      </li>
								    </ul> <!-- node1,2,3 -->
								  </li> <!-- tree -->
								</ul> <!-- tree -->
							</tbody>
                        </table>
                        
                    </div>
                </div> <!-- card body -->
                
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
		                		<c:forEach var="addr2" items="${dvoList}" varStatus="st">
				                		<tr class="temp-${st.index} addrList">
					                		<td id="t1">이름:&nbsp ${addr2.nick}</td>
					                	</tr>
					                	<tr class="temp-${st.index} addrList">
					                		<td id="t1">직급:&nbsp ${addr2.rankName}</td>
					                	</tr>
										<tr class="temp-${st.index} addrList">
											<td id="t1">부서:&nbsp ${addr2.deptName}</td>
					                	</tr>
										<tr class="temp-${st.index} addrList">
											<td id="t1">연락처:&nbsp ${addr2.phone}</td>
					                	</tr>
										<tr class="temp-${st.index} addrList">
											<td id="t1">이메일:&nbsp ${addr2.email}</td>
					                	</tr>
					                	<tr class="temp-${st.index} addrList">
											<td id="t1">주소:&nbsp ${addr2.address}</td>
					                	</tr>
					                	<tr class="temp-${st.index} addrList">
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


<script type="text/javascript"> 
	var bDisplay = true; 
	function doDisplay(idx){ 	
		
		const arr = document.querySelectorAll(".temp-" + idx);
		console.log(arr);
		for(let i = 0; i < arr.length; i++)  {
			arr[i].classList.toggle('addrList');
		}
		
	    var con = document.getElementById("test1"); 
	    
	    if(con.style.display=='block'){ 		
	        con.style.display = 'none'; 	
	    }else{ 		
	        con.style.display = 'block'; 	
	    } 
	} 
	
</script> 

