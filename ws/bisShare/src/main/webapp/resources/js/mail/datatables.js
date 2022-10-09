// Call the dataTables jQuery plugin
$(document).ready(function() {
  const table = $('#dataTable').DataTable({
        scrollCollapse: true,
        paging: false,
        columnDefs: [ {
            orderable: false,
            className: 'select-checkbox',
            type : "numeric-comma",
            targets: 0
          } ,
          { targets : 0, width : 70},
          { targets : 1, width : 50},
          { targets : 2, width : 50},
          { targets : 4, width : 50},
          { targets : 5, width : 200}
        ],
        select: {
        style:    'os',
        selector: 'td:first-child'
        },
        order: [[ 5, 'desc' ]]
  });

  $('#dataTable tbody').on('click','tr td:nth-child(4)', function() {
    const data = table.row(this).data();
    alert(data[1]);
  });

});

function selectAll(check) {
  const checkboxes = document.querySelectorAll('input');
  checkboxes.forEach((e) => {
    e.checked = check.checked;
  });
}