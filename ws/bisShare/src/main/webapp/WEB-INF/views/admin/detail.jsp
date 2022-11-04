<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- alert 띄우기 위함 -->
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
<c:remove var="alertMsg" scope="session"/>

<c:if test="${not empty alertMsg}">
 <script>
    alert('${alertMsg}');
 </script>
</c:if>


<!-- Begin Page Content -->
<div class="container-fluid">
   <!-- DataTales Example Start-->
   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">보기/편집</h6>
      </div>
      
      <div class="card-body">
       <!--form start-->
         <form action="" method="post" enctype="multipart/form-data">
         
         <!--취소, 수정 퇴직 버튼start-->
         <div style="margin-bottom: 15px;">
            <!-- 목록 -->
            <a href="${root}/admin/list" class="btn btn-outline-secondary btn-sm">목록으로</a> 
            
            <c:if test="${! not empty vo.quitDate}">  <!-- 퇴사한 사람이면 수정, 퇴직처리 버튼 안보이도록 -->
	            <!-- 수정 -->
	            <input type="submit" class="btn btn-outline-primary btn-sm" value="수정하기">
	            <!-- 퇴직처리 -->
	            <input type="button" class="btn btn-outline-danger btn-sm" onclick="quit();" value="퇴직처리">
            </c:if>
         </div>
         <!--취소, 수정 퇴직 버튼end-->
                     
         <!--start-->
         <div class="">
            <div class="row row-cols-2">
              <div class="col">
                  <!--프로필사진start-->
                  <div class="card" style="height: 337px;">
                     <div class="card-body">
                        <h5>프로필 사진</h5>
                        <hr>

                        <!--프로필사진 내부start-->
                        <div style="font-size: 13px; margin-bottom: 5px;">사진은 가로 100px, 세로 100px이상을 권장 합니다.</div>

                        <div>
                           <input hidden type="file" name="profile">
                        </div>
                     
                        <div id="profile-tumb" style="margin-top: 10px;">
                           <img id="profile-img-thumb" src="${root}/resources/profile/${vo.profilePath}" width="170px" height="170px">
                        </div>
                        <!--프로필사진 내부end-->

                     </div>
                  </div>
                  <!--프로필사진end-->
              </div>


              <div class="col">
                  <!--회사start-->
                  <div class="card" style="margin-bottom: 15px;">
                     <div class="card-body">

                        <h5>회사 정보</h5>
                        <hr>
                        <!--회사내부start-->
                        <div class="row">
                           <div class="col">
                              <label class="visually" for="autoSizingSelect">회사명</label>
                              <input type="text" class="form-control" value="${vo.companyNo}" readonly>
                           </div>
                        </div>

                  <div class="row" style="margin-top: 15px;">
                     <div class="col">
                        <label class="visually" for="autoSizingSelect">회사 주소</label>
                        <input type="text" class="form-control" value="${vo.companyAdr}" readonly>
                     </div>
                  </div>

                        <div class="row" style="margin-top: 15px;">
                           <div class="col">
                              <label class="visually" for="autoSizingSelect">직급</label>
                              <select class="form-select form-control" id="rank" name="rankNo">
                                  <option value="${vo.rankNo}">${vo.rankNo}</option>
                                 <option value="1">사원</option>
                                 <option value="2">주임</option>
                                 <option value="3">대리</option>
                                 <option value="4">과장</option>
                                 <option value="5">차장</option>
                                 <option value="6">부장</option>
                                 <option value="7">이사</option>
                                 <option value="8">대표이사</option>
                              </select>
                           </div>
      
                           <div class="col">
                              <label class="visually" for="autoSizingSelect">부서</label>
                              <select class="form-select form-control" id="dept" name="deptNo">
                                  <option value="${vo.deptNo}">${vo.deptNo}</option>
                                  <option value="0">임원</option>
                                 <option value="1">인사</option>
                                 <option value="2">개발</option>
                                 <option value="3">영업</option>
                                 <option value="4">경영</option>
                              </select>
                           </div>
                        </div>
                        
                        <!--회사내부end-->
                     </div>
                  </div>
                  <!--회사end-->
              </div>



            </div>

            <div class="col">
                     <!--사원정보start-->
                     <div class="card" style="margin-bottom: 15px;">
                        <div class="card-body">
                        
                           <h5>사원 정보</h5>
                           <hr>
                  
                           <!--사원정보 내부start-->      
                           <div class="row">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">아이디</label>
                                 <input type="text" class="form-control" name="id" value="${vo.id}" placeholder="아이디를 입력하세요." readonly>
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">닉네임</label>
                                 <input type="text" class="form-control" value="${vo.nick}" placeholder="닉네임 입력하세요." readonly>
                              </div>

                       <div class="col">
                                 <label class="visually" for="autoSizingSelect">비밀번호</label>
                                 <input type="text" class="form-control" placeholder="본인만 확인 가능합니다." readonly>
                              </div>
                              
                           </div>
                        
                        <!--사원정보 내부end-->
                        <!--사원정보 내부start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">주민번호</label>
                                 <input type="text" class="form-control" value="${vo.ssNo}" placeholder="숫자만 입력하세요." readonly>
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">이메일</label>
                                 <input type="email" class="form-control" value="${vo.email}" placeholder="이메일을 입력하세요." readonly>
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">연락처</label>
                                 <input type="tel" class="form-control" value="${vo.phone}" placeholder="숫자만 입력하세요." readonly>
                              </div>

                           </div>
                        
                        <!--사원정보 내부end-->
                           <!--사원정보 내부start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">연봉</label>
                                 <input type="text" class="form-control" value="${vo.salary}" placeholder="숫자만 입력하세요." readonly>
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">입사일</label>
                                 <input type="text" class="form-control" value="${vo.hireDate}" readonly>
                              </div>
                              
                              <c:if test="${! empty vo.quitDate}">  
	                               <div class="col">
	                                 <label class="visually" for="autoSizingSelect">퇴사일</label>
	                                 <input type="text" class="form-control" value="${vo.quitDate}" readonly>
	                               </div>
							   </c:if>
							   
                           </div>
                        <!--사원정보 내부end-->
                        
                          <!--주소2 start-->
                           <div class="row" style="margin-top: 15px;">
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">주소</label>
                                 <input type="text" class="form-control" value="${vo.address}" id="sample6_detailAddress" placeholder="상세주소" readonly>
                              </div>
                           </div>
                        <!--주소2 end-->
                        
                        </div>
                     </div>
                     <!--사원정보end-->

            </div>

         </div>
         <!--end-->
         </form>
         <!--form end-->
      </div>

   </div>
  <!-- DataTales Example End-->
