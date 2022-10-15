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