<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="user" id="mail-detail">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<button class="btn btn-danger ml-2 mr-5" onclick="removeOneBtn()" id="navTrash">삭제하기</button>
		<button class="btn btn-success mx-2" onclick="replyBtn()" id="navReply">답장하기</button>
		<button class="btn btn-primary mx-2" onclick="passBtn()" id="navPass">전달하기</button>
	</nav>
	<div class="my-1 border border-secondary border-5 rounded-2 p-1">
		<span class="font-weight-bolder mx-5" id="detail-name">발신</span>
		<span id="detail-send"></span>
	</div>
	<div class="my-1 border border-secondary border-5 rounded-2 p-1">
		<span class="font-weight-bolder mx-5">참조</span>
		<span id="detail-ref"></span>
	</div>
	<div class="my-1 border border-secondary border-5 rounded-2 p-1">
		<span class="font-weight-bolder mx-5">제목</span>
		<span id="detail-title"></span>
	</div>
	<div class="my-1 border border-secondary border-5 rounded-2 p-1">
		<div class="font-weight-bolder mx-5 mb-1">내용</div>
		<span id="detail-content" class="px-3"></span>
	</div>
	<div class="my-1  border border-secondary border-5 rounded-2 p-1" id="receivedFiles">
		<div class="font-weight-bolder ml-5">첨부된 파일</div>
	</div>
</div>