<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
	a{
		color: black;
	}
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Content Row -->
    <div class="row">
        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4 border-left-primary">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <tbody>
                                <c:if test="${ not empty nvoList }">
		                      	  <c:forEach var="i" begin="0" end="4">
		                            <c:if test="${ not empty nvoList[i] }">
			                            <tr>
			                                <td>
			                                	<a href="${root}/notice/detail/${ nvoList[i].boardNo }">
			                                		${ nvoList[i].title }
			                                	</a>
	                                		</td>
			                            </tr>
	                           		</c:if>
		                      	  </c:forEach>
	                        	</c:if>
	                        	<c:if test="${ empty nvoList }">
		                            <tr>
		                                <td colspan="2">등록된 공지사항이 없습니다.</td>
		                            </tr>
	                        	</c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4 border-left-success">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">결재</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <tbody>
                        	<c:if test="${ not empty avoList }">
	                      	  <c:forEach var="i" begin="0" end="4">
	                      	  	<c:if test="${ not empty avoList[i] }">
		                            <tr>
		                                <td>
		                                	<a href="${root}/approval/detail/${ avoList[i].adcNo }">
		                                		${ avoList[i].adcName }
                                		</td>
		                                <td style="text-align: center;">${ avoList[i].empNo }</td>
		                            </tr>
	                            </c:if>
	                      	  </c:forEach>
                        	</c:if>
                        	<c:if test="${ empty avoList }">
	                            <tr>
	                                <td colspan="2">${ loginVo.nick }님이 처리하실 결재문서가 없습니다.</td>
	                            </tr>
                        	</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">
        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4 border-left-info">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">중요일정</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <tbody>
                            <c:if test="${ not empty cvoList }">
	                      	  <c:forEach var="i" begin="0" end="4">
	                      	  	<c:if test="${ not empty cvoList[i] }">
		                            <tr>
		                                <td colspan="2">
			                                <a href="${root}/calendar/detail/${ cvoList[i].calNo }">
		                                		${ cvoList[i].title }
		                                	</a>
		                                </td>
		                            </tr>
	                            </c:if>
	                      	  </c:forEach>
                        	</c:if>
                        	<c:if test="${ empty cvoList }">
	                            <tr>
	                                <td colspan="2">중요한 일정이 없습니다.</td>
	                            </tr>
                        	</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4 border-left-dark">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">메일</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <tbody>
                            <c:if test="${ not empty mvoList }">
	                      	  <c:forEach var="i" begin="0" end="4">
	                      	  	<c:if test="${ not empty mvoList[i] }">
		                            <tr>
		                                <td>
		                                	<a href="${root}/mail/receive/${ mvoList[i].mailNo }">
		                                		${ mvoList[i].title }
		                                	</a>
		                                </td>
		                            </tr>
	                            </c:if>
	                      	  </c:forEach>
                        	</c:if>
                        	<c:if test="${ empty mvoList }">
	                            <tr>
	                                <td colspan="2">안읽은 메일이 없습니다.</td>
	                            </tr>
                        	</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->


<script>
	
	
	
</script>
