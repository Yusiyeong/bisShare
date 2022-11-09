<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<c:set var="root" value="${pageContext.request.contextPath}" />   

<style>
    #approve-submit-area>button:last-child{margin-left: 10px;}
    #apprve-write-outer{width: 80vw;height: 100%;}
    #stamp-area>td{height: 150px;}
    input[name=title]{width: 100%;}
    td{text-align: center;}
    /* 결재라인 css */
    #approve-line-area{
        width: 100%;
        height: 170px;
        /* border: 1px solid black; */
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
    }
    #approve-line-area div{
        /* box-sizing: border-box; */
    }
    #approve-line-area>div{
        border: 1px solid grey;
        text-align: center;
        display: grid;
        height: 170px !important;
        grid-template-rows: 1fr 3fr 1fr !important;
    }
    #approve-line-name-area{
        padding-top: 40px;
    }
    .approve-rank-area, .approve-name-area{
        border-bottom: 1px solid gray;
        border-top: 1px solid grey;
        line-height: 30px;
    }
    /* 참조라인 css */
    #agree-line-area, #ref-line-area{
        width: 100%;
        height: 50px;
        /* border: 1px solid black; */
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        line-height: 45px;
    }
    #agree-line-area>div, #ref-line-area>div{
        border: 1px solid grey;
        border-top: 0;
        box-sizing: border-box;
        text-align: center;
    }
    .agree-name-area,.ref-name-area{
    	width: 100%;
    	height: 100%;
    }
    
    #aprv-content-area{
    	width: 100%;
    	height: 500px;
    }
    #approve-btn, #approve-reject-btn{
    	margin-top: 30px;
    }
    
    #approve-btn-area, #approve-stamp-area{
    	width : 100%;
    	height : 101px;
    }
    #approve-stamp{
    	width: 100%;
    	height: 101px !important;
        object-fit: contain;
    }
</style>

