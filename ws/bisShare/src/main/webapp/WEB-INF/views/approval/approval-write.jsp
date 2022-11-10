<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- 써머노트 관련 js -->
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
               placeholder: 'content',
               minHeight: 500,
               maxHeight: 500,
               focus: true, 
               lang : 'ko-KR'
        }); 
    });
</script>

<style>
    #approve-submit-area>button:last-child{margin-left: 10px;}
    #apprve-write-outer{width: 80vw;height: 100%;}
    #stamp-area>td{height: 150px;}
    input[name=adcName]{width: 100%;}
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
        height: 50px;
        /* border: 1px solid black; */
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        line-height: 40px;
    }
    #agree-line-area>div, #ref-line-area>div{
        border: 1px solid grey;
        border-top: 0;
        box-sizing: border-box;
        text-align: center;
    }
    
</style>

<div class="card shadow mb-4" id="apprve-write-outer">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary" id="approve-submit-area">
            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#submitModal">기안하기</a>
        </h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    기본 설정
                </h6>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tr>
                    <td class="bg-gray-200 text-gray-900">문서 종류</td>
                    <td>
                        <select name="categoryNo">
                            <option value="1">휴가원</option>
                            <option value="2">품의서</option>
                            <option value="3">출장</option>
                            <option value="4">연장근무</option>
                        </select>
                    </td>
                    <td class="bg-gray-200 text-gray-900">작성자</td>
                    <td>${loginVo.deptName}  ${loginVo.rankName}  ${loginVo.nick}</td> 
                </tr>
            </table>
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    결재선 <button id="aprv-line-select" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#aprv-line-Modal">+</button>
                </h6>
            </div>
            <div id="approve-line-area" class="table-bordered">
                <div class="bg-gray-200">
                    <div id="approve-line-button-area"></div>
                    <div id="approve-line-name-area">결재</div>
                    <div></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
                <div>
                    <div class="approve-rank-area bg-gray-200"></div>
                    <div class="approve-stamp-area"></div>
                    <div class="approve-name-area"></div>
                </div>
            </div>
            <!-- 합의 라인 -->
            <div id="agree-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">합의<button id="agree-line-select" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#agree-line-Modal">+</button></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
            </div>
            <!-- 참조 라인 -->
            <div id="ref-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">참조    <button id="ref-line-select" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#ref-line-Modal">+</button></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
                <div>
                    <div class=""></div>
                </div>
            </div>
            
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    상세 입력
                </h6>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tr>
                    <td class="bg-gray-200 text-gray-900">제목</td>
                    <td><input name="adcName" type="text"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea id="summernote" name="adcContent">
                            <p><br></p><p>&lt; 휴가원 &gt;</p><table class="table table-bordered"><tbody><tr><td><b>휴가기간</b></td><td>0000년 00월 00일 00시 00분 ~ 0000년 00월 00일 00시 00분</td></tr><tr><td><span style="font-weight: bolder;">휴가종류</span><br></td><td>(반차,연차,병가,경조)<br></td></tr><tr><td><b>휴가사유</b></td><td><p>( 휴가 1일 전 까지 결재를 득하여 제출 하여 주시기 바랍니다.)</p></td></tr></tbody></table><p>위와 같이 휴가를 신청 하오니 재가 하여 주시기 바랍니다.</p>
                        </textarea>
                    </td>
                </tr>
            </table>
           	<div class="form-group custom-file mb-3">
				<input type="file" class="form-control custom-file-input" id="customFile" name="file" multiple onchange="fileUpload(this);">
				<label class="custom-file-label" for="customFile">파일선택</label>
			</div>
			<div class="form-group mb-3" id="upload-files">
        </div>
    </div>
</div>



<style>
    .aprv-select-area{
        /* border: 1px solid black; */
        /* box-sizing: content-box; */
        width: 100%;
        height: 500px;
        display: grid;
        grid-template-columns: 4.5fr 1fr 4.5fr;
    }
    .non-select-emp-area, .select-emp-area{
        border: 0.5px solid darkgrey;
        box-sizing: border-box;
        height: 100%;
        display: grid;
        grid-template-rows: 0.5fr 9.5fr;
    }
    .select-dept-list-area{
        border: 0.5px solid darkgrey;
        overflow: scroll;
        height: 450px;
    }
    .select-dept-list-area>div{
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        margin: 0;
    }
    .select-dept-list-area>div>div{
        border: 1px solid grey;
    }




    /*모달창 버튼 영역 */
    .select-controll-area{
        display: grid;
        grid-template-rows: 4fr 1fr 0.5fr 1fr 4fr;
    }
    .select-controll-area>div>button{
        width: 100%;
    }

</style>


