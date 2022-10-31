<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive">
	<table class="table table-hover" id="dataTable" width="100%"
		cellspacing="0">
		<thead>
			<tr>
				<th></th>
				<th>메일명</th>
				<th>시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${receiveMail}" var="r">
				<tr>
					<td><input type="checkbox" value="${r.mailNo}"></td>
					<c:if test="${r.readYn eq 'N'}">
						<td class="font-weight-bolder">${r.title}</td>
					</c:if>
					<c:if test="${r.readYn eq 'Y'}">
						<td>${r.title}</td>
					</c:if>
					<c:if test="${empty r.readYn}">
						<td>${r.title}</td>
					</c:if>
					<td>${r.enrollDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>