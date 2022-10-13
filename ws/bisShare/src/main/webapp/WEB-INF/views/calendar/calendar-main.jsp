<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>


	<!-- Page Heading -->
 	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
		
    
	<style>
	  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
	  .fc-header-toolbar {
	    padding-top: 1em;
	    padding-left: 1em;
	    padding-right: 1em;
	  }
	</style>

	<!-- calendar 태그 -->
    <div id='calendar'></div>
    
    <script>
        window.onload = function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth' ,
            selectable: true,
            select: function(arg) { 
                var title = prompt('Event Title:');
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

    </script>


