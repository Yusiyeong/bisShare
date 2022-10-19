// Call the dataTables jQuery plugin
$(document).ready(function() {
  const table = $('#dataTable').DataTable({
        scrollCollapse: true,
        columnDefs: [ {
            orderable: false,
            className: 'select-checkbox',
            type : "numeric-comma",
            targets: 0
          } ,
          { targets : 0, width : 20},
          { targets : 1, width : 40},
          { targets : 2, width : 40},
          { targets : 4, width : 50},
          { targets : 5, width : 100}
        ],
        select: {
        style:    'os',
        },
        order: [[ 5, 'desc' ]]
  });

  $('#dataTable tbody tr').addClass('hover');


  // 상세보기
  $('#dataTable tbody').on('click','tr td:nth-child(4)', function() {
    const data = table.row(this).data();
    document.querySelector('#receivedFiles').innerHTML = "";
    $.ajax({
      type: "get",
      url: `${root}/mail/detail`,
      data: {
        mailNo : data[1]
      },
      dataType : "json",
      success: function (mailVo) {
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


// 중요 표시 별 on/off
  $('#dataTable tbody').on('click','tr td:nth-child(3)', function() {
    const data = table.row(this).data();
    const star = data[2];

    $.ajax({
      type: "get",
      url: `${root}/mail/checkStar`,
      data: {
        mailNo : data[1]
      },
      success: function (check) {
        location.reload();
      }
    });

  });


});