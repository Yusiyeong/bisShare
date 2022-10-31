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


<!-- Begin Page Content -->
       <div class="container-fluid">
          <!-- DataTales Example Start-->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >일정</h6>
              </div>
              
          		<div class="card-body">
				<!--start-->
				
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
								nowIndicator: true, // 현재 시간 마크
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
							                backgroundColor : '#' + Math.round(Math.random() * 0xffffff).toString(16)
							             },
								<%}
							}%>
											]
							});
							calendar.render();
						});
					</script>

				<!--end-->
				</div>

		</div>
		<!-- DataTales Example End-->
	  </div>
<!-- End Page Content -->