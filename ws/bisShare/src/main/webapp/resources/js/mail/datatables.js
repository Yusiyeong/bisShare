let oneNo;
const numFilter = /[^0-9]/g;
let refCheck = 0;
if (location.href.includes('reference')) {
  refCheck = 1;
  document.querySelector('#nick').innerHTML = '발신';
} else if (location.href.includes('receive')) {
  refCheck = 0;
  document.querySelector('#nick').innerHTML = '발신';
} else if (location.href.includes('send')) {
  refCheck = 2;
  document.querySelector('#nick').innerHTML = '수신';
} else if (location.href.includes('trashcan')) {
  refCheck = 3;
  document.querySelector('#nick').innerHTML = '발신';
} else if (location.href.includes('draft')) {
  refCheck = 4;
  document.querySelector('#nick').innerHTML = '임시';
} 

if(refCheck == 2) {
  document.querySelector('#navTrash').style.display = 'none';
}
if(refCheck == 3) {
  document.querySelector('#navReply').style.display = 'none';
  document.querySelector('#navPass').style.display = 'none';
}


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
        { targets : 2, width : 300}
      ],
      select: {
      style:    'os',
      },
      order: [[ 4, 'desc' ]]
});

$('#dataTable tbody tr').addClass('hover');



// 중요 표시 별 on/off
$('#dataTable tbody').on('click','tr td:nth-child(2)', function() {
  if(refCheck == 3) {
    alert('삭제된 메일은 불가능합니다.');
    return false;
  }
  const data = table.row(this).data();
  const star = data[1];
  $.ajax({
    type: "get",
    url: `${root}/mail/checkStar/${refCheck}`,
    data: {
      mailNo : data[0].replace(numFilter,"")
    },
    success: function (check) {
      location.reload();
    }
  });

});

