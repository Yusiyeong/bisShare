const sendBtn = document.querySelector('#mail-send-btn');
const rightShow = document.querySelector('#right-show');

const mailWrite = document.querySelector('#mail-write');
const mailDetail = document.querySelector('#mail-detail');

mailWrite.style.display = 'none';
mailDetail.style.display = 'none';

sendBtn.addEventListener('click',() => {
    mailDetail.style.display = 'none';
    mailWrite.style.display = 'block';

    document.querySelector('input[name=receive]').value = "";
    document.querySelector('input[name=reference]').value = "";
    document.querySelector('input[name=title]').value = "";
    document.querySelector('#upload-files').innerHTML = "";

    $('#mail-content').summernote('reset');
})



function selectAll(check) {
    const checkboxes = document.querySelectorAll('input');
    checkboxes.forEach((e) => {
      e.checked = check.checked;
    });
}

function removeBtn() {
  if(refCheck == 2) {
    alert("보낸 메일은 삭제할 수 없습니다.");
    return false;
  }
  if(refCheck == 3) {
    if(confirm('정말 삭제하시겠습니까?')) {
      const checked = document.querySelectorAll('input[type="checkbox"]:checked:not(.form-check-input):not(#checkAll)');
      let checkArr = [];
      checked.forEach((check)=> {
        checkArr.push(check.value);
      })
      removeAjax(checkArr);
    }
  } else {
    const checked = document.querySelectorAll('input[type="checkbox"]:checked:not(.form-check-input):not(#checkAll)');
    let checkArr = [];
    checked.forEach((check)=> {
      checkArr.push(check.value);
    })
    removeAjax(checkArr);
  }
}
function removeOneBtn() {
  let checkArr = [];
  checkArr.push(oneNo);
  removeAjax(checkArr);
}

function removeAjax(checkArr) {
  let delUrl = `${root}/mail/delChecked/${refCheck}`;
  if (refCheck == 4) {
    delUrl = `${root}/mail/delCheckedDraft`
  }
  $.ajax({
    type: "get",
    url: delUrl,
    data: {
      checkArr : checkArr
    },
    success: function (res) {
        location.reload();
    }
});
}

function replyBtn() {
  const sendInfo = document.querySelector('#detail-send').innerHTML;
  mailDetail.style.display = 'none';
  mailWrite.style.display = 'block';
  document.querySelector('input[name=receive]').value = sendInfo;
}

function passBtn() {
  const sendInfo = document.querySelector('#detail-send').innerHTML;
  const refInfo = document.querySelector('#detail-ref').innerHTML;
  const titleInfo = document.querySelector('#detail-title').innerHTML;
  const contentInfo = document.querySelector('#detail-content').innerText;
  const fileInfo = document.querySelector('#receivedFiles').innerHTML;

  mailDetail.style.display = 'none';
  mailWrite.style.display = 'block';
  document.querySelector('input[name=receive]').value = sendInfo;
  document.querySelector('input[name=reference]').value = refInfo;
  document.querySelector('input[name=title]').value = titleInfo;
  document.querySelector('#upload-files').innerHTML = fileInfo;

  $('#mail-content').summernote('editor.insertText', contentInfo);
}

