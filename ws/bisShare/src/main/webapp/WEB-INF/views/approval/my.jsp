<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />   

<style>
	tbody>tr{
		cursor: pointer;
	}
</style>

   <!-- Page Heading -->
   <h1 class="h3 mb-2 text-gray-800">나의 기안서</h1>
   <p class="mb-4">${ loginVo.nick }님이 작성한 기안서 입니다.</p>

   <!-- DataTales Example -->
   <div class="card shadow mb-4">
       <div class="card-header py-3">
           <h6 class="m-0 font-weight-bold text-primary">결재함</h6>
       </div>
       <div class="card-body">
           <div class="table-responsive">
               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                       <tr>
                           <th>서식명</th>
                           <th>제목</th>
                           <th>진행상태</th>
                           <th>기안일</th>
                       </tr>
                   </thead>
                   <tbody>
                   	<c:forEach items="${aprvList}" var="l">
                        <tr>
                        	<input type="hidden" value="${ l.adcNo }"/>
                            <td>${ l.categoryNo }</td>
                            <td>${ l.adcName }</td>
                            <c:if test="${ l.progress ne '반려' }">
	                            <c:if test="${ l.progress eq '100' }">
			                    	<td style="color: blue; font-weight: 900;">결재 완료</td>
			                    </c:if>
			                    <c:if test="${ l.progress ne '100' }">
			                    	<td>${ l.progress }%</td>
			                    </c:if>
                            </c:if>
                            <c:if test="${ l.progress eq '반려' }">
                            	 <td style="color: red; font-weight: 900;">반려</td>
                            </c:if>
                            <td>${ l.enrollDate }</td>
                        </tr>
                   	</c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
   </div>
   
<script type="text/javascript">
	
   	$('tbody>tr').click(()=>{
        let dv = event.currentTarget;
   		const adcNo = $(dv).children().first().val();
   		location.href = "${root}/approval/detail/" + adcNo;
   	});
   
</script>
    
    <!-- 데이터 테이블 js -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level plugins -->
    <script src="${root}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${root}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${root}/resources/js/demo/datatables-demo.js"></script>