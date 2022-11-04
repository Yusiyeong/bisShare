<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
	.hover {
		cursor: pointer;
	}
</style>


<div class="row">
	<div class=" col-xl-6 col-lg-6">
		<div class="card shadow border-left-primary mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" id="pageTitle">받은 메일</h6>
			</div>
			<div class="card-body">
				<!-- 메일 네비게이션 -->
				<jsp:include page="mail-nav.jsp"></jsp:include>
				<!-- 메일 테이블 -->
				<c:if test="${empty requestScope.checkLoc}">
					<jsp:include page="mail-table.jsp"></jsp:include>
				</c:if>
				<c:if test="${!empty requestScope.checkLoc}">
					<jsp:include page="draft-table.jsp"></jsp:include>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 기본 -->
	<div class="col-xl-6 col-lg-6">
		<div class="card shadow mb-4 border-left-primary">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">메일 보기 / 작성</h6>
			</div>
			<div class="card-body" id="right-show">
				<!-- 메일 작성 -->
				<jsp:include page="write.jsp"></jsp:include>

				<!-- 메일 상세보기 -->
				<jsp:include page="detail.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>


<!-- Page level plugins -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<script src="${root}/resources/js/mail/checkLocation.js"></script>
<script src="${root}/resources/js/mail/datatables.js"></script>
<script src="${root}/resources/js/mail/mail-nav.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="${root}/resources/js/mail/write.js"></script>
<script src="${root}/resources/js/mail/tagify.js"></script>
<script>
	let dropDetail;
</script>
<c:if test="${!empty dropDetail}">
	<script>
		dropDetail = 1;
	</script>
</c:if>
<c:if test="${empty dropDetail}">
	<script>
		dropDetail = 0;
	</script>
</c:if>
<c:if test="${empty requestScope.checkLoc}">
	<script src="${root}/resources/js/mail/detail.js"></script>
</c:if>
<c:if test="${!empty requestScope.checkLoc}">
	<script src="${root}/resources/js/mail/draft_detail.js"></script>
</c:if>
<script src="${root}/resources/js/mail/star.js"></script>


<c:if test="${!empty dropDetail}">
	<script>
		let dropMailNo = '${dropDetail}';
		detailView();
	</script>
</c:if>
<c:if test="${!empty mailNick}">
	<script>
		let mailNick = '${mailNick}';
		writeFromAddr();
	</script>
</c:if>

