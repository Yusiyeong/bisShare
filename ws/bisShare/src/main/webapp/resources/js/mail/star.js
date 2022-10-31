// 중요 표시 별 on/off
if(refCheck!=4) {
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
}