<!-- 결재권자 선택 모달창 -->
<div class="modal fade" id="aprv-line-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">결재선 설정</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="aprv-select-area" class="aprv-select-area">
                    <div id="non-select-emp-area" class="non-select-emp-area">
                        <div>
                            <label for="select-dept">부서 선택</label>
                            <select name="selectDept" id="select-dept">
                            	<option value="all">전체</option>
                            	<c:forEach items="${ deptList }" var="dl">
	                                <option value="${ dl.deptNo }">${ dl.deptName }</option>
                            	</c:forEach>
                            </select>
                        </div>
                        <div id="select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                            <c:forEach items="${empList}" var="l">
                                <c:if test="${ loginVo.empNo ne l.value }"> <%-- 작성자는 뜰필요 없음 --%>
	                                <div class="table table-bordered aprver-selection">
		                                <div>
	                                        <input class="non-added" name="move-check" type="checkbox">
	                                        <input type="hidden" name="empNo" value="${l.value}">
	                                        <input type="hidden" class="aprv-deptNo" name="deptNo" value="${l.deptNo}">
	                                    </div>
		                                <div>${l.deptName}</div>
		                                <div>${l.rankName}</div>
		                                <div>${l.nick}</div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="select-controll-area" class="select-controll-area">
                        <div></div>
                        <div>
                            <button id="select-plus-btn" class="btn btn-sm btn-primary">추가</button>
                        </div>
                        <div></div>
                        <div>
                            <button id="select-minus-btn" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                        <div></div>
                    </div>
                    <div id="select-emp-area" class="select-emp-area">
                        <div>
                        	<span>선택된 결재권자</span>
                        </div>
                        <div id="select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <button id="select-complete" class="btn btn-success" type="button" data-dismiss="modal">선택완료</button>
            </div>
        </div>
    </div>
</div>

<!-- 합의자 선택 모달창 -->
<div class="modal fade" id="agree-line-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">합의자 설정</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="agree-select-area" class="aprv-select-area">
                    <div id="agree-non-select-emp-area" class="non-select-emp-area">
                        <div>
                            <label for="select-dept">부서 선택</label>
                            <select name="selectDept" id="select-dept">
                                <option value="all">전체</option>
                            	<c:forEach items="${ deptList }" var="dl">
	                                <option value="${ dl.deptNo }">${ dl.deptName }</option>
                            	</c:forEach>
                            </select>
                        </div>
                        <div id="agree-select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                            <c:forEach items="${empList}" var="l">
                                <c:if test="${ loginVo.empNo ne l.value }"> <%-- 작성자는 뜰필요 없음 --%>
                                    <div class="table table-bordered">
                                        <div>
                                            <input class="agree-non-added" name="move-check" type="checkbox">
                                            <input type="hidden" name="agree-empNo" value="${l.value}">
                                            <input type="hidden" class="agree-deptNo" name="deptNo" value="${l.deptNo}">
                                        </div>
                                        <div>${l.deptName}</div>
                                        <div>${l.rankName}</div>
                                        <div>${l.nick}</div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="agree-select-controll-area" class="select-controll-area">
                        <div></div>
                        <div>
                            <button id="agree-select-plus-btn" class="btn btn-sm btn-primary">추가</button>
                        </div>
                        <div></div>
                        <div>
                            <button id="agree-select-minus-btn" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                        <div></div>
                    </div>
                    <div id="agree-select-emp-area" class="select-emp-area">
                        <div>
                        	<span>선택된 합의자</span>
                        </div>
                        <div id="agree-select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <button id="agree-select-complete" class="btn btn-success" type="button" data-dismiss="modal">선택완료</button>
            </div>
        </div>
    </div>
</div>

<!-- 참조자 선택 모달창 -->
<div class="modal fade" id="ref-line-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">참조자 설정</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="ref-select-area" class="aprv-select-area">
                    <div id="ref-non-select-emp-area" class="non-select-emp-area">
                        <div>
                            <label for="select-dept">부서 선택</label>
                            <select name="selectDept" id="select-dept">
                                <option value="all">전체</option>
                            	<c:forEach items="${ deptList }" var="dl">
	                                <option value="${ dl.deptNo }">${ dl.deptName }</option>
                            	</c:forEach>
                            </select>
                        </div>
                        <div id="ref-select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                            <c:forEach items="${empList}" var="l">
                                <c:if test="${ loginVo.empNo ne l.value }"> <%-- 작성자는 뜰필요 없음 --%>
                                    <div class="table table-bordered">
                                        <div>
                                            <input class="ref-non-added" name="move-check" type="checkbox">
                                            <input type="hidden" name="ref-empNo" value="${l.value}">
                                            <input type="hidden" class="ref-deptNo" name="deptNo" value="${l.deptNo}">
                                        </div>
                                        <div>${l.deptName}</div>
                                        <div>${l.rankName}</div>
                                        <div>${l.nick}</div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="ref-select-controll-area" class="select-controll-area">
                        <div></div>
                        <div>
                            <button id="ref-select-plus-btn" class="btn btn-sm btn-primary">추가</button>
                        </div>
                        <div></div>
                        <div>
                            <button id="ref-select-minus-btn" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                        <div></div>
                    </div>
                    <div id="ref-select-emp-area" class="select-emp-area">
                        <div>
                        	<span>선택된 참조자</span>
                        </div>
                        <div id="ref-select-dept-list-area" class="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <button id="ref-select-complete" class="btn btn-success" type="button" data-dismiss="modal">선택완료</button>
            </div>
        </div>
    </div>
</div>


<!-- 기안 할건지 물어보는 모달-->
<div class="modal fade" id="submitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">비즈쉐어</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">기안 하시겠습니까?</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <button class="btn btn-primary" id="submit-btn">기안</button>
            </div>
        </div>
    </div>
</div>      


<script src="${root}/resources/js/approve/approve-write.js"></script>
<script src="${root}/resources/js/approve/approve-file-upload.js"></script>


