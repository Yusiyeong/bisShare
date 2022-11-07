function fileUpload(input) {
    const files = input.files;
    const formData = new FormData();
    for(var i = 0;i<files.length;i++) {
        formData.append('files',files[i]);
    }
    $.ajax({
        type: "post",
        url: `${root}/approval/fileUpload`,
        processData : false,
        contentType : false,
        enctype : 'multipart/form-data',
        data: formData,
        success: function (response) {
            const name = JSON.parse(response);
            for(var i = 0;i<name.length;i++) {
                console.log(name[i]);
                const uploadDiv = document.querySelector('#upload-files');
                const htmlTag = `
                <button type="button" class="btn btn-primary" onclick="delFile('${name[i].name}',this);">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-arrow-down" viewBox="0 0 16 16">
                        <path d="M8 5a.5.5 0 0 1 .5.5v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 1 1 .708-.708L7.5 9.293V5.5A.5.5 0 0 1 8 5z">
                        </path>
                        <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z">
                        </path>
                    </svg>
                    ${name[i].originName}
                    <input type="hidden" value="${name[i].name}-${name[i].originName}" name="fileNames" class="fileNames">
                </button>
                `
    
                uploadDiv.innerHTML += htmlTag;
            }
        }
    });

    input.value = '';
}

function delFile(f,btn) {
    $.ajax({
        type: "post",
        url: `${root}/approval/delFile`,
        data: {
            fileName : f
        },
        success: function (response) {
            btn.remove();
        }
    });
}


