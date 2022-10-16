<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="user" id="mail-detail">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<button class="btn btn-danger ml-2 mr-5">삭제하기</button>
		<button class="btn btn-success mx-2">답장하기</button>
		<button class="btn btn-primary mx-2">전달하기</button>
	</nav>
	<div class="my-1 form-control">
		<span class="text-truncate align- font-weight-bolder mr-lg-5">발신</span>
		<span id="detail-send"></span>
	</div>
	<div class="my-1 form-control">
		<span class="text-truncate align- font-weight-bolder mr-5">참조</span>
		<span id="detail-ref"></span>
	</div>
	<div class="my-1 form-control">
		<span class="text-truncate align- font-weight-bolder mr-5">제목</span>
		<span id="detail-title"></span>
	</div>
	<div class="my-1">
		<div class="text-truncate align- font-weight-bolder form-label">내용</div>
		<div id="detail-content" class="form-control"></div>
	</div>
	<div class="my-1 form-control">
		
	</div>
	<div class="my-1 form-control">
		<div class="text-truncate align- font-weight-bolder">첨부된 파일</div>
		<input type="file">
	</div>
</div>