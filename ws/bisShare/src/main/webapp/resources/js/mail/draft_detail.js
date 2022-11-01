  // 상세보기
  $('#dataTable tbody').on('click','tr td:nth-child(2)', function() {
    const data = table.row(this).data();
    // 읽으면 글씨체 얇게
    $(this).removeClass("font-weight-bolder");
    // 파일 중복해서 추가되는거 방지
    document.querySelector('#receivedFiles').innerHTML = "";
    document.querySelector('#detail-send').innerHTML = "";
    document.querySelector('#detail-ref').innerHTML = "";
    document.querySelector('#detail-title').innerHTML = "";
    document.querySelector('#detail-content').innerHTML = "";
    // 데이터 가져오기
    $.ajax({
      type: "post",
      url: `${root}/mail/draftDetail`,
      data: {
        // input태그 가져와서 value만 추출
        mailNo : data[0].replace(numFilter,"")
      },
      dataType : "json",
      success: function (list) {
        let mailVo;
        if (refCheck == 3) {
          mailVo = list[0];
        } else {
          mailVo = list;
        }
        // 상세보기 삭제를 위한 mailNo 넘겨주기
        oneNo = mailVo.mailNo;
        // 데이터 넣어주기
        document.querySelector('#detail-name').innerHTML = '받는 사람';
        document.querySelector('#detail-send').innerHTML = mailVo.receive;
        if (mailVo.reference != null) {
          document.querySelector('#detail-ref').innerHTML = mailVo.reference;
        }
        document.querySelector('#detail-title').innerHTML = mailVo.title;
        document.querySelector('#detail-content').innerHTML = mailVo.content;
        // 파일이 하나 이상일때 표시
        console.log(mailVo);
        if( mailVo.mavList != null) {
          document.querySelector('#receivedFiles').style.display = 'block';
          for(let x of mailVo.mavList) {
            const files = document.querySelector('#receivedFiles');
            const htmlTag = `
            <button type="button" class="btn btn-primary" onclick="location.href='${root}/mail/download/${x.name}/${x.originName}'">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-arrow-down"
                viewBox="0 0 16 16">
                <path
                  d="M8 5a.5.5 0 0 1 .5.5v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 1 1 .708-.708L7.5 9.293V5.5A.5.5 0 0 1 8 5z">
                </path>
                <path
                  d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z">
                </path>
              </svg>
              ${x.originName}
            </button>
            `

            files.innerHTML += htmlTag;
          }
        } else {
          // 아니면 보이지 않기
          document.querySelector('#receivedFiles').style.display = 'none';
        }
      }
    });



    mailWrite.style.display = 'none';
    mailDetail.style.display = 'block';


    // 안읽은 메일 수 업데이트
    setTimeout(updateCnt,100);
  });

  function updateCnt() {
    $.ajax({
      type: "get",
      url: `${root}/mail/updateCnt`,
      success: function (response) {
        document.querySelector('#notReadCnt').innerHTML = response;
      }
    });
  }