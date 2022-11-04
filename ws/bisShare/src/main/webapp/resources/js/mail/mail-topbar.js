$.ajax({
    type: "post",
    dataType : "json",
    url: `${root}/mail/unreadMailList`,
    success: function (unreadList) {
        let mailDropdown = document.querySelector('#mail-dropdown');
        for(let i in unreadList) {
            mailDropdown.innerHTML += `
            <a class="dropdown-item d-flex align-items-center" href="${root}/mail/receive/${unreadList[i].mailNo}"
                id="dropMailNo${unreadList[i].mailNo}">
                <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="${root}/resources/img/undraw_profile_1.svg"
                        alt="...">
                    <div class="status-indicator bg-success"></div>
                </div>
                <div class="font-weight-bold">
                    <div class="text-truncate">${unreadList[i].title}</div>
                    <div class="small text-gray-500">${unreadList[i].send} · ${unreadList[i].enrollDate}</div>
                </div>
            </a>
            `
        }
    }
});

$.ajax({
    type: "get",
    url: `${root}/mail/updateCnt`,
    success: function (response) {
    document.querySelector('#mail-dropdown-cnt').innerHTML = response;
    if(response == 0) {
        document.querySelector('#mail-dropdown-cnt').style.display = 'none';
      }else {
        document.querySelector('#mail-dropdown-cnt').style.display = 'block';
      }
    }
});
