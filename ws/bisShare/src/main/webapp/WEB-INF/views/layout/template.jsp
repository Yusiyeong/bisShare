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
    


    <!-- Custom fonts for this template-->
    <link href="${root}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- 데이터 테이블 css -->
    <link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${root}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Custom styles for this page -->
	<link href="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<!-- Bootstrap core JavaScript-->
    <script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Core plugin JavaScript-->
    <script src="${root}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="${root}/resources/js/sb-admin-2.min.js"></script>
	
	<!-- 데이터 테이블 js -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
   	<!-- include libraries(jQuery, bootstrap) -->
<!-- 	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/js/board/summernote-ko-KR.js"></script>
		

	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

	<jsp:include page="sidebar.jsp"></jsp:include>

	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">

	<jsp:include page="topbar.jsp"></jsp:include>
	
	<jsp:include page="../${page}.jsp"></jsp:include>
	
	<jsp:include page="footer.jsp"></jsp:include>                             

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>
</html>