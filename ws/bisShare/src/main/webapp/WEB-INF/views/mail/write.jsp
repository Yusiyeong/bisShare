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
			<h6 class="m-0 font-weight-bold text-primary">메일 작성</h6>
		</div>
		<div class="card-body">
			<form class="user">
				<div class="form-group">
					<div class="text-truncate align-">받는 사람</div>
					<input type="email" class="form-control" id="exampleInputEmail" name="received"
						aria-describedby="emailHelp" placeholder="받는 사람">
				</div>
				<div class="form-group">
					<div class="text-truncate align-">참조</div>
					<input type="email" class="form-control" id="exampleInputEmail" name="ref"
						aria-describedby="emailHelp" placeholder="참조">
				</div>
				<div class="form-group">
					<div class="text-truncate align-">제목</div>
					<input class="form-control"
						aria-describedby="emailHelp" placeholder="제목">
				</div>
				<div class="form-group custom-file mb-3">
					<input type="file" class="form-control custom-file-input" id="customFile">
					<label class="custom-file-label" for="customFile">파일선택</label>
				</div>
				
				<div class="form-group">
					<textarea id="mail-content" name="content"></textarea>
				</div>


				<a href="index.html" class="btn btn-primary btn-user btn-block">
					전송 </a>
			</form>
		</div>
	</div>
</div>

<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="${root}/resources/js/mail/write.js"></script>



