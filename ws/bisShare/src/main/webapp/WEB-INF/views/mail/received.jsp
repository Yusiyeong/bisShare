<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<script>
	const root = "${root}";
</script>
<style>
	.hover {
		cursor: pointer;
	}
</style>
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Email</h1>
	<div class="row">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">받은 메일함</h6>
			</div>
			<div class="card-body">
				<jsp:include page="mail-nav.jsp"></jsp:include>
				<div class="table-responsive">
					<table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>중요</th>
								<th>메일명</th>
								<th>발신인</th>
								<th>시간</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th><input type="checkbox"></th>
								<th>번호</th>
								<th>중요</th>
								<th>메일명</th>
								<th>발신인</th>
								<th>시간</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${receiveMail}" var="r">
								<tr>
									<td><input type="checkbox" ></td>
									<td>${r.mailNo}</td>
									<c:if test="${ r.star eq 'N'}">
										<td>☆</td>	
									</c:if>
									<c:if test="${ r.star eq 'Y'}">
										<td>★</td>
									</c:if>
									
									<td>${r.title}</td>
									<td>${r.send}</td>
									<td>${r.enrollDate}</td>
								</tr>
							</c:forEach>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29 11:00</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 기본 -->
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >메일 보기 / 작성</h6>
	    		</div>
				<div class="card-body" id="right-show">
					<!-- 메일 작성 -->
					<jsp:include page="write.jsp"></jsp:include>

					<!-- 메일 상세보기 -->
					<jsp:include page="detail.jsp"></jsp:include>

				</div>
			</div>
		</div>
	</div> <!-- 왼쪽 -->




</div>

<script src="../resources/js/mail/datatables.js"></script>
<script src="../resources/js/mail/mail-nav.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="${root}/resources/js/mail/write.js"></script>
