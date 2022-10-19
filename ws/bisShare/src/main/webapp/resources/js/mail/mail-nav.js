const sendBtn = document.querySelector('#mail-send-btn');
const rightShow = document.querySelector('#right-show');

const mailWrite = document.querySelector('#mail-write');
const mailDetail = document.querySelector('#mail-detail');

mailWrite.style.display = 'none';
mailDetail.style.display = 'none';

sendBtn.addEventListener('click',() => {
    mailDetail.style.display = 'none';
    mailWrite.style.display = 'block';
})



function selectAll(check) {
    const checkboxes = document.querySelectorAll('input');
    checkboxes.forEach((e) => {
      e.checked = check.checked;
    });
}

function removeBtn() {
  const checked = document.querySelectorAll('input[type="checkbox"]:checked:not(.form-check-input):not(#checkAll)');
  let checkArr = [];
  checked.forEach((check)=> {
    checkArr.push(check.value);
  })
  removeAjax(checkArr);
}
function removeOneBtn() {
  let checkArr = [];
  checkArr.push(oneNo);
  removeAjax(checkArr);
}

function removeAjax(checkArr) {
  $.ajax({
    type: "get",
    url: `${root}/mail/delChecked`,
    data: {
      checkArr : checkArr
    },
    success: function (res) {
      if(res == 1) {
        location.reload();
      } else {
        alert('삭제 실패');
      }
    }
});
}