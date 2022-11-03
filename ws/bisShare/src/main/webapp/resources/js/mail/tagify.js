
let mailList;
$.ajax({
    type: "get",
    url: `${root}/employee/getList`,
    dataType:"json",
    success: function (response) {
        createTag(response);
    }
});


function tagTemplate(tagData){
    return `
        <tag title="${tagData.email}"
                contenteditable='false'
                spellcheck='false'
                tabIndex="-1"
                class="tagify__tag ${tagData.class ? tagData.class : ""}"
                ${this.getAttributes(tagData)}>
            <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
            <div>
                <span class='tagify__tag-text'>${tagData.nick}</span>
            </div>
        </tag>
    `
}

function suggestionItemTemplate(tagData){
    return `
        <div ${this.getAttributes(tagData)}
            class='tagify__dropdown__item ${tagData.class ? tagData.class : ""}'
            tabindex="0"
            role="option">
            <strong>${tagData.nick}</strong>
            <div>
            ${tagData.rankName}
            </div>
            <span>${tagData.email}</span>
        </div>
    `
}

function dropdownHeaderTemplate(suggestions){
    return `
        <header data-selector='tagify-suggestions-header' class="${this.settings.classNames.dropdownItem} ${this.settings.classNames.dropdownItem}__addAll">
            <div>
                <strong>${this.value.length ? `Add Remaning` : 'Add All'}</strong>
                <a class='remove-all-tags'>Remove all</a>
            </div>
            <span>${suggestions.length} members</span>
        </header>
    `
}

