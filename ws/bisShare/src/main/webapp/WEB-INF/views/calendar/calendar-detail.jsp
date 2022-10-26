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
        height: 23px;
        font-size: 13px;
        border: none;
    }

    #file-name{
        margin-left: 50px;
    }

    #create, #start, #end, #cate, #file, #line{
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
    
    #edit, #delete{
        text-align: center;
        width: 100px;
    }

    #buttons{
        
        justify-content: center;
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
                                            <div id="title">${vo.title}</div>
							            </div>
							            <div id="create">
							                작성일 <div id="write">${vo.modifyDate}</div>
							            </div>
							            <div id="cate">
							                카테고리  <div id="select">${vo.cateNo}</div>
							            </div>
							            <div id="start">
							                시작일 <div class="datepicker-start">${vo.startDate}</div>
							            </div>
							            <div id="end">
							                종료일 <div class="datepicker-start">${vo.endDate}</div>
							            </div>
							            <hr id="line">
							            <div>
							                <div id="con">${vo.content}</div>
							            </div>
							            <c:if test="${ calvo.writer eq loginVo.nick }">
											<div id="center-bot">
												<a href="${root}/calendar/edit/${vo.calNo}">수정하기</a>
												<a href="${root}/calendar/delete/${vo.calNo}">삭제하기</a>
											</div>
										</c:if>
							        </div>
							    </form>
								<!--end-->
						  </div>

				  </div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->

	