<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.List"%>
<%@page import="com.bs.calendar.vo.CalendarVo"%>

<!-- cdn -->
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<style>
	.fc-event-time{
		display: none;
	}
</style>

<!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정</h6>
              </div>
              
          		<div class="card-body">
				<!--start-->
				
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
							<div id="saveBtn" ><input class="btn btn-primary btn-user btn-block" type="submit" value="작성하기"></div>
							<div id="center-bot2" ><input class="btn btn-primary btn-user btn-block" type="" value="취소하기"></div>
				            </div>
				        </form>
				        </div>
				    </div>
				    <!-- Modal 끝 -->
				
					<div id='calendar'></div>
					
					<script>
						document.addEventListener('DOMContentLoaded', function() {
							var calendarEl = document.getElementById('calendar');
							var calendar = new FullCalendar.Calendar(calendarEl, {
								initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
								headerToolbar : { // 헤더에 표시할 툴 바
									start : 'prev next today',
									center : 'title',
									end : 'dayGridMonth,dayGridWeek,dayGridDay'
								},
								// titleFormat : function(date) {
								// 	return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
								// },
								// initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
								selectable : true, // 달력 일자 드래그 설정가능
								droppable : true,
								editable : true,
								locale: 'ko', // 한국어 설정
								eventDisplay:'block',


								//DB에서 List 불러오기
									events : [ 
							    	    <%List<CalendarVo> calendarList = (List<CalendarVo>) request.getAttribute("calendarList");%>
							            <%if (calendarList != null) {%>
							            <%for (CalendarVo cvo : calendarList) {%>
							            {
							            	title : '<%=cvo.getTitle()%>',
							                start : '<%=cvo.getStartDate()%>',
							                end : '<%=cvo.getEndDate()%>',
							                backgroundColor : '#03a' + Math.round(Math.random() * 0xfff).toString(16),
											borderColor : '#FFFFFF'
							             },
								<%}
							}%>
											]
							});
							calendar.render();
						});
						

/* 						$('.fc-event-title-container').on('click', function(){
							$('#calendarModal').modal('toggle');
						}) */
					</script>
					
<!-- 				    <script>
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

				<!--end-->
				</div>

		</div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->