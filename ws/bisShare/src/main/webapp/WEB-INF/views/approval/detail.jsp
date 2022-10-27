<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        box-sizing: border-box;
    }
    #approve-line-area>div{
        border: 1px solid grey;
        text-align: center;
        display: grid;
        grid-template-rows: 1fr 3fr 1fr;
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
        height: 30px;
        /* border: 1px solid black; */
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
    }
    #agree-line-area>div, #ref-line-area>div{
        border: 1px solid grey;
        border-top: 0;
        box-sizing: border-box;
        text-align: center;
    }
    
    #aprv-content-area{
    	width: 100%;
    	height: 500px;
    }
    
</style>

<div class="card shadow mb-4" id="apprve-write-outer">
   	<c:if test="${ loginVo.empNo eq avo.empNo }">
	    <div class="card-header py-3">
	        <h6 class="m-0 font-weight-bold text-primary" id="approve-submit-area">
		            <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#submitModal">기안취소</a>
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
                    <td class="bg-gray-200 text-gray-900">작성자</td>
                    <!-- loginMember에서 가져온 값으로 대체 -->
                    <td>${ loginVo.deptNo } ${ loginVo.rankNo } ${ loginVo.nick }</td> 
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
	                    <div class="approve-rank-area bg-gray-200">${ avo.aprverRanks[i]}</div>
		                    <div class="approve-stamp-area">
		                    	<div></div>
			                    <c:if test="${ loginVo.empNo eq avo.aprverEmpNos[i] }">
			                    	<div>
			                    		<button id="approve-btn" class="btn btn-outline-primary">결재</button>
			                    	</div>
			                    </c:if>
			                    <div></div>
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
                <c:forEach var="i" begin="0" end="${ fn:length(avo.agreeEmpNos) - 1 }">
                	<div>
	                    <div class="agree-name-area">
	                    	${ avo.agreeNicks[i]}
	                    	<c:if test="${ loginVo.empNo eq avo.agreeEmpNos[i] }">
	                    		<button class="btn btn-sm btn-outline-primary">확인</button>
		                    </c:if>
	                    </div>
                	</div>
                </c:forEach>
                <c:forEach begin="0" end="${6-fn:length(avo.agreeEmpNos)}">
                	<div>
	                    <div class="agree-name-area"></div>
                	</div>
                </c:forEach>
            </div>
            <!-- 참조 라인 -->
            <div id="ref-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">참조</div>
                </div>
                <c:forEach var="i" begin="0" end="${ fn:length(avo.refEmpNos) - 1 }">
                	<div>
	                    <div class="ref-name-area">
	                    	${ avo.refNicks[i]}
	                    	<c:if test="${ loginVo.empNo eq avo.refEmpNos[i] }">
	                    		<button class="btn btn-sm btn-outline-primary">확인</button>
		                    </c:if>
	                    </div>
                	</div>
                </c:forEach>
                <c:forEach begin="0" end="${6-fn:length(avo.refEmpNos)}">
                	<div>
	                    <div class="ref-name-area"></div>
                	</div>
                </c:forEach>
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
        </div>
    </div>
</div>




<<script type="text/javascript">
	
	$('#approve-btn').click(()=>{
		confirm('무야호~');
	})
	
</script>

























