<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<style>

    #page{
        width: 95%;
        height: 100%;
        margin: auto;
        background-color: white;
    }

    #title{
        margin-top: 30px;
        margin-left: 10%;
        border: none;
        width: 80%;
        height: 50px;
        resize: none;
        font-size: 30px;
        font-weight: 600;
    }
    textarea:focus {
        outline: none;
    }

    textarea::placeholder {
        color:rgb(189, 189, 189);
    }

    #select{
        width: 100px;
        height: 20px;
        font-size: 13px;
        margin-left: 50px;
        border: none;
    }

    #file-name{
        margin-left: 50px;
    }

    #create, #start, #end, .cate, #file{
        margin-left: 10%;
        margin-top: 10px;
        font-size: 15px;
    }

    .datepicker-start, .datepicker-end, #write{
        margin-left: 67px;
        height: 20px;
        border: none;
    }

    #line{
        margin-top: 20px;
        width: 80%;
    }

    #con{
        margin-left: 10%;
        width: 80%;
        height: 600px;
        border: none;
        height: 600px;
        resize: none;
    }

    #submit{
        margin: auto;
        width: 60px;
    }


</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정</h6>
              </div>
              
              <div class="card-body">
								<!--start-->
								<!-- Page Heading -->
							    <form action="" method="post">
							        <div id="page">
							            <div>
							                <textarea id="title" placeholder="제목 없음"></textarea>
							            </div>
							            <div id="create">
							                작성일 <input id="write" type="textarea">
							            </div>
							            <div class="cate">
							                카테고리  <select id="select" class="form-select form-select-sm" aria-label=".form-select-sm example">
													  <option selected>기타</option>
													  <option value="1">회의</option>
													  <option value="2">휴가</option>
													  <option value="3">반차</option>
													  <option value="4">외근</option>
													</select>
							            </div>
							            <div id="start">
							                시작일 <input class="datepicker-start">
							                <script>
							                  $(function(){
							                    $( ".datepicker-start" ).datepicker({ minDate: 0});
							                    $('.datepicker-start').datepicker('setDate', 'today');
							                  })
							                </script>
							            </div>
							            <div id="end">
							                종료일 <input class="datepicker-end">
							                <script>
							                  $(function(){
							                    $('.datepicker-end').datepicker({ minDate: 0});
							                    $('.datepicker-end').datepicker('setDate', 'today');
							                  })
							                </script>
							            </div>
							            <div id="file">
							                첨부파일 <input type="file" id="file-name">
							            </div>
							            <hr id="line">
							            <div>
							                <textarea id="con" placeholder="내용을 입력하세요"></textarea>
							            </div>
							            <a href="" id="" class="btn btn-primary btn-user btn-block">
							                수정하기 </a>
							            <a href="" id="" class="btn btn-primary btn-user btn-block">
							                삭제하기 </a>
							        </div>
							    </form>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->

	