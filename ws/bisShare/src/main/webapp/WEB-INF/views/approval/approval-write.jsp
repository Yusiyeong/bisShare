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
    
</style>

<div class="card shadow mb-4" id="apprve-write-outer">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary" id="approve-submit-area">
            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#submitModal">기안하기</a>
            <button class="btn btn-sm btn-primary" id="submit-temp">임시저장</a>
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
                    <!-- loginMember에서 가져온 값으로 대체 -->
                    <td>IT개발팀 주임 박한솔</td> 
                </tr>
            </table>
            <div class="py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    결재선 <button id="aprv-line-select" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#aprv-line-Modal">+</button>
                </h6>
            </div>
            <div id="approve-line-area" class="table-bordered">
                <div class="bg-gray-200">
                    <div id="approve-line-button-area">
                        
                    </div>
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
                    <div id="">참조<button id="ref-line-select" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#ref-line-Modal">+</button></div>
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
                        <textarea id="summernote" name="adcContent"></textarea>
                    </td>
                </tr>
            </table>
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
        border: 0.5px dotted red;
        box-sizing: border-box;
        height: 100%;
        display: grid;
        grid-template-rows: 1fr 9fr;
    }
    .select-dept-list-area{
        border: 1px solid green;
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
                                <option value="1">인사</option>
                                <option value="2">개발</option>
                                <option value="3">영업</option>
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
	                            <div class="table table-bordered">
	                                <div>
                                        <input class="non-added" name="move-check" type="checkbox">
                                        <input type="hidden" name="empNo" value="${l.value}">
                                    </div>
	                                <div>${l.deptNo}</div>
	                                <div>${l.rankNo}</div>
	                                <div>${l.nick}</div>
	                            </div>
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
                                <option value="1">인사</option>
                                <option value="2">개발</option>
                                <option value="3">영업</option>
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
	                            <div class="table table-bordered">
	                                <div>
                                        <input class="agree-non-added" name="move-check" type="checkbox">
                                        <input type="hidden" name="agree-empNo" value="${l.value}">
                                    </div>
	                                <div>${l.deptNo}</div>
	                                <div>${l.rankNo}</div>
	                                <div>${l.nick}</div>
	                            </div>
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
                                <option value="1">인사</option>
                                <option value="2">개발</option>
                                <option value="3">영업</option>
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
	                            <div class="table table-bordered">
	                                <div>
                                        <input class="ref-non-added" name="move-check" type="checkbox">
                                        <input type="hidden" name="ref-empNo" value="${l.value}">
                                    </div>
	                                <div>${l.deptNo}</div>
	                                <div>${l.rankNo}</div>
	                                <div>${l.nick}</div>
	                            </div>
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
                <button class="btn btn-primary" id="submit-btn">기안</a>
            </div>
        </div>
    </div>
</div>      

<script type="text/javascript">
	const pbtn = document.querySelector('#select-plus-btn');
    const mbtn = document.querySelector('#select-minus-btn');
    const cbtn = document.querySelector('#select-complete');

    const SEA = document.querySelector('#select-emp-area>#select-dept-list-area');
    const NSEA = document.querySelector('#non-select-emp-area>#select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 non-added -> added
                $(NSEA).children().eq(i+1).children().first().children().first().attr('class','added');
                //select-area로 넘겨버리기
                const addCont = $(NSEA).children().eq(i+1);
                $(SEA).append(addCont);
            }
        }
    })

    // 삭제 버튼 클릭 했을 때 이벤트
    mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(SEA).children().eq(i+1).children().first().children().first().attr('class','non-added');
                //non-select-area로 넘기기
                const addCont = $(SEA).children().eq(i+1);
                $(NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(cbtn).click(()=>{
        //넘겨줄 배열
        const eNos = [];
        const eDepts = [];
        const eNames = [];
        const eRanks = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        $(".added+input[name='empNo']").each(function(i){
            eNos.push($(".added+input[name='empNo']").eq(i).attr("value"));
            eDepts.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(1).text());
            eRanks.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(2).text());
            eNames.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#approve-line-area').children().eq(i+1).append("<input type='hidden' name='empNo' value='"+ eNos[i] +"'>");
            $('#approve-line-area').children().eq(i+1).children().eq(0).text(eRanks[i]);
            $('#approve-line-area').children().eq(i+1).children().eq(2).text(eNames[i]);
        });
        
    })
    
    
    
    //기안하기 버튼 눌럿을 때
    $('#submit-btn').click(()=>{
    	//결재 카테고리 가져오
		const categoryNo = $('select[name=categoryNo]').val();
        // 결재권자 가져오기
    	const aprverEmpNos_ = document.getElementsByClassName('added');
        let aprverEmpNos = "";
        let aprverStatus = "";
        for(let i = 0; i < aprverEmpNos_.length; ++i){
            if(i==0){
                aprverEmpNos += $(".added+input[name='empNo']").eq(i).attr("value");
	            aprverStatus += "N";
            } else{
                aprverEmpNos += "," + $(".added+input[name='empNo']").eq(i).attr("value");
                aprverStatus += ",N";
            }
        }
        //결재 상세내용(제목, 컨텐츠) 가져오기
        const adcName = $('input[name=adcName]').val();
        const adcContent = $('textarea[name=adcContent]').val();

        //합의자, 참조자 가져오기
        const agree_ = document.getElementsByClassName('agree-added');
        let agreeEmpNos = "";
        let agreeStatus = "";
        for(let i = 0; i < agree_.length; ++i){
            if(i==0){
                agreeEmpNos += $(".agree-added+input[name='agree-empNo']").eq(i).attr("value");
                agreeStatus += "N";
            } else{
                agreeEmpNos += "," + $(".agree-added+input[name='agree-empNo']").eq(i).attr("value");
                agreeStatus += ",N";
            }
        }
        const ref_ = document.getElementsByClassName('ref-added');
        let refEmpNos = "";
        let refStatus = "";
        for(let i = 0; i < ref_.length; ++i){
            if(i==0){
                refEmpNos += $(".ref-added+input[name='ref-empNo']").eq(i).attr("value");
                refStatus += "N";
            } else{
                refEmpNos += "," + $(".ref-added+input[name='ref-empNo']").eq(i).attr("value");
                refStatus += ",N";
            }
            
        }
    	//결재 TABLE 에 삽입해줄 ajax
    	$.ajax({
    		url : "${root}/approval/write"
    		, type : "post"
    		, data : {
	    			categoryNo : categoryNo
	    			, adcName : adcName
	    			, adcContent : adcContent
    				, aprverEmpNo : aprverEmpNos
    				, aprverStatus : aprverStatus
		    		, agreeEmpNo : agreeEmpNos
		    		, agreeStatus : agreeStatus
		    		, refEmpNo : refEmpNos
		    		, refStatus : refStatus
    		}
    		, success : (result) => {
				if(result == 'ok'){
					alert('결재 작성 성공');
					location.href = '${root}/main';
				} else{
					alert('결재 작성 실패')
				}
			}
    		, error : ()=>{
    			alert('연결실패');
    		}
    	})
    	
    })
    
    
