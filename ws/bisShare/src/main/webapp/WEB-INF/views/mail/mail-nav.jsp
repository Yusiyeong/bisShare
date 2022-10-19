<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginVo}">
	<script>
		/** 
		 * 회원 등록되면 진행하기
		 */
		alert('${loginVo}')
		alert('로그인 후 이용 가능한 서비스 입니다.');
		location.href = root;
	</script>
</c:if>

<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<input type="checkbox" id="checkAll" class="mr-1"
		onclick="selectAll(this)"></input>
	<button class="btn btn-danger mx-2">
		<span class="icon text-white-50"> <i class="fas fa-trash"></i>
		</span>
	</button>
	<button class="btn btn-success mx-2" id="mail-send-btn">메일 작성</button>
	<button class="btn btn-primary mx-2" onclick="location.href=root+'/mail/receive';">
		받은 메일
		<span class="badge badge-danger badge-counter" id="notReadCnt">${notReadCnt}</span>
	</button>
	<button class="btn btn-primary mx-2">보낸 메일</button>
	<button class="btn btn-warning mx-2" onclick="location.href=root+'/mail/important';">중요 메일</button>
	<button class="btn btn-primary mx-2">참조된 메일</button>
</nav>