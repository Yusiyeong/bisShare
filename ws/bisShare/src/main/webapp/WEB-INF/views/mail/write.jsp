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
					<input type="email" class="form-control" id="exampleInputEmail"
						aria-describedby="emailHelp" placeholder="받는 사람">
				</div>
				<div class="form-group">
					<div class="text-truncate align-">참조</div>
					<input type="email" class="form-control" id="exampleInputEmail"
						aria-describedby="emailHelp" placeholder="참조">
				</div>
				<div class="form-group">
					<div class="text-truncate align-">제목</div>
					<input type="text" class="form-control" id="exampleInputEmail"
						aria-describedby="emailHelp" placeholder="제목">
				</div>
				<div class="form-group">
					<div class="text-truncate align-">파일 첨부</div>
					<input type="file" class="form-control">
				</div>
				<div class="form-group">
					<textarea class="form-control" placeholder="내용" rows="20"></textarea>
				</div>


				<a href="index.html" class="btn btn-primary btn-user btn-block">
					전송 </a>
			</form>
		</div>
	</div>
</div>