<div class="card shadow mb-4" id="apprve-write-outer">
   	<c:if test="${ loginVo.nick eq avo.empNo && avo.progress eq '0' }">
	    <div class="card-header py-3">
	        <h6 class="m-0 font-weight-bold text-primary" id="approve-submit-area">
		            <button class="btn btn-sm btn-danger" id="aprv-cancel">기안취소</a>
	        </h6>
	    </div>
   	</c:if>
    <div class="card-body">
        <div class="table-responsive">
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    결재 정보
                </h6>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tr>
                    <td class="bg-gray-200 text-gray-900">문서 종류</td>
                    <td>
                        ${ avo.categoryNo }
                    </td>
                    <td class="bg-gray-200 text-gray-900">진행도</td>
                    <c:if test="${ avo.progress ne '반려' }">
                        <c:if test="${ avo.progress eq '100' }">
	                    	<td style="color: blue; font-weight: 900;">결재 완료</td>
	                    </c:if>
	                    <c:if test="${ avo.progress ne '100' }">
                    		<td>${ avo.progress }%</td>
	                    </c:if>
                    </c:if>
                    <c:if test="${ avo.progress eq '반려' }">
                    	<td style="color: red; font-weight: 900;">반려</td>
                    </c:if>
                </tr>
                <tr>
                	<td class="bg-gray-200 text-gray-900">작성일시</td>
                	<td>${ avo.enrollDate }</td>
                	<td class="bg-gray-200 text-gray-900">작성자</td>
                    <td>${ loginVo.deptName }팀  ${ loginVo.rankName }  ${ loginVo.nick }</td> 
                </tr>
            </table>
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    결재선
                </h6>
            </div>
            <div id="approve-line-area" class="table-bordered">
                <div class="bg-gray-200">
                    <div id="approve-line-button-area">
                        
                    </div>
                    <div id="approve-line-name-area">결재</div>
                    <div></div>
                </div>
                <c:forEach var="i" begin="0" end="${ fn:length(avo.aprverEmpNos) - 1 }">
                	<div>
	                    <div class="approve-rank-area bg-gray-200">${ avo.aprverRanks[i] }</div>
		                    <div class="approve-stamp-area">
		                    	<c:if test="${ avo.progress ne '반려' }">
			                    	<c:if test="${ avo.aprverStatuses[i] eq 'N' }">
					                    <c:if test="${ loginVo.empNo eq avo.aprverEmpNos[i] }">
					                    	<div id="approve-btn-area">
					                    		<button id="approve-btn" class="btn btn-sm btn-outline-primary">결재</button>
					                    		<button id="approve-reject-btn" class="btn btn-sm btn-outline-danger">반려</button>
					                    	</div>
					                    </c:if>
			                    	</c:if>
		                    	</c:if>
		                    	<c:if test="${ avo.aprverStatuses[i] eq 'Y' }">
		                    		<img id="approve-stamp" alt="승인도장" src="${root}/resources/img/approve-stamp.png"> 
		                    	</c:if>
		                    	<c:if test="${ avo.aprverStatuses[i] eq 'R' }">
		                    		<img id="approve-stamp" alt="반려도장" src="${root}/resources/img/reject-stamp.png"> 
		                    	</c:if>
		                    </div>
	                    <div class="approve-name-area">${ avo.aprverNicks[i] }</div>
                	</div>
                </c:forEach>
                <c:forEach begin="0" end="${6-fn:length(avo.aprverEmpNos)}">
                	<div>
	                    <div class="approve-rank-area bg-gray-200"></div>
	                    <div class="approve-stamp-area"></div>
	                    <div class="approve-name-area"></div>
                	</div>
                </c:forEach>
            </div>
            <!-- 합의 라인 -->
            <div id="agree-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">합의</div>
                </div>
                <c:if test="${ not empty avo.agreeStatuses }">
	                <c:forEach var="i" begin="0" end="${ fn:length(avo.agreeEmpNos) - 1 }">
	                	<div>
		                    <div class="agree-name-area">
		                    	<c:if test="${ avo.progress ne '반려' }">
				                    <c:if test="${ avo.agreeStatuses[i] eq 'N' }">
					                    <c:if test="${ loginVo.empNo eq avo.agreeEmpNos[i] }">
				                    		<button id="agree-btn" class="btn btn-sm btn-outline-primary">합의</button>
				                    		<button id="agree-reject-btn" class="btn btn-sm btn-outline-danger">반려</button>
					                    </c:if>
					                    <c:if test="${ loginVo.empNo ne avo.agreeEmpNos[i] }">
				                    		${ avo.agreeNicks[i] }
					                    </c:if>
			                    	</c:if>
			                    	<c:if test="${ avo.agreeStatuses[i] eq 'Y' }">
			                    		${ avo.agreeNicks[i]}
			                    		<i class="bi bi-check-lg"></i>
			                    	</c:if>
			                    	<c:if test="${ avo.agreeStatuses[i] eq 'R' }">
			                    		${ avo.agreeNicks[i]}
			                    		<i class="bi bi-x-lg"></i>
			                    	</c:if>
			                    </c:if>
			                    <c:if test="${ avo.progress eq '반려' }">
			                    	<c:if test="${ avo.agreeStatuses[i] eq 'N' }">
			                    		${ avo.agreeNicks[i] }
			                    	</c:if>
			                    	<c:if test="${ avo.agreeStatuses[i] eq 'Y' }">
			                    		${ avo.agreeNicks[i]}
			                    		<i class="bi bi-check-lg"></i>
			                    	</c:if>
			                    	<c:if test="${ avo.agreeStatuses[i] eq 'R' }">
			                    		${ avo.agreeNicks[i]}
			                    		<i class="bi bi-x-lg"></i>
			                    	</c:if>
			                    </c:if>
		                    </div>
	                	</div>
	                </c:forEach>
	                <c:forEach begin="0" end="${6-fn:length(avo.agreeEmpNos)}">
	                	<div>
		                    <div class="agree-name-area"></div>
	                	</div>
	                </c:forEach>
                </c:if>
                <c:if test="${ empty avo.agreeStatuses }">
                	<c:forEach begin="0" end="6">
	                	<div>
		                    <div class="agree-name-area"></div>
	                	</div>
	                </c:forEach>
                </c:if>
            </div>
            <!-- 참조 라인 -->
            <div id="ref-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">참조</div>
                </div>
                <c:if test="${ not empty avo.refStatuses }">
	                <c:forEach var="i" begin="0" end="${ fn:length(avo.refEmpNos) - 1 }">
	                	<div>
		                    <div class="ref-name-area">
		                    	${ avo.refNicks[i]}
			                    <c:if test="${ avo.refStatuses[i] eq 'Y' }">
			                    	<i class="bi bi-check-lg"></i>
			                    </c:if>
		                    </div>
	                	</div>
	                </c:forEach>
	                <c:forEach begin="0" end="${6-fn:length(avo.refEmpNos)}">
	                	<div>
		                    <div class="ref-name-area"></div>
	                	</div>
	                </c:forEach>
                </c:if>
                <c:if test="${ empty avo.refStatuses }">
	                <c:forEach begin="0" end="6">
	                	<div>
		                    <div class="ref-name-area"></div>
	                	</div>
	                </c:forEach>
                </c:if>
            </div>
            
            <br>
            
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    상세내용
                </h6>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tr>
                    <td class="bg-gray-200 text-gray-900">${ avo.adcName }</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="aprv-content-area">${ avo.adcContent }</div>
                    </td>
                </tr>
            </table>
            <c:if test="${ not empty attList }">
            	<div class="py-3">
	                <h6 class="m-0 font-weight-bold text-primary">
	                    첨부파일
	                </h6>
	            </div>
	            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                <tr>
	                    <td colspan="2">
	                        <div class="my-1  border border-secondary border-5 rounded-2 p-1" id="receivedFiles">
								<div class="font-weight-bolder ml-5">
									<c:forEach items="${ attList }" var="x">
										<a type="button" class="btn btn-outline-primary" href="${root}/approval/download/${x.attName}/${x.originName}">
							              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-arrow-down"
							                viewBox="0 0 16 16">
							                <path
							                  d="M8 5a.5.5 0 0 1 .5.5v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 1 1 .708-.708L7.5 9.293V5.5A.5.5 0 0 1 8 5z">
							                </path>
							                <path
							                  d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z">
							                </path>
							              </svg>
							              ${x.originName}
							              <input type="hidden" value="${x.attName}-${x.originName}" name="fileNames">
							            </a>
									</c:forEach>
								</div>
							</div>
	                    </td>
	                </tr>
	            </table>
            </c:if>
        </div>
    </div>
