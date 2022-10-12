<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Email</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">메일 보기</h6>
		</div>
		<div class="card-body">
			<div class="user">
				<div class="form-group">
					<div class="text-truncate align-">받는 사람</div>
					<div>exam@gggg.com</div>
				</div>
				<div class="form-group">
					<div class="text-truncate align-">참조</div>
					<div>참조</div>
				</div>
				<div class="form-group">
					<div class="text-truncate align-">제목</div>
					<div>제목</div>
				</div>
				<div class="form-group">
					<div class="text-truncate align-">내용</div>
					<div>content</div>
				</div>
				<div class="form-group">
					<div class="text-truncate align-">첨부된 파일</div>
					<input type="file" class="form-control">
				</div>
			</div>
		</div>
	</div>
</div>