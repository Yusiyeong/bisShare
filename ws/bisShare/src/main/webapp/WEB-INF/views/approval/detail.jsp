<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />   

<h1>결재 디테일</h1>
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
            <div id="ref-line-area">
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
                        <div id="aprv-content-area"></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>






























