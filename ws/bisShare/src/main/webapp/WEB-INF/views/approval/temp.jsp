<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />   


    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">나의 기안서</h1>
    <p class="mb-4">000님이 작성한 기안서 입니다.</p>

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
                            <th>저장일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>연차 신청서</td>
                            <td>휴가원 (10-13)</td>
                            <td>22.10.12 01:24</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>