</div>




<script type="text/javascript">
	
	/* 결재하기 버튼 클릭 시 */
	$('#approve-btn').click(()=>{
		if(confirm('결재 하시겠습니까?')){
            $.ajax({
                url : "${root}/approval/approve"
                , type : "post"
                , data : {
                        adcNo : ${ avo.adcNo }
                		, aprverStatus : '${ avo.aprverStatus }'
               			, aprverEmpNo : '${ avo.aprverEmpNo }' 
                }
                , success : (result) => {
                    if(result == 'ok'){
                        alert('결재 성공');
                        location.reload();
                    } else{
                        alert('결재 실패')
                    }
                }
                , error : ()=>{
                    alert('연결실패');
                }
            })
        }
	})
	
	/* 합의하기 버튼 클릭 시 */
	$('#agree-btn').click(()=>{
		if(confirm('합의 하시겠습니까?')){
            $.ajax({
                url : "${root}/approval/agree"
                , type : "post"
                , data : {
                        adcNo : ${ avo.adcNo }
                		, agreeStatus : '${ avo.agreeStatus }'
               			, agreeEmpNo : '${ avo.agreeEmpNo }' 
                }
                , success : (result) => {
                    if(result == 'ok'){
                        alert('합의 성공');
                        location.reload();
                    } else{
                        alert('합의 실패')
                    }
                }
                , error : ()=>{
                    alert('연결실패');
                }
            })
        }
	})
	
	/* 기안취소 버튼 클릭 시 */
	$('#aprv-cancel').click(()=>{
		if(confirm('기안취소 하시겠습니까?')){
            $.ajax({
                url : "${root}/approval/cancel"
                , type : "post"
                , data : {
                        adcNo : ${ avo.adcNo }
                }
                , success : (result) => {
                    if(result == 'ok'){
                        alert('기안취소 성공');
                        location.href = '${root}/approval/my';
                    } else{
                        alert('기안취소 실패')
                    }
                }
                , error : ()=>{
                    alert('연결실패');
                }
            })
        }
	})
	
	/* 결재 반려 버튼 클릭 시 */
	$('#approve-reject-btn').click(()=>{
		if(confirm('결재 반려 하시겠습니까?')){
            $.ajax({
                url : "${root}/approval/approveReject"
                , type : "post"
                , data : {
                        adcNo : ${ avo.adcNo }
                		, aprverStatus : '${ avo.aprverStatus }'
               			, aprverEmpNo : '${ avo.aprverEmpNo }' 
                }
                , success : (result) => {
                    if(result == 'ok'){
                        alert('결재 성공');
                        location.reload();
                    } else{
                        alert('결재 실패')
                    }
                }
                , error : ()=>{
                    alert('연결실패');
                }
            })
        }
	})
	
	/* 합의 반려 하기 버튼 클릭 시 */
	$('#agree-reject-btn').click(()=>{
		if(confirm('합의 반려 하시겠습니까?')){
            $.ajax({
                url : "${root}/approval/agreeReject"
                , type : "post"
                , data : {
                        adcNo : ${ avo.adcNo }
                		, agreeStatus : '${ avo.agreeStatus }'
               			, agreeEmpNo : '${ avo.agreeEmpNo }' 
                }
                , success : (result) => {
                    if(result == 'ok'){
                        alert('합의 반려 성공');
                        location.reload();
                    } else{
                        alert('합의 반려 실패')
                    }
                }
                , error : ()=>{
                    alert('연결실패');
                }
            })
        }
	})
	
</script>

