function createTag(mailList) {
    let inputElm = document.querySelector('input[name=receive]');
    // initialize Tagify on the above input node reference
    var tagify1 = new Tagify(inputElm, {
        tagTextProp: 'nick', // very important since a custom template is used with this property as text
        // enforceWhitelist: true,
        skipInvalid: true, // do not remporarily add invalid tags
        dropdown: {
            maxItems : 999,
            closeOnSelect: false,
            enabled: 0,
            classname: 'users-list',
            searchKeys: ['nick', 'email']  // very important to set by which keys to search for suggesttions when typing
        },
        templates: {
            tag: tagTemplate,
            dropdownItem: suggestionItemTemplate,
            dropdownHeader: dropdownHeaderTemplate
        },
        whitelist: mailList,
        transformTag: (tagData, originalData) => {
            var {nick, email} = parseFullValue(tagData.nick)
            tagData.nick = nick
            tagData.email = email || tagData.email
        },
    
        validate({nick, email}) {
            // when editing a tag, there will only be the "name" property which contains name + email (see 'transformTag' above)
            if( !email && nick ) {
                var parsed = parseFullValue(nick)
                nick = parsed.nick
                email = parsed.email
            }
    
            if( !nick ) return "Missing name"
            if( !validateEmail(email) ) return "Invalid email"
    
            return true;
        }
    })
    
    // The below part is only if you want to split the users into groups, when rendering the suggestions list dropdown:
    // (since each user also has a 'team' property)
    tagify1.dropdown.createListHTML = sugegstionsList  => {
        const teamsOfUsers = sugegstionsList.reduce((acc, suggestion) => {
            const team = suggestion.deptName || 'Not Assigned';
            if( !acc[team] )
                acc[team] = [suggestion]
            else
                acc[team].push(suggestion)

            return acc
        }, {})

        const getUsersSuggestionsHTML = teamUsers => teamUsers.map((suggestion, idx) => {
            if( typeof suggestion == 'string' || typeof suggestion == 'number' ) {
                suggestion = {value:suggestion}
            }

            var value = tagify1.dropdown.getMappedValue.call(tagify1, suggestion)
            suggestion.value = value && typeof value == 'string' ? escapeHTML(value) : value

            return tagify1.settings.templates.dropdownItem.apply(tagify1, [suggestion]);
        }).join("")


        // assign the user to a group
        return Object.entries(teamsOfUsers).map(([team, teamUsers]) => {
            return `<div class="tagify__dropdown__itemsGroup" data-title="Team ${team}:">${getUsersSuggestionsHTML(teamUsers)}</div>`
        }).join("")
    }

    // attach events listeners
    tagify1.on('dropdown:select', onSelectSuggestion1) // allows selecting all the suggested (whitelist) items
        .on('edit:start', onEditStart1)  // show custom text in the tag while in edit-mode

    function onSelectSuggestion1(e){
        if( e.detail.event.target.matches('.remove-all-tags')) {
            tagify1.removeAllTags()
        }
    
        // custom class from "dropdownHeaderTemplate"
        else if( e.detail.elm.classList.contains(`${tagify1.settings.classNames.dropdownItem}__addAll`) )
            tagify1.dropdown.selectAll();
    }
    
    function onEditStart1({detail:{tag, data}}){
        tagify1.setTagTextNode(tag, `${data.nick} <${data.email}>`)
    }

    let inputElm2 = document.querySelector('input[name=reference]');
    // initialize Tagify on the above input node reference
    var tagify2 = new Tagify(inputElm2, {
    tagTextProp: 'nick', // very important since a custom template is used with this property as text
    // enforceWhitelist: true,
    skipInvalid: true, // do not remporarily add invalid tags
    dropdown: {
        maxItems : 999,
        closeOnSelect: false,
        enabled: 0,
        classname: 'users-list',
        searchKeys: ['nick', 'email']  // very important to set by which keys to search for suggesttions when typing
    },
    templates: {
        tag: tagTemplate,
        dropdownItem: suggestionItemTemplate,
        dropdownHeader: dropdownHeaderTemplate
    },
    whitelist: mailList,
    transformTag: (tagData, originalData) => {
        var {nick, email} = parseFullValue(tagData.nick)
        tagData.nick = nick
        tagData.email = email || tagData.email
    },

    validate({nick, email}) {
        // when editing a tag, there will only be the "name" property which contains name + email (see 'transformTag' above)
        if( !email && nick ) {
            var parsed = parseFullValue(nick)
            nick = parsed.nick
            email = parsed.email
        }

        if( !nick ) return "Missing name"
        if( !validateEmail(email) ) return "Invalid email"

        return true
    }
})

    // The below part is only if you want to split the users into groups, when rendering the suggestions list dropdown:
    // (since each user also has a 'team' property)
    tagify2.dropdown.createListHTML = sugegstionsList  => {
        const teamsOfUsers = sugegstionsList.reduce((acc, suggestion) => {
            const team = suggestion.deptName || 'Not Assigned';
            if( !acc[team] )
                acc[team] = [suggestion]
            else
                acc[team].push(suggestion)

            return acc;
        }, {})

        const getUsersSuggestionsHTML = teamUsers => teamUsers.map((suggestion, idx) => {
            if( typeof suggestion == 'string' || typeof suggestion == 'number' ) {
                suggestion = {value:suggestion}
            }

            var value = tagify2.dropdown.getMappedValue.call(tagify2, suggestion)
            suggestion.value = value && typeof value == 'string' ? escapeHTML(value) : value

            return tagify2.settings.templates.dropdownItem.apply(tagify2, [suggestion]);
        }).join("")


        // assign the user to a group
        return Object.entries(teamsOfUsers).map(([team, teamUsers]) => {
            return `<div class="tagify__dropdown__itemsGroup" data-title="Team ${team}:">${getUsersSuggestionsHTML(teamUsers)}</div>`
        }).join("")
    }

    // attach events listeners
    tagify2.on('dropdown:select', onSelectSuggestion2) // allows selecting all the suggested (whitelist) items
        .on('edit:start', onEditStart2)  // show custom text in the tag while in edit-mode

    function onSelectSuggestion2(e){
        if( e.detail.event.target.matches('.remove-all-tags')) {
            tagify2.removeAllTags()
        }
    
        // custom class from "dropdownHeaderTemplate"
        else if( e.detail.elm.classList.contains(`${tagify2.settings.classNames.dropdownItem}__addAll`) )
            tagify2.dropdown.selectAll();
    }
    
    function onEditStart2({detail:{tag, data}}){
        tagify2.setTagTextNode(tag, `${data.nick} <${data.email}>`)
    }
}

function escapeHTML( s ){
    return typeof s == 'string' ? s
        .replace(/&/g, "&")
        .replace(/</g, "<")
        .replace(/>/g, ">")
        .replace(/"/g, "")
        .replace(/`|'/g, "'")
        : s;
}



// https://stackoverflow.com/a/9204568/104380
function validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

function parseFullValue(value) {
    // https://stackoverflow.com/a/11592042/104380
    var parts = value.split(/<(.*?)>/g),
        nick = parts[0].trim(),
        email = parts[1]?.replace(/<(.*?)>/g, '').trim();

    return {nick, email}
}




function escapeHTML( s ){
    return typeof s == 'string' ? s
        .replace(/&/g, "&")
        .replace(/</g, "<")
        .replace(/>/g, ">")
        .replace(/"/g, "")
        .replace(/`|'/g, "'")
        : s;
}



// https://stackoverflow.com/a/9204568/104380
function validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

function parseFullValue(value) {
    // https://stackoverflow.com/a/11592042/104380
    var parts = value.split(/<(.*?)>/g),
        nick = parts[0].trim(),
        email = parts[1]?.replace(/<(.*?)>/g, '').trim();

    return {nick, email}
}