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
                    url : "/test/mail/imgUpload",
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




let received = document.querySelector('[name="received"]');
let ref = document.querySelector('[name="ref"]');
new Tagify(received , {
    // 배열 형식으로 전달
    whitelist : ["foo", "bar", "baz"],
    dropdown : {
        // 보여줄 개수
        maxItems : 5,
        enabled : 0,
        // 선택하면 닫기
        closeOnSelect : false
    },
    // 이메일 형식만 받기
    pattern: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,


})

new Tagify(ref , {
    // 배열 형식으로 전달
    whitelist : ["foo", "bar", "baz"],
    dropdown : {
        // 보여줄 개수
        maxItems : 5,
        enabled : 0,
        // 선택하면 닫기
        closeOnSelect : false
    },
    // 이메일 형식만 받기
    pattern: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,


})