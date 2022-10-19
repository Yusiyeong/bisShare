  // 상세보기
  $('#dataTable tbody').on('click','tr td:nth-child(4)', function() {
    const data = table.row(this).data();
    let refCheck;
    if (location.href.includes('reference')) {
      refCheck = 1;
    } else if (location.href.includes('receive')) {
      refCheck = 0;
    }
    let numFilter = /[^0-9]/g;
    console.log(data[0].replace(numFilter,""));
    $(this).removeClass("font-weight-bolder");
    let notReadCnt = document.querySelector('#notReadCnt').innerHTML;
    if (notReadCnt > 0) document.querySelector('#notReadCnt').innerHTML = notReadCnt-1;
    document.querySelector('#receivedFiles').innerHTML = "";
    $.ajax({
      type: "post",
      url: `${root}/mail/detail/${refCheck}`,
      data: {
        mailNo : data[0].replace(numFilter,""),
        receive : data[4]
      },
      dataType : "json",
      success: function (mailVo) {
        oneNo = mailVo.mailNo;
        document.querySelector('#detail-send').innerHTML = mailVo.send;
        if (mailVo.reference != null) {
          document.querySelector('#detail-ref').innerHTML = mailVo.reference;
        }
        document.querySelector('#detail-title').innerHTML = mailVo.title;
        document.querySelector('#detail-content').innerHTML = mailVo.content;
        if(mailVo.mavList.length>0) {
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
          document.querySelector('#receivedFiles').style.display = 'none';
        }
      }
    });

    mailWrite.style.display = 'none';
    mailDetail.style.display = 'block';
  });
