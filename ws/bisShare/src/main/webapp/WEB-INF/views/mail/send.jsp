<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="${root}/resources/css/asdf.css">
</head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Email</h1>
	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">

		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">보낸 메일함</h6>
		</div>
		
		<div class="card-body">
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<input type="checkbox" id="checkAll" class="mr-1" onclick="selectAll(this)"></input>
				<button class="btn btn-danger mx-2">
					<span class="icon text-white-50">
						<i class="fas fa-trash"></i>
					</span>
				</button>
				<button class="btn btn-primary mx-2">메일 작성</button>
				<button class="btn btn-primary mx-2">내게 쓰기</button>
				
			</nav>
			<div class="">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
					<tbody>
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
</div>

<script src="../resources/js/mail/datatables.js"></script>