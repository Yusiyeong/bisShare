<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>



<!--달력-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
   // 달력
    $(function() {
       
        $("#datepicker, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
            ,showOtherMonths: true
            ,showMonthAfterYear:true 
            ,changeYear: true 
            ,changeMonth: true              
            ,yearSuffix: "년"
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
            ,dayNamesMin: ['일','월','화','수','목','금','토'] 
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
            ,minDate: "-5Y" 
            ,maxDate: "+5y"  
        });                    
        
        
        $('#datepicker').datepicker('setDate', 'today');            
    });
 </script>

<!--우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	// 우편번호
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- Begin Page Content -->
<div class="container-fluid">
   <!-- DataTales Example Start-->
   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary" >사원 등록</h6>
      </div>
      
      <div class="card-body">
         <!--form start-->
         <form action="${root}/employee/enroll" method="post" enctype="multipart/form-data" onsubmit="return check()";>
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
                           <input type="file" name="profile">
                        </div>
                     
                        <div id="profile-tumb" style="margin-top: 10px;">
                           <img id="profile-img-thumb" width="170px" height="170px">
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
                              <input type="text" value="비즈쉐어" class="form-control" readonly>
                              <input type="hidden" name="companyNo" value="1" class="form-control" readonly>
                           </div>
                        </div>

						<div class="row" style="margin-top: 15px;">
							<div class="col">
							   <label class="visually" for="autoSizingSelect">회사 주소</label>
							   <input type="text" value="서울" class="form-control" readonly>
							</div>
						</div>

                        <div class="row" style="margin-top: 15px;">
                           <div class="col">
                              <label class="visually" for="autoSizingSelect">직급</label>
                              <select name="rankNo" class="form-select form-control" id="autoSizingSelect">
                                 <option value="0" selected>임원</option>
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
                              <select name="deptNo" class="form-select form-control" id="autoSizingSelect">
                                 <option value="1" selected>인사</option>
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
                                 <input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요.">
                              </div>
                              
                              <div class="col" style="margin-top: 35px;">
								<input type="button" class="btn btn-outline-primary btn-sm" onclick="checkId();" value="중복확인">
								<input type="hidden" value="o" id="idDup">      
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">닉네임</label>
                                 <input type="text" name="nick" class="form-control" placeholder="닉네임 입력하세요.">
                              </div>

                              <div class="col" style="margin-top: 35px;">
								<input type="button" class="btn btn-outline-primary btn-sm" onclick="checkNick();" value="중복확인">
								<input type="hidden" value="o" id="nickDup">      
                              </div>
                              
                           </div>
                        
                        <!--사원정보 내부end-->
                              
                        <!--사원정보 내부start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">주민번호</label>
                                 <input type="text" name="ssNo" class="form-control" placeholder="숫자만 입력하세요.">
                              </div>
                              

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">연락처</label>
                                 <input type="tel" name="phone" class="form-control" placeholder="숫자만 입력하세요.">
                              </div>

 							  <div class="col">
		                            <label class="visually" for="autoSizingSelect">임시 비밀번호</label>
		                            <input type="text" name="pwd" class="form-control" placeholder="비밀번호를 입력하세요.">
	                          </div>
	                        
                           </div>
                        
                        <!--사원정보 내부end-->
                           <!--사원정보 내부start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">연봉</label>
                                 <input type="text" name="salary" class="form-control" placeholder="숫자만 입력하세요.">
                              </div>

                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">입사일</label>
                                 <input type="text" name="hireDate" class="form-control" id="datepicker">
                              </div>

                           </div>
                        <!--사원정보 내부end-->
                        <!--주소1 start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <label class="visually" for="autoSizingSelect">주소</label>
                                  	<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
                              </div>

                              <div class="col" style="margin-top: 35px;">
  									<input type="button" class="btn btn-outline-primary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                              </div>

                           </div>
                        
                        <!--주소1 end-->
                        
                          <!--주소2 start-->
                           
                           <div class="row" style="margin-top: 15px;">
                                 
                              <div class="col">
                                 <input type="text" class="form-control" id="sample6_address" placeholder="주소">
                              </div>

                              <div class="col">
                                 <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
                              </div>

                              <div class="col">
                                 <input type="text" name="address" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
                              </div>

                           </div>
                        
                        <!--주소2 end-->
                        
                        </div>
                     </div>
                     <!--사원정보end-->

                      <!--취소, 등록 버튼start-->
                     <div style="margin-bottom: 7px; float: right;">
                        <!-- 취소 -->
                        <a onclick="history.go(-1)" class="btn btn-outline-secondary btn-sm">취소</a> 
                        <!-- 등록 -->
                        <input type="submit" class="btn btn-outline-primary btn-sm" value="등록">
                     </div>
                     <!--취소, 등록 버튼end-->

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
function check(){
	
	// 아이디 중복확인 체크
    if(document.querySelector('#idDup').value == 'o'){
        alert('아이디 중복확인을 진행해주세요.');
        return false;
    }
	
	// 닉네임 중복확인 체크
    if(document.querySelector('#nickDup').value == 'o'){
        alert('닉네임 중복확인을 진행해주세요.');
        return false;
    }
    
    return true;
    
}
</script>

<script>
// 아이디 중복확인
function checkId(){
	
	 const idDup = document.querySelector('#idDup');
     const userId  = document.querySelector('input[name=id]').value;
     

     $.ajax({
         url : "${root}/employee/idDup",
         method : 'POST',
         data : {memberId : userId} ,	
         success : function(data){		
             
             if(data == 0){
                 // 중복X - 아이디 사용 가능
                 idDup.value = 'x';    
                 alert('사용 가능 한 아이디 입니다.');
             }else{
            	// 중복O - 아이디 사용 불가
                idDup.value = 'o';    
                alert('사용 불가 한 아이디 입니다.');
             }
             
         },
         error : function(){
             alert('ajax 통신 실패');
         },
     });
     
	
}
</script>

<script>
// 닉네임 중복확인
function checkNick(){
	
	 const nickDup = document.querySelector('#nickDup');
     const userNick  = document.querySelector('input[name=nick]').value;
     

     $.ajax({
         url : "${root}/employee/nickDup",
         method : 'POST',
         data : {memberNick : userNick} ,	
         success : function(data){		
             
             if(data == 0){
                 // 중복X - 닉네임 사용 가능
                 nickDup.value = 'x';    
                 alert('사용 가능 한 닉네임 입니다.');
             }else{
            	// 중복O - 닉네임 사용 불가
                nickDup.value = 'o';    
                alert('사용 불가 한 닉네임 입니다.');
             }
             
         },
         error : function(){
             alert('ajax 통신 실패');
         },
     });
     
	
}
</script>