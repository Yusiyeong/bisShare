$('#mail-content').summernote({
    height : 400,
    tabsize : 2,
    spellCheck : true,
    toolbar : [
                // [groupName, [list of button]]
        [ 'fontname',[ 'fontname' ] ],
        [ 'fontsize',[ 'fontsize' ] ],
        ['style',['bold','italic','underline','strikethrough','clear' ] ],
        [ 'color', [ 'color' ] ],
        [ 'para',[ 'paragraph' ] ],
        [ 'height',[ 'height' ] ],
        ['insert',[ 'picture','link' ] ],
        [ 'view', [ 'help' ] ],
        [ 'misc',[ 'codeview' ] ] ],
    fontNames : [ '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
    fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72' ],
    callbacks : { 
        onImageUpload : function (files) {
            let reader = new FileReader();
            reader.readAsDataURL(files[0]);
            reader.onload = function () {
                const url = reader.result;
                $.ajax({
                    data : {img : url},
                    url : root+"/mail/imgUpload",
                    method : "post",
                    success : function(path) {
                        console.log('success');
                        const imgNode = document.createElement('img');
                        imgNode.setAttribute('src',path);

                        $('#mail-content').summernote('insertNode',imgNode);
                    }
                })
            }
        }
    }
});

function saveDraft(form) {
    form.action = `${root}/mail/draft`;
    form.submit();
    return true;
}


