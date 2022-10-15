<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="user" id="mail-detail">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<button class="btn btn-danger ml-2 mr-5">삭제하기</button>
		<button class="btn btn-success mx-2">답장하기</button>
		<button class="btn btn-primary mx-2">전달하기</button>
	</nav>
	<div class="form-group">
		<div class="text-truncate align-">보낸 사람</div>
		<div id="detail-send">exam@gggg.com</div>
	</div>
	<div class="form-group">
		<div class="text-truncate align-">참조</div>
		<div id="detail-ref"></div>
	</div>
	<div class="form-group">
		<div class="text-truncate align-">제목</div>
		<div id="detail-title">제목</div>
	</div>
	<div class="form-group">
		<div class="text-truncate align-">내용</div>
		<div id="detail-content">content</div>
	</div>
	<div class="form-group">
		<div class="text-truncate align-">첨부된 파일</div>
		<input type="file" class="form-control">
	</div>
</div>