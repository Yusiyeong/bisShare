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
    #approve-submit-area>a:last-child{margin-left: 10px;}
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
    #agree-line-area{
        width: 100%;
        height: 30px;
        /* border: 1px solid black; */
        box-sizing: border-box;
        display: grid;
        grid-template-columns: repeat(8, 1fr);
    }
    #agree-line-area>div{
        border: 1px solid grey;
        border-top: 0;
        box-sizing: border-box;
        text-align: center;
    }
    
</style>

<div class="card shadow mb-4" id="apprve-write-outer">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary" id="approve-submit-area">
            <a class="btn btn-sm btn-primary" href="">기안하기</a>
            <a class="btn btn-sm btn-primary" href="">임시저장</a>
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
                    <div id="">합의</div>
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
            <div id="agree-line-area">
                <div id="" class="bg-gray-200">
                    <div id="">참조</div>
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
    #aprv-select-area{
        /* border: 1px solid black; */
        /* box-sizing: content-box; */
        width: 100%;
        height: 500px;
        display: grid;
        grid-template-columns: 4.5fr 1fr 4.5fr;
    }
    #non-select-emp-area, #select-emp-area{
        border: 0.5px dotted red;
        box-sizing: border-box;
        height: 100%;
        display: grid;
        grid-template-rows: 1fr 9fr;
    }
    #select-dept-list-area{
        border: 1px solid green;
    }
    #select-dept-list-area>div{
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        margin: 0;
    }
    #select-dept-list-area>div>div{
        border: 1px solid grey;
    }




    /*모달창 버튼 영역 */
    #select-controll-area{
        display: grid;
        grid-template-rows: 4fr 1fr 0.5fr 1fr 4fr;
    }
    #select-controll-area>div>button{
        width: 100%;
    }

</style>


<!-- approver line select Modal-->
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

                <div id="aprv-select-area">
                    <div id="non-select-emp-area">
                        <div>
                            <label for="select-dept">부서 선택</label>
                            <select name="selectDept" id="select-dept">
                                <option value="1">인사</option>
                                <option value="2">개발</option>
                                <option value="3">영업</option>
                            </select>
                        </div>
                        <div id="select-dept-list-area">
                            <div class="table table-bordered">
                                <div>선택</div>
                                <div>부서</div>
                                <div>직급</div>
                                <div>이름</div>
                            </div>
                            <c:forEach items="${empList}" var="l">
	                            <div class="table table-bordered">
	                                <div>
                                        <input class="non-added" name="move-check" type="checkbox" value="${l.empNo}">
                                    </div>
	                                <div>${l.deptNo}</div>
	                                <div>${l.rankNo}</div>
	                                <div>${l.nick}</div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="select-controll-area">
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
                    <div id="select-emp-area">
                        <div>
                        </div>
                        <div id="select-dept-list-area">
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
                <button class="btn btn-success" type="button" data-dismiss="modal">선택완료</button>
            </div>
        </div>
    </div>
</div>       

<script type="text/javascript">
	const pbtn = document.querySelector('#select-plus-btn');
    const mbtn = document.querySelector('#select-minus-btn');

    const SEA = document.querySelector('#select-emp-area>#select-dept-list-area');
    const NSEA = document.querySelector('#non-select-emp-area>#select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('non-added');
        console.log(checkbox);
        console.log(checkbox.length);
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
        alert('무야호~');
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('added');
        console.log(checkbox);
        console.log(checkbox.length);
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
    

</script>

