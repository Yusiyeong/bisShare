<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>


	<!-- Page Heading -->
 	<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css"> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
    
	<style>
	  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
	  .fc-header-toolbar {
	    padding-top: 1em;
	    padding-left: 1em;
	    padding-right: 1em;
	  }

      #cate{
        margin-top: 10px;
        margin-bottom: 10px;
      }
      #select{
        width: 100%;
        height: 35px;
        border:1px solid rgb(209, 209, 209);
      }
      .modal-title{
        font-size: 30px;
      }
      #center-bot1, #center-bot2{
      	margin: 10px;
      	width: 100px;
      }
      
      #center-bot2{
      	margin-right:120px;
      }
      

      
	</style>

    <!-- Modal -->
    <div class="modal fade" id="calendarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <form class="modal-content" method="post">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">일정추가</h1>
            </div>
            <div class="modal-body">
            일정 제목
            <input type="text" class="form-control" id="title" name="title">
                <div id="cate">
                    카테고리  
                    <br>
                    <select name="cateNo" id="select" class="form-select form-select-sm" aria-label=".form-select-sm example">
                        <option value="5" selected>기타</option>
                        <option value="1">회의</option>
                        <option value="2">휴가</option>
                        <option value="3">반차</option>
                        <option value="4">외근</option>
                      </select>
                </div>
                내용
                <input type="text" class="form-control" id="detail" name="content">
            </div>
            <div class="modal-footer">
			<div id="center-bot1" ><input class="btn btn-primary btn-user btn-block" type="submit" value="작성하기"></div>
			<div id="center-bot2" ><input class="btn btn-primary btn-user btn-block" type="" value="취소하기"></div>
            </div>
        </form>
        </div>
    </div>

	<!-- calendar 태그 -->
    <div id='calendar'></div>

    <script>

        $(document).ready(function() {
            $('#calendar').fullCalendar({
                header : {
                    left : 'prev, next today',
                    center: 'title', 
                    right : 'month, agendaWeek, agendaDay',   
                }, 
                selectable: true,
                selectHelper: true,
                select: function(start, end, allDays){
                    $('#calendarModal').modal('toggle');

                    $('#saveBtn').click(function(){
                        var title = $('#title').val();
                        var select = $('#select').val();
                        var detail = $('#detail').val();
                        var start_date = moment(start).format('MM/dd/yyyy');
                        var end_date = moment(end).format('MM/dd/yyyy');

                        console.log(title);
                        console.log(select);
                        console.log(detail);
                        console.log(start_date);
                        console.log(end_date); //end_date strat_date+1 되는 현상 고쳐야함

                        $.ajax({
                            url:"${root}/calendar/controller/CalendarController.java", //여기는 spring oracle에 맞게 url 변경 필요
                            type:"POST", 
                            dataType:'json', 
                            data:{title, select, detail, start_date, end_date}, 
                            success:function(response)
                            {
                                $('#calendarModal').modal('hide')
                                $('#calendar').fullCalendar('renderEvent', {
                                    'title': response.title,
                                    'select': response.select,
                                    'detail': response.detail,
                                    'start': response.start,
                                    'end': response.end,
                                    'color': response.color
                                    
                                });
                                alert("일정 등록 완료");
                            },
                            error:function(error)
                            {
                                if(error.responseJSON.errors){
                                    $('titleError').html(error.responseJSON.errors.title);
                                }
                            }
                        })
                    })
                }      
            })
            calendar.render();
        });

    </script>
    
    <!-- <script>
        window.onload = function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth' ,
            selectable: true,
            select: function(arg) { 
                var title = prompt('일정의 제목을 입력하세요:');
                if (title) { 
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    })
                }
                calendar.unselect()
            }
            });
            calendar.render();
        }

    </script> -->


