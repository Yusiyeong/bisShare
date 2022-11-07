let oneNo;
const numFilter = /[^0-9]/g;

let order = 5;
let t1 = 40;
let t2 = 300;
if(refCheck == 4) {
  order = 2;
  t1 = 300;
  t2 = 200;
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
        { targets : 1, width : t1},
        { targets : 2, width : t2}
      ],
      select: {
      style:    'os',
      },
      order: [[ order, 'desc' ]]
});

$('#dataTable tbody tr').addClass('hover');
