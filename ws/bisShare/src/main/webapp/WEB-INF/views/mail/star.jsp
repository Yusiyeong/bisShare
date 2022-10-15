<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Email</h1>
	<div class="row">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">중요 메일함</h6>
			</div>
			<div class="card-body">
				<jsp:include page="mail-nav.jsp"></jsp:include>
				<div class="table-responsive">
					<table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>중요</th>
								<th>메일명</th>
								<th>발신인</th>
								<th>시간</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th><input type="checkbox"></th>
								<th>번호</th>
								<th>중요</th>
								<th>메일명</th>
								<th>발신인</th>
								<th>시간</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29 11:00</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>2</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29 12:00</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>3</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/30 13:00</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>4</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>5</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>6</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>7</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>8</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>9</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>10</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>11</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>12</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>13</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>14</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>15</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>16</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>17</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>18</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>19</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>20</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>21</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>22</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>23</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>24</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>25</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>26</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>27</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>28</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>29</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>30</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>31</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>32</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>33</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>34</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>35</td>
								<td>★</td>
								<td>메일명입니다</td>
								<td>민동언</td>
								<td>2022/09/29</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 기본 -->
		<div class="col-xl-6 col-lg-6">
			<div class="card shadow mb-4 border-left-primary">
				<div class="card-header py-3">
	        		<h6 class="m-0 font-weight-bold text-primary" >메일 보기 / 작성</h6>
	    		</div>
				<div class="card-body" id="right-show">
					<!-- 메일 작성 -->
					<form class="user" id="mail-write">
						<div class="form-group">
							<div class="text-truncate align-">받는 사람</div>
							<input type="email" class="form-control" id="exampleInputEmail" name="received"
								aria-describedby="emailHelp" placeholder="받는 사람">
						</div>
						<div class="form-group">
							<div class="text-truncate align-">참조</div>
							<input type="email" class="form-control" id="exampleInputEmail" name="ref"
								aria-describedby="emailHelp" placeholder="참조">
						</div>
						<div class="form-group">
							<div class="text-truncate align-">제목</div>
							<input class="form-control"
								aria-describedby="emailHelp" placeholder="제목">
						</div>
						<div class="form-group custom-file mb-3">
							<input type="file" class="form-control custom-file-input" id="customFile">
							<label class="custom-file-label" for="customFile">파일선택</label>
						</div>
						
						<div class="form-group">
							<textarea id="mail-content" name="content"></textarea>
						</div>
		
		
						<a href="index.html" class="btn btn-primary btn-user btn-block">
							전송 </a>
					</form>

					<!-- 메일 상세보기 -->
					<div class="user" id="mail-detail">
						<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
							<button class="btn btn-danger ml-2 mr-5">삭제하기</button>
							<button class="btn btn-success mx-2">답장하기</button>
							<button class="btn btn-primary mx-2">전달하기</button>
						</nav>
						<div class="form-group">
							<div class="text-truncate align-">받는 사람</div>
							<div>exam@gggg.com</div>
						</div>
						<div class="form-group">
							<div class="text-truncate align-">참조</div>
							<div>참조</div>
						</div>
						<div class="form-group">
							<div class="text-truncate align-">제목</div>
							<div>제목</div>
						</div>
						<div class="form-group">
							<div class="text-truncate align-">내용</div>
							<div>content</div>
						</div>
						<div class="form-group">
							<div class="text-truncate align-">첨부된 파일</div>
							<input type="file" class="form-control">
						</div>
					</div>

				</div>
			</div>
		</div>
	</div> <!-- 왼쪽 -->




</div>

<script src="../resources/js/mail/datatables.js"></script>
<script src="../resources/js/mail/mail-nav.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="${root}/resources/js/mail/write.js"></script>
