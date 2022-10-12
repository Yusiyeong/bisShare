<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />   

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">나의 결재함</h1>
    <p class="mb-4">000님이 연관된 결재 입니다.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">결재함</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>서식명</th>
                            <th>제목</th>
                            <th>진행상태</th>
                            <th>기안일</th>
                            <th>현 결재자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                        <tr>
                            <td>연장근무 신청</td>
                            <td>연장근무신청서 (10-12)</td>
                            <td>진행중</td>
                            <td>22.10.12 01:11</td>
                            <td>박한솔</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <!-- 데이터 테이블 js -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level plugins -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${root}/resources/js/demo/datatables-demo.js"></script>