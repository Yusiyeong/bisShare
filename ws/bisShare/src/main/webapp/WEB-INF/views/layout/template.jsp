<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />    

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title}</title>
    
    <!-- 로그인 안한 사람 접근 금지 -->
	<c:if test="${ loginVo eq null }">
		<script>
			alert('로그인을 해주십시오.');
			location.href = '${root}/';
		</script>
	</c:if>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Custom fonts for this template-->
    <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- 데이터 테이블 css -->
    <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
	<!-- Bootstrap core JavaScript-->
    <script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Core plugin JavaScript-->
    <script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<!-- include summernote css/js (기존)-->
	<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet"> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script> --> 
	<!-- 변경 후 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	
	<!-- include summernote-ko-KR -->
	<script src="/resources/js/board/summernote-ko-KR.js"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	
   	<!-- include libraries(jQuery, bootstrap) -->
   	<!-- 겹치는 부분 (일단 주석 / 10.10) -->
<!-- 	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
		

	
</head>

<body id="page-top">
	
    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>
	
	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
	
    			<jsp:include page="topbar.jsp"></jsp:include>
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
			        <jsp:include page="../${page}.jsp"></jsp:include>
                </div>
                
            </div>
            <!-- End of Main Content -->
	
			<jsp:include page="footer.jsp"></jsp:include>
			                             
	    </div>
	    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    
    <!-- 사이드바 토글 모든페이지에서 작동 js -->
    <script src="${root}/resources/js/sb-admin-2.min.js"></script>

<%--     <!-- 데이터 테이블 js -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level plugins -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${root}/resources/js/demo/datatables-demo.js"></script> --%>
    
</body>
</html>