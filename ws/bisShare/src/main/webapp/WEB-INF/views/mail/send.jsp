<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="${root}/resources/css/asdf.css">	
</head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Email</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">보낸 메일함</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="checkAll" onclick="selectAll(this)"></input>
								<button href="#" class="btn btn-danger btn-icon-split">
									<span class="icon text-white-50">
										<i class="fas fa-trash"></i>
									</span>
								</button>
							</th>
							<th>번호</th>
							<th>중요</th>
							<th>메일명</th>
							<th>발신인</th>
							<th>시간</th>
						</tr>
					</thead>
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
</div>

<script src="../resources/js/mail/datatables.js"></script>