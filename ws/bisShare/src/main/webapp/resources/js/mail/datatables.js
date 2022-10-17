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

    $.ajax({
      type: "get",
      url: `${root}/mail/detail`,
      data: {
        mailNo : data[1]
      },
      dataType : "json",
      success: function (mailVo) {
        document.querySelector('#detail-send').innerHTML = mailVo.send;
        if (mailVo.reference != 'N') {
          document.querySelector('#detail-ref').innerHTML = mailVo.reference;
        }
        document.querySelector('#detail-title').innerHTML = mailVo.title;
        document.querySelector('#detail-content').innerHTML = mailVo.content;
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