let oneNo;
const numFilter = /[^0-9]/g;
let refCheck;
if (location.href.includes('reference')) {
  refCheck = 1;
} else if (location.href.includes('receive')) {
  refCheck = 0;
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
        { targets : 4, width : 100}
      ],
      select: {
      style:    'os',
      },
      order: [[ 4, 'desc' ]]
});

$('#dataTable tbody tr').addClass('hover');



// 중요 표시 별 on/off
$('#dataTable tbody').on('click','tr td:nth-child(2)', function() {
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

