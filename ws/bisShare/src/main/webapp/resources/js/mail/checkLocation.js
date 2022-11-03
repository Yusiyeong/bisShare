let refCheck = 0;

if (location.href.includes('receive')) {
    // 받은 메일
    refCheck = 0;
    document.querySelector('#nick').innerHTML = '발신';
    document.querySelector('#pageTitle').innerHTML = '받은 메일';
} else if (location.href.includes('reference')) {
    // 참조 메일
    refCheck = 1;
    document.querySelector('#nick').innerHTML = '발신';
    document.querySelector('#pageTitle').innerHTML = '참조 메일';
} else if (location.href.includes('send')) {
    // 보낸 메일
    refCheck = 2;
    document.querySelector('#nick').innerHTML = '수신';
    document.querySelector('#pageTitle').innerHTML = '보낸 메일';
} else if (location.href.includes('trashcan')) {
    // 휴지통
    refCheck = 3;
    document.querySelector('#nick').innerHTML = '발신';
    document.querySelector('#pageTitle').innerHTML = '휴지통';
} else if (location.href.includes('draft')) {
    // 임시보관함
    refCheck = 4;
    document.querySelector('#pageTitle').innerHTML = '임시 보관함';
} 

if(refCheck == 2) {
    document.querySelector('#navTrash').style.display = 'none';
    document.querySelector('#navReply').style.display = 'none';
}
if(refCheck == 3) {
    document.querySelector('#navReply').style.display = 'none';
    document.querySelector('#navPass').style.display = 'none';
}
if(refCheck == 4) {
    document.querySelector('#navPass').innerHTML = "이어쓰기"
    document.querySelector('#navReply').style.display = 'none';
}