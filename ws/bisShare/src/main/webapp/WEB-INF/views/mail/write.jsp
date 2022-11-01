<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<style>

.tagify__input {
	min-width: 400px;
}

:root {
    --tagify-dd-item-pad: .5em .7em;
}

.tagify__dropdown.users-list .tagify__dropdown__item{
    display: grid;
    grid-template-columns: auto 1fr;
    gap: 0 1em;
    grid-template-areas: "avatar name"
                        "avatar email";
}

.tagify__dropdown.users-list .tagify__dropdown__item:hover .tagify__dropdown__item__avatar-wrap{
    transform: scale(1.2);
}

.tagify__dropdown.users-list .tagify__dropdown__item__avatar-wrap{
    grid-area: avatar;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    overflow: hidden;
    background: #EEE;
    transition: .1s ease-out;
}

.tagify__dropdown.users-list img{
    width: 100%;
    vertical-align: top;
}

.tagify__dropdown.users-list header.tagify__dropdown__item > div,
.tagify__dropdown.users-list .tagify__dropdown__item strong{
    grid-area: name;
    width: 100%;
    align-self: center;
}

.tagify__dropdown.users-list span{
    grid-area: email;
    width: 100%;
    font-size: .9em;
    opacity: .6;
}

.tagify__dropdown.users-list .tagify__dropdown__item__addAll{
    border-bottom: 1px solid #DDD;
    gap: 0;
}

.tagify__dropdown.users-list .remove-all-tags{
    float: right;
    font-size: .8em;
    padding: .2em .3em;
    border-radius: 3px;
    user-select: none;
}

.tagify__dropdown.users-list .remove-all-tags:hover{
    color: white;
    background: salmon;
}


/* Tags items */
#users-list .tagify__tag{
    white-space: nowrap;
}

#users-list .tagify__tag img{
    width: 100%;
    vertical-align: top;
    pointer-events: none;
}


#users-list .tagify__tag:hover .tagify__tag__avatar-wrap{
    transform: scale(1.6) translateX(-10%);
}

#users-list .tagify__tag .tagify__tag__avatar-wrap{
    width: 16px;
    height: 16px;
    white-space: normal;
    border-radius: 50%;
    background: silver;
    margin-right: 5px;
    transition: .12s ease-out;
}

.users-list .tagify__dropdown__itemsGroup:empty{
    display: none;
}

.users-list .tagify__dropdown__itemsGroup::before{
    content: attr(data-title);
    display: inline-block;
    font-size: .9em;
    padding: 4px 6px;
    margin: var(--tagify-dd-item-pad);
    font-style: italic;
    border-radius: 4px;
    background: #00ce8d;
    color: white;
    font-weight: 600;
}

.users-list .tagify__dropdown__itemsGroup:not(:first-of-type){
    border-top: 1px solid #DDD;
}

.rankTag {
	justify-self: end;
}
</style>

<form class="user" id="mail-write" method="post" enctype="multipart/form-data"  action="${root}/mail/write">
	<div class="form-group">
		<div class="text-truncate align-">받는 사람</div>
		<input name="receive" required>
	</div>
	<div class="form-group">
		<div class="text-truncate align-">참조</div>
		<input name="reference">
	</div>
	<div class="form-group">
		<div class="text-truncate align-">제목</div>
		<input class="form-control" placeholder="제목" name="title" required>
	</div>
	<div class="form-group custom-file mb-3">
		<input type="file" class="form-control custom-file-input" id="customFile" name="file" multiple onchange="fileUpload(this);">
		<label class="custom-file-label" for="customFile">파일선택</label>
	</div>
	<div class="form-group mb-3" id="upload-files">
        
    </div>
	<div class="form-group">
		<textarea id="mail-content" name="content"></textarea>
	</div>


	<button type="submit" class="btn btn-primary btn-user btn-block">전송</button>
    <button type="button" class="btn btn-primary btn-user btn-block" onclick="saveDraft(this.form);">임시저장</button>
</form>
