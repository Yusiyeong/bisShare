	const pbtn = document.querySelector('#select-plus-btn');
    const mbtn = document.querySelector('#select-minus-btn');
    const cbtn = document.querySelector('#select-complete');

    const SEA = document.querySelector('#select-emp-area>#select-dept-list-area');
    const NSEA = document.querySelector('#non-select-emp-area>#select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        let checkbox = document.getElementsByClassName('non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                let addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 변경 non-added -> added
                $(checkbox[i]).attr('class','added');
                //select-area로 넘겨버리기
                $(SEA).append(addCont);
            }
        }
    })

    // 삭제 버튼 클릭 했을 때 이벤트
    mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        let checkbox = document.getElementsByClassName('added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                let addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(checkbox[i]).attr('class','non-added')
                //non-select-area로 넘기기
                $(NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(cbtn).click(()=>{
        //넘겨줄 배열
        let eNos = [];
        let eDepts = [];
        let eNames = [];
        let eRanks = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        for(let i = 0; i < 8; ++i){
            $('#approve-line-area').children().eq(i+1).children().remove('input');
            $('#approve-line-area').children().eq(i+1).children().eq(0).text('');
            $('#approve-line-area').children().eq(i+1).children().eq(2).text('');
        }
        $(".added+input[name='empNo']").each(function(i){
            eNos.push($(".added+input[name='empNo']").eq(i).attr("value"));
            eDepts.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(1).text());
            eRanks.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(2).text());
            eNames.push($(".added+input[name='empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#approve-line-area').children().eq(i+1).append("<input type='hidden' name='empNo' value='"+ eNos[i] +"'>");
            $('#approve-line-area').children().eq(i+1).children().eq(0).text(eRanks[i]);
            $('#approve-line-area').children().eq(i+1).children().eq(2).text(eNames[i]);
        });

        // 합의자랑 참조자에서 가려버리기
        
        let result = $('#ref-select-area #select-dept').val();
        let div = document.getElementsByClassName('ref-deptNo');
        for(let i = 0; i < div.length; ++i){
            if($(div[i]).val() != result){
                $(div[i]).parent().parent().hide();
                if(result=='all'){
                    $(div[i]).parent().parent().show();    
                }
            } else{
                $(div[i]).parent().parent().show();
            }
        }
        
    })
    
    
    
    //기안하기 버튼 눌럿을 때
    $('#submit-btn').click(()=>{
    	//결재 카테고리 가져오
		const categoryNo = $('select[name=categoryNo]').val();
        // 결재권자 가져오기
    	const aprverEmpNos_ = document.getElementsByClassName('added');
        let aprverEmpNos = "";
        let aprverStatus = "";
        for(let i = 0; i < aprverEmpNos_.length; ++i){
            if(i==0){
                aprverEmpNos += $(".added+input[name='empNo']").eq(i).attr("value");
	            aprverStatus += "N";
            } else{
                aprverEmpNos += "," + $(".added+input[name='empNo']").eq(i).attr("value");
                aprverStatus += ",N";
            }
        }
        //결재 상세내용(제목, 컨텐츠) 가져오기
        const adcName = $('input[name=adcName]').val();
        const adcContent = $('textarea[name=adcContent]').val();

        //합의자, 참조자 가져오기
        const agree_ = document.getElementsByClassName('agree-added');
        let agreeEmpNos = "";
        let agreeStatus = "";
        for(let i = 0; i < agree_.length; ++i){
            if(i==0){
                agreeEmpNos += $(".agree-added+input[name='agree-empNo']").eq(i).attr("value");
                agreeStatus += "N";
            } else{
                agreeEmpNos += "," + $(".agree-added+input[name='agree-empNo']").eq(i).attr("value");
                agreeStatus += ",N";
            }
        }
        const ref_ = document.getElementsByClassName('ref-added');
        let refEmpNos = "";
        let refStatus = "";
        for(let i = 0; i < ref_.length; ++i){
            if(i==0){
                refEmpNos += $(".ref-added+input[name='ref-empNo']").eq(i).attr("value");
                refStatus += "N";
            } else{
                refEmpNos += "," + $(".ref-added+input[name='ref-empNo']").eq(i).attr("value");
                refStatus += ",N";
            }
        }
        
        //결재 TABLE 에 삽입해줄 ajax
    	$.ajax({
    		url : "/bisShare/approval/write"
    		, type : "post"
    		, data : {
	    			categoryNo : categoryNo
	    			, adcName : adcName
	    			, adcContent : adcContent
    				, aprverEmpNo : aprverEmpNos
    				, aprverStatus : aprverStatus
		    		, agreeEmpNo : agreeEmpNos
		    		, agreeStatus : agreeStatus
		    		, refEmpNo : refEmpNos
		    		, refStatus : refStatus
    		}
    		, success : (result) => {
				if(result != null){
                    //결재 첨부파일 TABLE 에 삽입해줄 ajax
                    if(document.getElementsByClassName('fileNames').length != 0){
	                    let fileNames = document.getElementsByClassName('fileNames');
	                    let fileArr = [];
	                    for(let i = 0; i < fileNames.length; i++){
	                        fileArr.push($(fileNames[i]).val());
	                    }
	                    //결재 작성 성공 후 파일첨부 진행 -> 파일첨부까지 완료 -> 결재작성완료
	                    $.ajax({
	                        url : "/bisShare/approval/attach"
	                        , type : "post"
	                        , data : {
	                                fileNames : fileArr
	                                , adcNo : result
	                        }
	                        , success : (result) => {
	                            if(result != null){
	                                alert('결재작성 성공');
	                                location.href = '/bisShare/approval/detail/'+ result;
	                            } else{
	                                alert('파일첨부 실패')
	                            }
	                        }
	                        , error : ()=>{
	                            alert('파일첨부 연결실패');
	                        }
	                    })  
                    } else{
                    	alert('결재작성 성공');
                    	location.href = '/bisShare/approval/detail/'+ result;
                    }
                    
				} else{
					alert('결재 작성 실패')
				}
			}
    		, error : ()=>{
    			alert('연결실패');
    		}
    	})


        	
    	
    })
    
    


    const agree_pbtn = document.querySelector('#agree-select-plus-btn');
    const agree_mbtn = document.querySelector('#agree-select-minus-btn');
    const agree_cbtn = document.querySelector('#agree-select-complete');

    const agree_SEA = document.querySelector('#agree-select-emp-area>#agree-select-dept-list-area');
    const agree_NSEA = document.querySelector('#agree-non-select-emp-area>#agree-select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    agree_pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('agree-non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                const addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 미리 변경 non-added -> added
                $(checkbox[i]).attr('class','agree-added');
                //select-area로 넘겨버리기
                $(agree_SEA).append(addCont);
            }
        }
    })
    
    // 삭제 버튼 클릭 했을 때 이벤트
    agree_mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('agree-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                const addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(checkbox[i]).attr('class','agree-non-added');
                //non-select-area로 넘기기
                $(agree_NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(agree_cbtn).click(()=>{
        //넘겨줄 배열
        const eNos = [];
        const eNames = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        for(let i = 0; i < 8; ++i){
            $('#agree-line-area').children().eq(i+1).children().remove('input');
            $('#agree-line-area').children().eq(i+1).children().eq(0).text('');
        }
        $(".agree-added+input[name='agree-empNo']").each(function(i){
            eNos.push($(".agree-added+input[name='agree-empNo']").eq(i).attr("value"));
            eNames.push($(".agree-added+input[name='agree-empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#agree-line-area').children().eq(i+1).append("<input type='hidden' name='agree-empNo' value='"+ eNos[i] +"'>");
            $('#agree-line-area').children().eq(i+1).children().eq(0).text(eNames[i]);
        });

        
    })






    const ref_pbtn = document.querySelector('#ref-select-plus-btn');
    const ref_mbtn = document.querySelector('#ref-select-minus-btn');
    const ref_cbtn = document.querySelector('#ref-select-complete');

    const ref_SEA = document.querySelector('#ref-select-emp-area>#ref-select-dept-list-area');
    const ref_NSEA = document.querySelector('#ref-non-select-emp-area>#ref-select-dept-list-area');

    // 추가 버튼 클릭 했을 때 이벤트
    ref_pbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('ref-non-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                const addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 미리 변경 non-added -> added
                $(checkbox[i]).attr('class','ref-added');
                //select-area로 넘겨버리기
                $(ref_SEA).append(addCont);
            }
        }
    })

    // 삭제 버튼 클릭 했을 때 이벤트
    ref_mbtn.addEventListener('click',()=>{
        // 리스트에서 체크박스 변수 생성
        const checkbox = document.getElementsByClassName('ref-added');
        // 체크된 만큼 값 넘겨줄거
        for(let i = 0; i < checkbox.length; i++){
            if(checkbox[i].checked==true){
                let addCont = $(checkbox[i]).parent().parent();
                checkbox[i].checked = false;
                //옮겨질것 클래스 명 미리 변경 added -> non-added
                $(checkbox[i]).attr('class','ref-non-added');
                //non-select-area로 넘기기
                $(ref_NSEA).append(addCont);
            }
        }
    })
    
    
    
    //선택 다 하고 선택 완료 눌렀을 때
    $(ref_cbtn).click(()=>{
        //넘겨줄 배열
        const eNos = [];
        const eNames = [];
        //반복문 사용 -> 선택된 input에서 사원 번호만 가져옴
        for(let i = 0; i < 8; ++i){
            $('#ref-line-area').children().eq(i+1).children().remove('input');
            $('#ref-line-area').children().eq(i+1).children().eq(0).text('');
        }
        $(".ref-added+input[name='ref-empNo']").each(function(i){
            eNos.push($(".ref-added+input[name='ref-empNo']").eq(i).attr("value"));
            eNames.push($(".ref-added+input[name='ref-empNo']").eq(i).parent().parent().children().eq(3).text());
            $('#ref-line-area').children().eq(i+1).append("<input type='hidden' name='ref-empNo' value='"+ eNos[i] +"'>");
            $('#ref-line-area').children().eq(i+1).children().eq(0).text(eNames[i]);
        });
    })

    // 결재
    $('#aprv-select-area #select-dept').change(()=>{
        let result = $('#aprv-select-area #select-dept').val();
        let div = document.getElementsByClassName('aprv-deptNo');
        for(let i = 0; i < div.length; ++i){
            if($(div[i]).val() != result && $(div[i]).parent().children().first().attr('class')=='non-added'){
                $(div[i]).parent().parent().hide();
                if(result=='all'){
                    $(div[i]).parent().parent().show();    
                }
            } else{
                $(div[i]).parent().parent().show();
            }
        }
    });
    //합의
    $('#agree-select-area #select-dept').change(()=>{
        let result = $('#agree-select-area #select-dept').val();
        let div = document.getElementsByClassName('agree-deptNo');
        for(let i = 0; i < div.length; ++i){
            if($(div[i]).val() != result){
                $(div[i]).parent().parent().hide();
                if(result=='all'){
                    $(div[i]).parent().parent().show();    
                }
            } else{
                $(div[i]).parent().parent().show();
            }
        }
    });
    //참조
    $('#ref-select-area #select-dept').change(()=>{
        let result = $('#ref-select-area #select-dept').val();
        let div = document.getElementsByClassName('ref-deptNo');
        for(let i = 0; i < div.length; ++i){
            if($(div[i]).val() != result){
                $(div[i]).parent().parent().hide();
                if(result=='all'){
                    $(div[i]).parent().parent().show();    
                }
            } else{
                $(div[i]).parent().parent().show();
            }
        }
    });




    $('select[name=categoryNo]').change(()=>{
        let result = $('select[name=categoryNo]').val();
        let content = $('#summernote');
        if(result==1){
            $('#summernote').summernote('code', '<p><br></p><p>&lt; 휴가원 &gt;</p><table class="table table-bordered"><tbody><tr><td><b>휴가기간</b></td><td>0000년 00월 00일 00시 00분 ~ 0000년 00월 00일 00시 00분</td></tr><tr><td><span style="font-weight: bolder;">휴가종류</span><br></td><td>(반차,연차,병가,경조)<br></td></tr><tr><td><b>휴가사유</b></td><td><p>( 휴가 1일 전 까지 결재를 득하여 제출 하여 주시기 바랍니다.)</p></td></tr></tbody></table><p>위와 같이 휴가를 신청 하오니 재가 하여 주시기 바랍니다.</p>'); 
        }
        if(result==2){
            $('#summernote').summernote('code', '<p><br></p><p>&lt; 품의서 &gt;</p><table class="table table-bordered"><tbody><tr><td><p><b>품의 사유</b></p><p><b>및</b></p><p><b>상세 내역</b></p></td><td><p><br></p><p>(내용 상세히 작성 바랍니다.)</p></td></tr><tr><td><b>예상 비용</b></td><td>0000원</td></tr><tr><td><b>비고</b></td><td><p><br></p></td></tr></tbody></table><p>위와 같이 품의를 신청 하오니 재가 하여 주시기 바랍니다.</p>'); 
        }
        if(result==3){
            $('#summernote').summernote('code', '<p><br></p><p>&lt; 출장신청서 &gt;</p><table class="table table-bordered"><tbody><tr><td><b>출장기간</b></td><td>0000년 00월 00일 00시 00분 ~ 0000년 00월 00일 00시 00분</td></tr><tr><td><span style="font-weight: bolder;">출장지</span><br></td><td>경기도 00시 00동 00컴퍼니</td></tr><tr><td><b>출장자</b></td><td><p>00팀 000, 00팀 000</p></td></tr><tr><td><b>출장목적</b></td><td>(상세히 작성 할 것)</td></tr></tbody></table><p>위와 같이 출장을 신청 하오니 재가 하여 주시기 바랍니다.</p>');
        }
        if(result==4){
            $('#summernote').summernote('code', '<p><br></p><p>&lt; 연장근무 신청서 &gt;</p><table class="table table-bordered"><tbody><tr><td><b>근무 일시</b></td><td><p>0000년 00월 00일 00시 00분 ~ 0000년 00월 00일 00시 00분 </p><p>(총 0시간 0분)</p></td></tr><tr><td><b>근무 목적</b></td><td>(상세히 작성 할 것)</td></tr><tr><td><b>비고</b></td><td><br></td></tr></tbody></table><p>위와 같이 연장근무를 신청 하오니 재가 하여 주시기 바랍니다.</p>');
        }
    });