</div>
<!-- End Page Content -->

<script>
   // 사진 썸네일 미리보기 구현
   const fileInputTag = document.querySelector('input[name=profile]');
   
   // fileInputTag에 변화(onchange)가 생긴다면 함수가 실행 됨.
   fileInputTag.onchange = function(){

      const imgTag = document.querySelector('#profile-img-thumb');

      if(fileInputTag.files.length > 0){
         // 파일 선택 됨
         const fr = new FileReader();
         
         fr.onload = function(data){
            console.log(data);
            imgTag.src = data.target.result;
         }
         fr.readAsDataURL(fileInputTag.files[0]);     // 파일 읽기
      }else{
         imgTag.src = "";
      }

   }
</script>

<script>
// 퇴직처리 
function quit(){
   
     const userId  = document.querySelector('input[name=id]').value;

     $.ajax({
         url : "${root}/employee/quit",
         method : 'POST',
         data : {memberId : userId} ,   
         success : function(data){      
             
             if(data == 1){
                 // 퇴직처리 0 
                 alert(userId + '님 퇴직처리 되었습니다.');
                 location.reload();
             }else{
                // 퇴직처리 X 
                 alert('퇴직처리 불가');
             }
             

         },
         error : function(){
             alert('ajax 통신 실패');
         },
     });
     
   
}
</script>