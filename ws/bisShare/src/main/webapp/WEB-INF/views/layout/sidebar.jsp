<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />  

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}/main">
        <div class="sidebar-brand-icon">
            <img style="width:40px; height: 40px;" alt="비즈쉐어" src="${root}/resources/img/logo.png">
        </div>
        <div class="sidebar-brand-text mx-3" style="margin-left:4px !important;">BISSHARE</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-chalkboard"></i>
            <span>게시판</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${root}/notice/list/1">공지사항</a>
                <a class="collapse-item" href="${root}/free/list/1">자유게시판</a>
                <a class="collapse-item" href="${root}/blind/list/1">블라인드게시판</a>
                <a class="collapse-item" href="${root}/cloud/list/1">자료실</a>
                <a class="collapse-item" href="${root}/notice/scrapList">스크랩 목록</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="${root}/mail/receive">
            <i class="fas fa-fw fa-mail-bulk"></i>
            <span>메일</span>
        </a>
        <%-- <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${root}/mail/receive">메일</a>
                <a class="collapse-item" href="${root}/mail/draft">임시 보관함</a>
            </div>
        </div> --%>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-clipboard fa-fw"></i>
            <!-- Counter - Messages -->
            <span>전자결재</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${root}/approval/my">나의 기안서</a>
                <a class="collapse-item" href="${root}/approval/write">기안서 작성</a>
                <a class="collapse-item" href="${root}/approval/document">
                    나의결재함
                </a>
            </div>
        </div>
    </li>
    
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
            aria-expanded="true" aria-controls="collapseThree">
            <i class="fas fa-fw fa-calendar"></i>
            <span>일정</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${root}/calendar/main">나의 일정</a>
                <a class="collapse-item" href="${root}/calendar/write">일정 작성</a>
                <a class="collapse-item" href="${root}/calendar/starview/1">중요 일정</a>
                <a class="collapse-item" href="${root}/calendar/view/1">일정 조회</a>
            </div>
        </div>
    </li>
    
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsefour"
            aria-expanded="true" aria-controls="collapsefour">
            <i class="fas fa-fw fa-address-book"></i>
            <span>주소록</span>
        </a>
        <div id="collapsefour" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${root}/address/list/1">조직도</a> 
                <a class="collapse-item" href="${root}/address/search/1">주소록 검색</a>
            </div>
        </div>
    </li>

    <!-- 나중에 관리자일때만 뜨게 해야함 -->
    <!-- 관리자 (인사과 일 때) -->
    <c:if test="${ loginVo.deptNo eq '1' }">
	    <hr class="sidebar-divider d-none d-md-block">
	    <li class="nav-item">
	        <a class="nav-link" href="${root}/admin/list">
	            <i class="fas fa-fw fa-address-book"></i>
	            <span>사원관리</span></a>
	    </li>
    </c:if>
    
    
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
<!-- End of Sidebar -->


<!-- 내가 결재 안한 / 확인 안한 결재문서 조회 -->
<!-- <script type="text/javascript">
	$(document).ready(()=>{
		$.ajax({
            url : "${root}/approval/nonReadCount"
            , type : "post"
            , success : (result) => {
                if(result > 0){
                } else{
                }
            }
            , error : ()=>{
                alert('연결실패');
            }
        })
	});
</script> -->