</script>


<!-- 합의 모달 관련 -->
<script>
    const agree_pbtn = document.querySelector('#agree-select-plus-btn');
    const agree_mbtn = document.querySelector('#agree-select-minus-btn');
    const agree_cbtn = document.querySelector('#agree-select-complete');

    const agree_SEA = document.querySelector('#agree-select-emp-area>#agree-select-dept-list-area');
    const agree_NSEA = document.querySelector('#agree-non-select-emp-area>#agree-select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    agree_pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('agree-non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 non-added -> added
                $(agree_NSEA).children().eq(i+1).children().first().children().first().attr('class','agree-added');
                //select-area로 넘겨버리기
                const addCont = $(agree_NSEA).children().eq(i+1);
                $(agree_SEA).append(addCont);
            }
        }
    })

    // 삭제 버튼 클릭 했을 때 이벤트
    agree_mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('agree-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(agree_SEA).children().eq(i+1).children().first().children().first().attr('class','agree-non-added');
                //non-select-area로 넘기기
                const addCont = $(agree_SEA).children().eq(i+1);
                $(agree_NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(agree_cbtn).click(()=>{
        //넘겨줄 배열
        const eNos = [];
        const eNames = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        $(".agree-added+input[name='agree-empNo']").each(function(i){
            eNos.push($(".agree-added+input[name='agree-empNo']").eq(i).attr("value"));
            eNames.push($(".agree-added+input[name='agree-empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#agree-line-area').children().eq(i+1).append("<input type='hidden' name='agree-empNo' value='"+ eNos[i] +"'>");
            $('#agree-line-area').children().eq(i+1).children().eq(0).text(eNames[i]);
        });
        
    })
</script>






<!-- 참조 모달 관련 -->
<script>
    const ref_pbtn = document.querySelector('#ref-select-plus-btn');
    const ref_mbtn = document.querySelector('#ref-select-minus-btn');
    const ref_cbtn = document.querySelector('#ref-select-complete');

    const ref_SEA = document.querySelector('#ref-select-emp-area>#ref-select-dept-list-area');
    const ref_NSEA = document.querySelector('#ref-non-select-emp-area>#ref-select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    ref_pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('ref-non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 non-added -> added
                $(ref_NSEA).children().eq(i+1).children().first().children().first().attr('class','ref-added');
                //select-area로 넘겨버리기
                const addCont = $(ref_NSEA).children().eq(i+1);
                $(ref_SEA).append(addCont);
            }
        }
    })

    // 삭제 버튼 클릭 했을 때 이벤트
    ref_mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('ref-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(ref_SEA).children().eq(i+1).children().first().children().first().attr('class','ref-non-added');
                //non-select-area로 넘기기
                const addCont = $(ref_SEA).children().eq(i+1);
                $(ref_NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(ref_cbtn).click(()=>{
        //넘겨줄 배열
        const eNos = [];
        const eNames = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        $(".ref-added+input[name='ref-empNo']").each(function(i){
            eNos.push($(".ref-added+input[name='ref-empNo']").eq(i).attr("value"));
            eNames.push($(".ref-added+input[name='ref-empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#ref-line-area').children().eq(i+1).append("<input type='hidden' name='ref-empNo' value='"+ eNos[i] +"'>");
            $('#ref-line-area').children().eq(i+1).children().eq(0).text(eNames[i]);
        });
        
    })
</script>

